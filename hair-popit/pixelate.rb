#####
#   downsample (pixelate) images
#       from 206x206 to 24x24


require 'pixelart'


ids = [
  12173,
  16010,
  16373,
  1878,
  3822,
  3836,
  4937,
  5832,
  6830,
  7880,
]

steps = Image.calc_sample_steps( 206, 24 )

ids.each do |id|

  img = Image.read( "./tmp/#{id}.png" )

  img = img.pixelate( steps )
  img.save( "./tmp2/#{id}.png" )
end


puts "bye"
