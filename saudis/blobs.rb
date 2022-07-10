$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'


blobs = %w[

]


blobs.each_with_index do |blob,i|
   img = Image.parse_base64( blob )
   img.save( "./tmp/blob/blob#{i}.png" )
   img.zoom(8).save( "./tmp/blob/blob#{i}@8x.png" )
end


puts "bye"

