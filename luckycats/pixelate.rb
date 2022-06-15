#####
#   downsample (pixelate) images
#       from 1280x1280 to 32x32  (40x)



require 'pixelart'


colors = %w[
  black
  purple
  blue
  green
  red
  pink
  orange
  yellow
  white
]


steps = Image.calc_sample_steps( 1280, 32 )  ## from 1280x1280 to 32x32

colors.each do |color|

  img = Image.read( "./tmp/#{color}.png" )

  img = img.pixelate( steps )
  img.save( "./32x32/luckycat-#{color}.png" )
end


puts "bye"