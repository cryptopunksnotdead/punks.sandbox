
require 'pixelart'


punks = ImageComposite.new( 10, 9 )   ## 10x9 = 90


files = Dir.glob( "./thecryptogenius/ii/*.png" )
puts "#{files.size} file(s)"

ids = files.map { |file| File.basename(file,'.*').to_i }
ids = ids.sort
puts ids.inspect


ids.each do |id|
  puts "==> #{id}"
  img = Image.read( "./thecryptogenius/ii/#{id}.png")

  punks << img
end

punks.save( "./thecryptogenius/i/genius.png" )
punks.zoom(2).save( "./thecryptogenius/i/genius@2x.png" )
punks.zoom(4).save( "./thecryptogenius/i/genius@4x.png" )

puts "bye"

