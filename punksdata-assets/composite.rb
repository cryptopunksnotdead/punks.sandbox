require 'pixelart'


require_relative '../punksdata/punksdata'



assets = ImageComposite.new( 10, 14 )   # use grid 10x14 = 140 attributes / tiles



hex = COLORS_ENCODED
colors = decode_colors( hex )



ASSETS_ENCODED.each do |rec|
  hex  = rec[:hex]

  img = decode_image( hex, colors: colors )

  assets << img
end


assets.save( "i/assets.png" )
assets.zoom(2).save( "i/assets@2x.png" )


####
#  split male / female into two packs

##  1) male
##     4+3  archetype base heads
##      63  attributes
##   => 70 total

assets = ImageComposite.new( 10, 7 )   # use grid 10x7 = 70 attributes / tiles max.

(ASSETS_ENCODED[0..3]+ASSETS_ENCODED[8..73]).each do |rec|
  hex  = rec[:hex]

  img = decode_image( hex, colors: colors )

  assets << img
end

assets.save( "i/assets_male.png" )
assets.zoom(2).save( "i/assets_male@2x.png" )

##  2) female
##      4 archetype base heads
##     59 attributes
##  => 63 total

assets = ImageComposite.new( 10, 7 )   # use grid 10x8 = 70 attributes / tiles max.


(ASSETS_ENCODED[4..7]+ASSETS_ENCODED[74..132]).each do |rec|
  hex  = rec[:hex]

  img = decode_image( hex, colors: colors )

  assets << img
end

assets.save( "i/assets_female.png" )
assets.zoom(2).save( "i/assets_female@2x.png" )






archetypes = ImageComposite.new( 11, 1 )   # use grid11x1

ASSETS_ENCODED[0,11].each do |rec|
  hex  = rec[:hex]

  img = decode_image( hex, colors: colors )

  archetypes << img
end


archetypes.save( "i/archetypes-strip.png" )
archetypes.zoom(3).save( "i/archetypes-strip@3x.png" )



puts "bye"

