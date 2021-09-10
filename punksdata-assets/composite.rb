require 'pixelart'

require_relative 'punksdata'




assets = ImageComposite.new( 10, 14 )   # use grid 10x14 = 140 attributes / tiles



hex = COLORS_ENCODED
colors = decode_colors( hex )



ASSETS_ENCODED.each do |rec|
  hex  = rec[2]

  img = decode_image( hex, colors: colors )

  assets << img
end


assets.save( "i/assets.png" )
assets.zoom(2).save( "i/assets2x.png" )



archetypes = ImageComposite.new( 11, 1 )   # use grid11x1

ASSETS_ENCODED[0,11].each do |rec|
  hex  = rec[2]

  img = decode_image( hex, colors: colors )

  archetypes << img
end


archetypes.save( "i/archetypes-strip.png" )
archetypes.zoom(3).save( "i/archetypes-strip3x.png" )



puts "bye"

