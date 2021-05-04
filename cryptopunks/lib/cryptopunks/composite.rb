module Cryptopunks
  class Image
  class Composite    ## nest Composite inside Image - why? why not?


    def self.read( path='./punks.png' )
      data = File.open( path, 'rb' ) { |f| f.read }
      new( data )
    end


    PUNK_HEIGHT = 24
    PUNK_WIDTH  = 24

    PUNK_HASH   = 'ac39af4793119ee46bbff351d8cb6b5f23da60222126add4268e261199a2921b'


    def initialize( data )
      @punks = ChunkyPNG::Image.from_blob( data )
      puts "     #{@punks.height}x#{@punks.width} (height x width)"

      @punk_rows  = @punks.width  / PUNK_WIDTH    ## e.g. 2400/24 = 100
      @punk_cols  = @punks.height / PUNK_HEIGHT   ## e.g. 2400/24 = 100
      @punk_count = @punk_rows * @punk_cols       ## ## 10000 = 100x100  (2400x2400 pixel)

      ## check sha256 checksum
      @hexdigest = sha256( data )
      if original?
         puts "     >#{@hexdigest}< SHA256 hash matching"
         puts "         ✓ True Official Genuine CryptoPunks™ verified"
      end
    end


    def sha256( data )
      ## todo/check: or just use Digest::SHA256.hexdigest - why? why not?
      Digest::SHA256.digest( data ).unpack( 'H*' )[0]
    end


    def hexdigest()  @hexdigest end

    def verify?()  @hexdigest == PUNK_HASH; end
    alias_method :genuine?,  :verify?
    alias_method :original?, :verify?



    def size() @punk_count; end


    def punk( index )
      y, x = index.divmod( @punk_rows )
      img = @punks.crop( x*PUNK_WIDTH, y*PUNK_HEIGHT, PUNK_WIDTH, PUNK_HEIGHT )
      Pixelart::Image.new( img.width, img.height, img )  ## wrap in pixelart image
    end
    alias_method :[], :punk


    ####
    # more image helpers / delegates
    def width()   @punks.width; end
    def height()  @punks.height; end

    def pixels()  @punks.pixels; end

  end ## class Composite
  end ## class Image
end ## module Cryptopunks
