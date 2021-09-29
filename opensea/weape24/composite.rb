
require 'pixelart'


punks = ImageComposite.new( 100, 99, width: 28, height: 28 )   ## 100x99 = 9900


files = Dir.glob( "./weape24/ii/*.png" )
puts "#{files.size} file(s)"

ids = files.map { |file| File.basename(file,'.*').to_i }
ids = ids.sort
puts ids.inspect


ids.each do |id|
  puts "==> #{id}"
  img = Image.read( "./weape24/ii/#{id}.png")

  punks << img
end

punks.save( "./weape24/boredapes.png" )
punks.zoom(2).save( "./weape24/boredapes2x.png" )

puts "bye"

