require 'punks'


## turn first punks into default profile pics


background = '0xCCD5DE'
foreground = '0x647785'




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

  profilepic = img.silhouette( foreground ).background( background )
  profilepic.save( "./tmp/profilepic/default1-punk#{i}.png" )
  profilepic.zoom(4).save( "./tmp/profilepic2/default1-punk#{i}@4x.png" )
  profilepic.zoom(10).save( "./tmp/profilepic3/default1-punk#{i}@10x.png" )
end





puts "bye"