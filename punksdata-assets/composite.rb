require 'pixelart'

require_relative 'punksdata'




assets = ImageComposite.new( 10, 14 )   # use grid 10x14 = 140 attributes / tiles



hex = COLORS_ENCODED
colors = decode_colors( hex )



ASSETS_ENCODED.each do |rec|
  num  = rec[0]
  name = rec[1]
  hex  = rec[2]

  img = decode_image( hex, colors: colors )

  assets << img
end


assets.save( "i/assets.png" )
assets.zoom(2).save( "i/assets2x.png" )


puts "bye"

