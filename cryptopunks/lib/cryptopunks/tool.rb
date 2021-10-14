module Cryptopunks



class Tool
  def run( args )
    Toolii.run( args )
  end
end



class Opts
  def merge_gli_options!( options = {} )
    # puts "  update options:"
    # puts options.inspect

    @file     = options[:file]      if options[:file]
    @outdir   = options[:dir]       if options[:dir]

    @zoom     = options[:zoom]      if options[:zoom]
    @offset   = options[:offset]    if options[:offset]

    @verbose = true     if options[:verbose] == true
  end


  def verbose=(boolean)   # add: alias for debug ??
    @verbose = boolean
  end

  def verbose?
    return false if @verbose.nil?   # default verbose/debug flag is false
    @verbose == true
  end

  def file()    @file || './punks.png';  end
  def file?()   @file;  end    ## note: let's you check if file is set (or "untouched")

  def zoom()    @zoom || 1; end
  def zoom?()   @zoom;  end

  def offset()  @offset || 0; end
  def offset?() @offset;  end

  def outdir()  @outdir || '.'; end
  def outdir?() @outdir;  end
end # class Opts



## note: use gli "dsl" inside a class / namespace
class Toolii
   extend GLI::App

   opts = Opts.new


program_desc 'punk (or cryptopunk) command line tool'

version Cryptopunks::VERSION


desc "Zoom factor x2, x4, x8, etc."
arg_name 'ZOOM'
default_value opts.zoom
flag [:z, :zoom], type: Integer

desc "Start counting at offset"
arg_name 'NUM'
default_value opts.offset
flag [:offset], type: Integer

desc "Output directory"
arg_name 'DIR'
default_value opts.outdir
flag [:d, :dir,
      :o, :out, :outdir], type: String

### todo/check: move option to -t/--tile command only - why? why not?
desc "True Official Genuine CryptoPunks™ all-in-one composite image"
arg_name 'FILE'
default_value opts.file
flag [:f, :file], type: String



### global option (required)
## todo: add check that path is valid?? possible?
desc '(Debug) Show debug messages'
switch [:verbose], negatable: false    ## todo: use -w for short form? check ruby interpreter if in use too?



desc "Get punk characters via image tiles from all-in-one punk series composite (#{opts.file}) - for IDs use 0 to 9999"
command [:t, :tile] do |c|
  c.action do |g,o,args|

    # puts "opts:"
    # puts opts.inspect

    puts "==> reading >#{opts.file}<..."
    punks = ImageComposite.read( opts.file )


    puts "    setting zoom to #{opts.zoom}x"   if opts.zoom != 1

    ## make sure outdir exits (default is current working dir e.g. .)
    FileUtils.mkdir_p( opts.outdir )  unless Dir.exist?( opts.outdir )

    args.each_with_index do |arg,index|
      punk_index = arg.to_i( 10 )  ## assume base 10 decimal

      punk = punks[ punk_index ]

      punk_name = "punk-" + "%04d" % (punk_index + opts.offset)

      ##  if zoom - add x2,x4 or such
      if opts.zoom != 1
        punk = punk.zoom( opts.zoom )
        punk_name << "@#{opts.zoom}x"
      end

      path  = "#{opts.outdir}/#{punk_name}.png"
      puts "==> (#{index+1}/#{args.size}) saving punk ##{punk_index+opts.offset} to >#{path}<..."

      punk.save( path )
    end
    puts 'Done.'
  end # action
end # command tile



desc 'Generate punk characters from text attributes (from scratch / zero) via builtin punk spritesheet'
command [:g, :gen, :generate] do |c|
  c.action do |g,o,args|

    puts "==> generating  >#{args.join( ' + ' )}<..."
    punk = Image.generate( *args )

    puts "    setting zoom to #{opts.zoom}x"   if opts.zoom != 1

    ## make sure outdir exits (default is current working dir e.g. .)
    FileUtils.mkdir_p( opts.outdir )  unless Dir.exist?( opts.outdir )

    punk_index = 0    ## assume base 10 decimal
    punk_name = "punk-" + "%04d" % (punk_index + opts.offset)

    ##  if zoom - add x2,x4 or such
    if opts.zoom != 1
      punk = punk.zoom( opts.zoom )
      punk_name << "@#{opts.zoom}x"
    end

    path  = "#{opts.outdir}/#{punk_name}.png"
    puts "==> saving punk ##{punk_index+opts.offset} to >#{path}<..."

    punk.save( path )
    puts 'Done.'
  end # action
end # command generate


desc 'Query (builtin off-chain) punk contract for punk text attributes by IDs - use 0 to 9999'
command [:q, :query] do |c|
  c.action do |g,o,args|

    # puts "opts:"
    # puts opts.inspect

    args.each_with_index do |arg,index|
      punk_index = arg.to_i( 10 )  ## assume base 10 decimal

      puts "==> (#{index+1}/#{args.size}) punk ##{punk_index}..."

      attribute_names = CryptopunksData.punk_attributes( punk_index )
      ## downcase name and change spaces to underscore
      attribute_names = attribute_names.map do |name|
                          name.downcase.gsub( ' ', '_' )
                        end

      print "  "
      print attribute_names.join( '  ' )
      print "\n"
    end
    puts 'Done.'
  end
end



desc 'List all punk archetype and attribute names from builtin punk spritesheet'
command [:l, :ls, :list] do |c|
  c.action do |g,o,args|

    generator = Cryptopunks.generator

    puts "==> Archetypes"
    generator.meta.each do |rec|
      next unless rec.archetype?

      print "  "
      print "%-30s"  % "#{rec.name} / (#{rec.gender})"
      print " - #{rec.type}"
      print "\n"
    end

    puts ""
    puts "==> Attributes"
    generator.meta.each do |rec|
      next unless rec.attribute?

      print "  "
      print "%-30s"  % "#{rec.name} / (#{rec.gender})"
      print " - #{rec.type}"
      print "\n"
    end

    puts ""
    puts "  See github.com/cryptopunksnotdead/punks.spritesheet for more."
    puts ""

    puts 'Done.'
  end # action
end # command list



pre do |g,c,o,args|
  opts.merge_gli_options!( g )
  opts.merge_gli_options!( o )

  if opts.verbose?
    ## LogUtils::Logger.root.level = :debug
  end

  ## logger.debug "Executing #{c.name}"
  true
end

post do |global,c,o,args|
  ## logger.debug "Executed #{c.name}"
  true
end


on_error do |e|
  puts
  puts "*** error: #{e.message}"

  if opts.verbose?
    puts e.backtrace
  end

  false # skip default error handling
end


### exit run(ARGV)  ## note: use Toolii.run( ARGV ) outside of class
end   # class Toolii
end # module Cryptopunks


