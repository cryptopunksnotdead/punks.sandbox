require 'punks'


## turn first punks into default profile pics


background1 = '0xCCD5DE'
foreground1 = '0x647785'

background2 = '0xA0C2FF'
foreground2 = '0x4474E0'

background3 = '0xB5C3DE'
foreground3 = '0xFFFFFF'

background4 = '0x2FB166'
foreground4 = '0xFFFFFF'


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
  Female 3, Black Lipstick, Straight Hair Blonde, Big Shades
  Female 1, Hot Lipstick, Pilot Helmet, Pipe
  Male 4, Luxurious Beard, Wild Hair, Regular Shades
  Male 2, Earring, Stringy Hair, Small Shades
  Male 3, Frown, Mohawk
  Male 2, Muttonchops, Eye Mask
  Female 1, Hot Lipstick, Bandana, Horned Rim Glasses
  Male 3, Crazy Hair
  Male 3, Earring, Messy Hair, Classic Shades
  Female 1, Purple Lipstick, Pilot Helmet
  Male 3, Handlebars, Earring, Do-rag
  Male 3, Smile, Mohawk Dark
TXT

pp specs

specs.each_with_index do |attributes,i|
  img = YeOldePunk::Image.generate( *attributes )

  profilepic = img.silhouette( foreground1 ).background( background1 )
  profilepic.save( "./tmp/profilepic1/default1-punk#{i}.png" )
  profilepic.zoom(4).save( "./tmp/profilepic1@4x/default1-punk#{i}@4x.png" )
  profilepic.zoom(10).save( "./tmp/profilepic1@10x/default1-punk#{i}@10x.png" )

  profilepic = img.silhouette( foreground2 ).background( background2 )
  profilepic.save( "./tmp/profilepic2/default2-punk#{i}.png" )
  profilepic.zoom(4).save( "./tmp/profilepic2@4x/default2-punk#{i}@4x.png" )
  profilepic.zoom(10).save( "./tmp/profilepic2@10x/default2-punk#{i}@10x.png" )

  profilepic = img.silhouette( foreground3 ).background( background3 )
  profilepic.save( "./tmp/profilepic3/default3-punk#{i}.png" )
  profilepic.zoom(4).save( "./tmp/profilepic3@4x/default3-punk#{i}@4x.png" )
  profilepic.zoom(10).save( "./tmp/profilepic3@10x/default3-punk#{i}@10x.png" )

  profilepic = img.silhouette( foreground4 ).background( background4 )
  profilepic.save( "./tmp/profilepic4/default4-punk#{i}.png" )
  profilepic.zoom(4).save( "./tmp/profilepic4@4x/default4-punk#{i}@4x.png" )
  profilepic.zoom(10).circle.save( "./tmp/profilepic4@10x/default4-punk#{i}@10x.png" )
end





puts "bye"