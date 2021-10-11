module Cryptopunks



class Image

def self.read( path )   ## convenience helper
  img = ChunkyPNG::Image.from_file( path )
  new( img )
end



### keep design & colors keyword args in c'tor here
##     or use parse() like in pixelart - why? why not?

def initialize( initial=nil, design: nil,
                             colors: nil )
    if initial
      ## pass image through as-is
      img = initial
    else
      ## note: unwrap inner image before passing on to super c'tor
      img = Pixelart::Image.parse( design, colors: colors ).image
    end

    super( img.width, img.height, img )
end



end  # class Image
end  # module Cryptopunks