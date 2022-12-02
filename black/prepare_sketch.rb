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

  sketch = img.sketch( 1, line: 1 )
  sketch.save( "./tmp/sketch/punk#{i}-sketch.png" )
  sketch = img.sketch( 20, line: 4 )
  sketch.save( "./tmp/sketch2/punk#{i}-sketch@20x.png" )
end

puts
specs.size.times do |i|
  puts "![](i/punk#{i}-sketch.png)"
end


puts "bye"


