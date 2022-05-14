###########
#  little one-off quick&dirty helper script
#     to generate background images in 24x24
#
#  to run use:
#    ruby ./sandbox/generate.rb


$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'


img = Image.new( 24, 24 ).ukraine
img.save( "./tmp/flag_ukraine-24x24.png" )
img.zoom(10).save( "./tmp/flag_ukraine-240x240.png" )

img = Image.new( 24, 24 ).rainbow
img.save( "./tmp/flag_rainbow-24x24.png" )
img.zoom(10).save( "./tmp/flag_rainbow-240x240.png" )



puts "bye"