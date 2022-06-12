###
#  compare "classic" 4x with "low effort" hq4x

require 'pixelart'

punks = ImageComposite.new( 6, 3, width:  96,
                                  height: 96, background: '#fff' )


['4x', 'hq4x'].each do |algo|
   (0..5).each do |id|
      punks << Image.read( "./tmp/punk#{id}@#{algo}.png" )
   end
end

(0..5).each do |id|
  punks << Image.read( "./i/loweffortpunk#{id}-96x96.png" )
end

punks.save( "./tmp/loweffortpunks-side_by_side.png")

