###
#  compare "classic" 4x with "low effort" hq4x

require 'pixelart'

punks = ImageComposite.new( 6, 2, width:  96,
                                  height: 96 )


['4x', 'hq4x'].each do |algo|
   (0..5).each do |id|
      punks << Image.read( "./tmp/punk#{id}@#{algo}.png" )
   end
end

punks.save( "./tmp/loweffortpunks-side_by_side.png")

