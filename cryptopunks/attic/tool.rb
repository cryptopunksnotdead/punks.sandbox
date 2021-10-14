
class Tool
  def run( args )
    opts = { zoom: 1,
             outdir: '.',
             file:  './punks.png',
             offset: 0,
           }

    parser = OptionParser.new do |cmd|
      cmd.banner = "Usage: punk (or cryptopunk) [options] IDs"

      cmd.separator "  Mint punk characters from composite (#{opts[:file]}) - for IDs use 0 to 9999"
      cmd.separator ""
      cmd.separator "  Options:"

      cmd.on("-z", "--zoom=ZOOM", "Zoom factor x2, x4, x8, etc. (default: #{opts[:zoom]})", Integer ) do |zoom|
        opts[:zoom] = zoom
      end

      cmd.on("-d", "--dir=DIR", "Output directory (default: #{opts[:outdir]})", String ) do |outdir|
        opts[:outdir] = outdir
      end

      cmd.on("-f", "--file=FILE", "True Official Genuine CryptoPunks™ composite image (default: #{opts[:file]})", String ) do |file|
        opts[:file] = file
      end

      cmd.on("--offset=NUM", "Start counting at offset (default: #{opts[:offset]})", Integer ) do |offset|
        opts[:offset] = offset
      end

      cmd.on("-h", "--help", "Prints this help") do
        puts cmd
        exit
      end
    end

    parser.parse!( args )

    puts "opts:"
    pp opts

    puts "==> reading >#{opts[:file]}<..."
    punks = ImageComposite.read( opts[:file] )


    puts "    setting zoom to #{opts[:zoom]}x"   if opts[:zoom] != 1

    ## make sure outdir exits (default is current working dir e.g. .)
    FileUtils.mkdir_p( opts[:outdir] )  unless Dir.exist?( opts[:outdir] )

    args.each_with_index do |arg,index|
      punk_index = arg.to_i

      punk = punks[ punk_index ]

      punk_name = "punk-" + "%04d" % (punk_index + opts[:offset])

      ##  if zoom - add x2,x4 or such
      if opts[:zoom] != 1
        punk = punk.zoom( opts[:zoom] )
        punk_name << "x#{opts[:zoom]}"
      end

      path  = "#{opts[:outdir]}/#{punk_name}.png"
      puts "==> (#{index+1}/#{args.size}) minting punk ##{punk_index+opts[:offset]}; writing to >#{path}<..."

      punk.save( path )
    end

    puts "done"
  end  ## method run
end # class Tool
end ## module Cryptopunks

