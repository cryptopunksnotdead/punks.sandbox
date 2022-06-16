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

  7910,
  3897,
  7916,
  1953,
  4989,
  7907,
  4973,
  1974,
  7923,
  6929,
  9949,
  17218,
  1963,
  17205,
  14198,
  3883,
  19408,
  11493,
  315,
  10891,
  9183,
  19158,
  3593,
  614,
  13929,

]

steps_206x206 = Image.calc_sample_steps( 206, 24 )
steps_181x181 = Image.calc_sample_steps( 181, 24 )

ids.each do |id|

  img = Image.read( "./tmp/#{id}.png" )

  img = if img.width == 206 && img.height == 206
          img.pixelate( steps_206x206 )
        elsif img.width == 181 && img.height == 181
          img.pixelate( steps_181x181 )
        else
          puts "!! ERROR - unknown dimension #{img.width}x#{img.height}; sorry"
          exit 1
        end
  img.save( "./tmp2/#{id}.png" )
end


puts "bye"
