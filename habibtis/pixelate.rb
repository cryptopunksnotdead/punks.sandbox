require 'pixelart'


##
#  habibtis images see
#   https://opensea.io/collection/habibtis-of-arab-punkz  (21 items)
#   ...


names = %w[
  h1
  h2
]

steps = Image.calc_sample_steps( 576, 24 )

names.each do |name|
  outpath = "./tmp/24x24/#{name}.png"
  # next  if File.exist?( outpath )

  img = Image.read( "./tmp/#{name}.png" )

  img = if img.width == 576 && img.height == 576
             img.pixelate( steps )
        else
          puts "unknown dimension #{img.width}x#{img.height}"
          exit 1
        end
  img.save( outpath )
  img.zoom(8).save( "./tmp/24x24/#{name}@8x.png")
end

puts "bye"
