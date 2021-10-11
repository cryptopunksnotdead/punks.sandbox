module Cryptopunks
   ## note: was Image::Composite
  class ImageComposite  < Pixelart::ImageComposite

    PUNK_HASH   = 'ac39af4793119ee46bbff351d8cb6b5f23da60222126add4268e261199a2921b'

    def self.sha256( data )
      ## todo/check: or just use Digest::SHA256.hexdigest - why? why not?
      Digest::SHA256.digest( data ).unpack( 'H*' )[0]
    end


    PUNK_HEIGHT = 24
    PUNK_WIDTH  = 24

    def self.read( path='./punks.png', width: PUNK_WIDTH, height: PUNK_HEIGHT )
      data = File.open( path, 'rb' ) { |f| f.read }

      hexdigest = sha256( data )   ## check sha256 checksum
      if hexdigest == PUNK_HASH
         puts "     >#{hexdigest}< SHA256 hash matching"
         puts "         ✓ True Official Genuine CryptoPunks™ verified"
      else
         puts "         ✓ True Official Genuine Yes, You Can! Punks Not Dead™ verified"
      end

      img = ChunkyPNG::Image.from_blob( data )
      new( img, width: width, height: height )
    end


    def initialize( *args, width:  PUNK_WIDTH,
                           height: PUNK_HEIGHT )
      super
    end

  end ## class ImageComposite
end ## module Cryptopunks
