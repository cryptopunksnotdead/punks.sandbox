###########
#  little one-off quick&dirty helper script
#     to "downsample/pixelate" background images to 24x24
#
#  to run use:
#    ruby ./sandbox/pixelate.rb


$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'


names = [
  'backenza',
  'colorful',
  'matrix1',
  'matrix2',
  'matrix3',
  'midnight',
  'purple',
  'snowy',
  'swamp',
]

steps = Image.calc_sample_steps( 360, 24 )  ## from 360x360 to 24x24

names.each do |name|
  img = Image.read( "./tmp/#{name}-360x360.png" )

  img = img.pixelate( steps )
  img.save( "./tmp/#{name}-24x24.png")
  img.zoom( 10 ).save( "./tmp/#{name}-240x240.png")
end


puts "bye"