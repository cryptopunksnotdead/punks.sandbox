require 'punks'


specs = parse_data( <<TXT )
  Female 2, Earring, Blonde Bob, Green Eye Shadow
  Male 1, Smile, Mohawk
  Female 3, Wild Hair
  Male 1, Wild Hair, Pipe, Nerd Glasses
  Male 2, Goat, Earring, Wild Hair, Big Shades
  Female 2, Earring, Half Shaved, Purple Eye Shadow
  Male 2, Do-rag
  Female 2, Spots, Wild White Hair, Clown Eyes Blue
  Male 1, Luxurious Beard, Messy Hair
  Male 2, Big Beard, Police Cap, Clown Nose
  Female 1, Mohawk, Blue Eye Shadow
  Female 2, Black Lipstick, Straight Hair Dark, Clown Eyes Green
  Female 1, Purple Lipstick, Blonde Short
TXT

pp specs

specs.each_with_index do |attributes,i|
  img = YeOldePunk::Image.generate( *attributes )
  img.save( "./tmp/yeoldepunk/yeoldepunk#{i}.png" )
  img.zoom(4).save( "./tmp/yeoldepunk2/yeoldepunk#{i}@4x.png" )

  silhouette = img.silhouette.background( 'white' )
  silhouette.save( "./tmp/silhouette/punk#{i}-silhouette.png" )
  silhouette.zoom(4).save( "./tmp/silhouette2/yeoldepunk#{i}@4x.png" )
end


puts
specs.size.times do |i|
  puts "![](i/yeoldpunk#{i}.png)"
end

puts
specs.size.times do |i|
  puts "![](i/punk#{i}-silhouette.png)"
end


puts "bye"