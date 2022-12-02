require 'pixelart'


composite = ImageComposite.read( "./tmp/bwpunks-24x24.png" )


composite.each_with_index do |img,i|
  puts "#{i+1}"

  img.save( "./tmp/bw/punk#{i+1}.png" )
  img.zoom(4).save( "./tmp/bw2/punk#{i+1}@4x.png" )
end

(1..150).each do |id|
  puts "![](1of1s.vol1/punk#{id}.png)"
end


puts "bye"