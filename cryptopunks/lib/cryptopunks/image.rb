module Cryptopunks


class Design   ## todo/fix - move to its own file!!!

end # class Design



##############
## todo/check:
##    find a better way to (auto?) include more designs?
class DesignSeries    ## find a better name for class (just use Series?) - why? why not?
  def self.build( dir )
    data = {}
    paths =  Dir.glob( "#{dir}/**.txt" )
    paths.each do |path|
      basename = File.basename( path, File.extname( path ) )
      text = File.open( path, 'r:utf-8' ) { |f| f.read }
      ## todo/check: auto-parse "ahead of time" here
      ##              or keep "raw" text - why? why not?
      data[ basename ] = text
    end
    data
  end

  def initialize( dir )
    @dir = dir  # e.g. "#{Cryptopunks.root}/config/more"
  end

  def data
    ## note: lazy load / build on first demand only
    @data ||= self.class.build( @dir )
  end

  def [](key) data[ key ]; end
  def size()    data.size; end
  def keys()    data.keys; end
  def to_h()    data; end    ## todo/check: use to_hash() - why? why not?
end   # class DesignSeries



class Image

def self.read( path )   ## convenience helper
  img = ChunkyPNG::Image.from_file( path )
  new( img )
end


def initialize( initial=nil, design: nil,
                             colors: nil )
    if initial
      ## pass image through as-is
      img = inital
    else

      ## todo/fix:
      ## move design code into design class!!!
      ##  for now assume design is a string
      ##   split into parts
      ##       original/alien-male or original@alien-male
      ##       more/alien-female or more@alien-female
      ##       original/human-male+darker or original@human-male!darker ????
      ##        human-male!darker ?????
      ##    keep @ as separator too - why? why not?
      parts = design.split( %r{[@/]} )
      parts.unshift( '*' )    if parts.size == 1  ## assume "all-in-one" series (use * as name/id/placeholder)

      series_key        = parts[0]
      design_composite  = parts[1]

      ## todo/check - find a way for unambigious (color) variant key
      ##   use unique char e.g. +*!# or such
      more_parts = design_composite.split(  %r{[!+]} )
      design_key   = more_parts[0]
      variant_key  = more_parts[1]     ## color variant for now (for humans) e.g. lighter/light/dark/darker

      series = if ['*','**','_','__'].include?( series_key )
                  DESIGNS    ## use all-series-in-one collection
               else
                  case series_key
                  when 'original' then DESIGNS_ORIGINAL
                  when 'more'     then DESIGNS_MORE
                  else  raise ArgumentError, "unknown design series >#{series_key}<; sorry"
                  end
               end

      design = series[ design_key ]
      raise ArgumentError, "unknow design >#{design_key}< in series >#{series_key}<; sorry"  if design.nil?

      if colors.nil?  ## try to auto-fill in colors
         ##  note: (auto-)remove _male,_female qualifier if exist
         colors_key = design_key.sub( '-male', '' ).sub( '-female', '' )
         colors =  COLORS[ colors_key ]

         ## allow / support color scheme variants (e.g. lighter/light/dark/darker) etc.
         if colors.is_a?(Hash)
           if variant_key
             colors = colors[ variant_key ]
             raise ArgumentError, "no colors defined for variant >#{variant_key}< for design >#{design_key}< in series >#{series_key}<; sorry"   if colors.nil?
           else  ## note: use (fallback to) first color scheme if no variant key present
             colors = colors[ colors.keys[0] ]
           end
         end

         raise ArgumentError, "no (default) colors defined for design >#{design_key}< in series >#{series_key}<; sorry"   if colors.nil?
      end

      ## note: unwrap inner image before passing on to super c'tor
      img = Pixelart::Image.parse( design, colors: colors ).image
    end

    super( img.width, img.height, img )
end



end  # class Image
end  # module Cryptopunks