
require 'pixelart'


punks = ImageComposite.new( 100, 99 )   ## 100x99 = 9900


files = Dir.glob( "./24px/ii/*.png" )
puts "#{files.size} file(s)"

ids = files.map { |file| File.basename(file,'.*').to_i }
ids = ids.sort
puts ids.inspect


ids.each do |id|
  puts "==> #{id}"
  img = Image.read( "./24px/ii/#{id}.png")

  punks << img
end

punks.save( "./24px/coolcats-test.png" )
punks.zoom(2).save( "./24px/coolcats2x-test.png" )

puts "bye"

