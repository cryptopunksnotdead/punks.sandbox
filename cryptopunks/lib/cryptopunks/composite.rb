module Cryptopunks
  class Image
  class Composite    ## nest Composite inside Image - why? why not?

    PUNK_HASH   = 'ac39af4793119ee46bbff351d8cb6b5f23da60222126add4268e261199a2921b'

    def self.sha256( data )
      ## todo/check: or just use Digest::SHA256.hexdigest - why? why not?
      Digest::SHA256.digest( data ).unpack( 'H*' )[0]
    end


    PUNK_HEIGHT = 24
    PUNK_WIDTH  = 24

    def self.read( path='./punks.png' )
      data = File.open( path, 'rb' ) { |f| f.read }

      hexdigest = sha256( data )   ## check sha256 checksum
      if hexdigest == PUNK_HASH
         puts "     >#{hexdigest}< SHA256 hash matching"
         puts "         ✓ True Official Genuine CryptoPunks™ verified"
      else
         puts "         ✓ True Official Genuine Yes, You Can! Punks Not Dead™ verified"
      end

      img = ChunkyPNG::Image.from_blob( data )
      new( nil, nil, img )
    end


    def initialize( cols=3, rows=3, initial=nil )
      ## todo/check - find a better name for cols/rows - why? why not?
      if initial
        ## pass image through as-is
        @punks = initial

        @punk_rows  = @punks.width  / PUNK_WIDTH    ## e.g. 2400/24 = 100
        @punk_cols  = @punks.height / PUNK_HEIGHT   ## e.g. 2400/24 = 100
        @punk_count = @punk_rows * @punk_cols       ## ## 10000 = 100x100  (2400x2400 pixel)
      else
        @punk_rows = rows
        @punk_cols = cols
        @punks = ChunkyPNG::Image.new( @punk_cols * PUNK_WIDTH,
                                       @punk_rows * PUNK_HEIGHT )
        @punk_count = 0   # (track) current index (of added images)
      end

      puts "     #{@punks.height}x#{@punks.width} (height x width)"
    end


    def count() @punk_count; end
    alias_method :size, :count   ## add size alias (confusing if starting with 0?) - why? why not?


    def punk( index )
      y, x = index.divmod( @punk_rows )
      img = @punks.crop( x*PUNK_WIDTH, y*PUNK_HEIGHT, PUNK_WIDTH, PUNK_HEIGHT )
      Pixelart::Image.new( img.width, img.height, img )  ## wrap in pixelart image
    end
    alias_method :[], :punk


    def add( image )
      y, x =  @punk_count.divmod( @punk_cols )

      puts "    [#{@punk_count}] @ (#{x}/#{y}) #{image.width}x#{image.height} (height x width)"

      ## note: image.image  - "unwrap" the "raw" ChunkyPNG::Image
      @punks.compose!( image.image, x*PUNK_WIDTH, y*PUNK_HEIGHT )
      @punk_count += 1
    end
    alias_method :<<, :add



    ####
    # more image helpers / delegates
    def width()   @punks.width; end
    def height()  @punks.height; end

    def pixels()  @punks.pixels; end

    def save( path, constraints = {} )
       # step 1: make sure outdir exits
       outdir = File.dirname( path )
       FileUtils.mkdir_p( outdir )  unless Dir.exist?( outdir )

       # step 2: save
       @punks.save( path, constraints )
    end
    alias_method :write, :save

  end ## class Composite
  end ## class Image
end ## module Cryptopunks
