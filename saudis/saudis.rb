$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'


## try "undead saudis"  green / dark green / cyan / pink


specs = Csv.parse( <<TXT )
  Green,  Normal Brown Beard & Mustache, Red Shemagh & Agal, Regular Pixel Shades
  Dark Green,  Messy White Beard, Brown Shemagh & Agal, Big Purple Shades
  Cyan,   Brown Shemagh & Agal, Big Pixel Shades, Shadowless Vape

  Pink,  Short White Beard, Red Shemagh & Agal, Stylish Nerd Glasses
  Green,   Shadow Beard, White Shemagh & Gold Agal
  Dark Green, Luxurious Brown Beard, Brown Shemagh & Agal

  Cyan, Normal Brown Beard,White Shemagh & Agal,Square Reflective Shades
  Pink, Luxurious White Beard,Brown Shemagh & Crown,Classic Shades,Bubble Gum
  Green, Normal Brown Beard & Mustache,Red Shemagh,Big Purple Shades
TXT

pp specs


saudis = ImageComposite.new( 3, 3, background: '#638596' )

specs.each_with_index do |attributes,i|
   saudi = Saudi::Image.generate( *attributes )

   saudi.save( "./tmp/undeadsaudi#{i}.png" )
   saudi.zoom(8).save( "./tmp/undeadsaudi#{i}@8x.png" )

   saudis << saudi
end

saudis.save( "./tmp/undeadsaudis.png" )
saudis.zoom(4).save( "./tmp/undeadsaudis@4x.png" )
saudis.zoom(8).save( "./tmp/undeadsaudis@8x.png" )






specs = Csv.parse( <<TXT )
  Light 1,  Normal Brown Beard & Mustache, Red Shemagh & Agal, Regular Pixel Shades
  Light 1,  Messy White Beard, Brown Shemagh & Agal, Big Purple Shades
  Dark 1,   Brown Shemagh & Agal, Big Pixel Shades, Shadowless Vape
  Light 2,  Short White Beard, Red Shemagh & Agal, Stylish Nerd Glasses
  Dark 2,   Shadow Beard, White Shemagh & Gold Agal
  Medium 2, Luxurious Brown Beard, Brown Shemagh & Agal
TXT

pp specs




saudis = ImageComposite.new( 3, 2, background: '#ffbf00' )

specs.each_with_index do |attributes,i|
   saudi = Saudi::Image.generate( *attributes )

   saudi.save( "./tmp/saudi#{i}.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}@8x.png" )

   saudis << saudi.mirror    ## phree the phunks
end


saudis.save( "./tmp/saudis.png" )
saudis.zoom(4).save( "./tmp/saudis@4x.png" )
saudis.zoom(8).save( "./tmp/saudis@8x.png" )


###
#  saudis vol. 2 - try all 10 shemags (headwear)


specs = Csv.parse( <<TXT )
  Light 1,  Red Shemagh
  Light 1,  Red Shemagh & Agal
  Light 2,  Red Shemagh & Crown
  Light 2,  White Shemagh
  Medium 1, White Shemagh & Agal, Shadowless Cigarette
  Medium 2, White Shemagh & Gold Agal
  Dark 1,   White Shemagh & Stylish Gold Agal, Stylish Mustache
  Dark 1,   White Shemagh & Crown
  Dark 2,   Brown Shemagh & Agal
  Dark 2,   Brown Shemagh & Crown,  Bubble Gum
TXT

pp specs



saudis = ImageComposite.new( 5, 2, background: '#006C35' )

specs.each_with_index do |attributes,i|
   saudi = Saudi::Image.generate( *attributes )

   saudi.save( "./tmp/saudi#{i}-vol2.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}-vol2@8x.png" )

   saudis << saudi.mirror    ## phree the phunks
end


saudis.save( "./tmp/saudis-vol2.png" )
saudis.zoom(4).save( "./tmp/saudis-vol2@4x.png" )
saudis.zoom(8).save( "./tmp/saudis-vol2@8x.png" )



###
#  saudis vol. 3 - try ultra-rare sheiks w/ laser eyes
specs = Csv.parse( <<TXT )
  Dark 1, Luxurious Beard, White Shemagh & Agal, MAX BIDDING
  Dark 2, Luxurious Beard, Red Shemagh & Agal,  Laser Eyes
TXT

pp specs



saudis = ImageComposite.new( 2, 1, background: '#006C35' )

specs.each_with_index do |attributes,i|
   saudi = Saudi::Image.generate( *attributes )

   saudi.save( "./tmp/saudi#{i}-vol3.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}-vol3@8x.png" )

   saudis << saudi
end


saudis.save( "./tmp/saudis-vol3.png" )
saudis.zoom(4).save( "./tmp/saudis-vol3@4x.png" )
saudis.zoom(8).save( "./tmp/saudis-vol3@8x.png" )


###
#  saudis vol. 4- try all 18 beards (facial hairs)

specs = Csv.parse( <<TXT )
 Dark 1, Messy White Beard, Red Shemagh & Agal
 Dark 1, Short White Beard, Red Shemagh & Agal
 Dark 1, Normal White Beard, Red Shemagh & Agal
 Dark 1,  Luxurious White Beard, Red Shemagh & Agal

 Dark 1, Short Grey Beard, Red Shemagh & Agal

 Dark 1,  Messy Brown Beard, Red Shemagh & Agal
 Dark 1,  Normal Brown Beard, Red Shemagh & Agal
 Dark 1,  Normal Brown Beard & Mustache, Red Shemagh & Agal
 Dark 1,  Luxurious Brown Beard, Red Shemagh & Agal

 Dark 1,  Mustache, Red Shemagh & Agal
 Dark 1,  Stylish Mustache, Red Shemagh & Agal
 Dark 1,  Sideburns, Red Shemagh & Agal
 Dark 1,  Sideburns & Mustache, Red Shemagh & Agal
 Dark 1,  Light Beard, Red Shemagh & Agal
 Dark 1,  Shadow Beard, Red Shemagh & Agal
 Dark 1,  Shadow Beard & Mustache, Red Shemagh & Agal
 Dark 1,  Normal Beard, Red Shemagh & Agal
 Dark 1,  Luxurious Beard, Red Shemagh & Agal
TXT

pp specs



saudis = ImageComposite.new( 9, 2, background: '#006C35' )

specs.each_with_index do |attributes,i|
   saudi = Saudi::Image.generate( *attributes )

   saudi.save( "./tmp/saudi#{i}-vol4.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}-vol4@8x.png" )

   saudis << saudi
end


saudis.save( "./tmp/saudis-vol4.png" )
saudis.zoom(4).save( "./tmp/saudis-vol4@4x.png" )




###
#  saudis vol. 5 - try all 23 eyewear / shades & more



specs = Csv.parse( <<TXT )
 Light 1, Mustache, White Shemagh & Agal, Horn Rimmed Glasses
 Light 1, Mustache, White Shemagh & Agal, Rimless Glasses
 Light 1, Mustache, White Shemagh & Agal, Nerd Glasses
 Light 1, Mustache, White Shemagh & Agal, Stylish Nerd Glasses
 Light 1, Mustache, White Shemagh & Agal, Big Shades
 Light 1, Mustache, White Shemagh & Agal, Big Pixel Shades
 Light 1, Mustache, White Shemagh & Agal, Big Green Shades
 Light 1, Mustache, White Shemagh & Agal, Big Purple Shades

 Medium 1, Sideburns & Mustache, White Shemagh & Agal, Small Shades
 Medium 1, Sideburns & Mustache, White Shemagh & Agal, Regular Shades
 Medium 1, Sideburns & Mustache, White Shemagh & Agal, Round Shades
 Medium 1, Sideburns & Mustache, White Shemagh & Agal, Big Round Shades
 Medium 1, Sideburns & Mustache, White Shemagh & Agal, Square Shades
 Medium 1, Sideburns & Mustache, White Shemagh & Agal, Square Reflective Shades
 Medium 1, Sideburns & Mustache, White Shemagh & Agal, Regular Reflective Shades
 Medium 1, Sideburns & Mustache, White Shemagh & Agal, Regular Pixel Shades

 Dark 1, Normal Beard, White Shemagh & Agal, Classic Shades
 Dark 1, Normal Beard, White Shemagh & Agal, Classic Green Shades
 Dark 1, Normal Beard, White Shemagh & Agal, Classic Gold Shades
 Dark 1, Normal Beard, White Shemagh & Agal, 3D Glasses
 Dark 1, Normal Beard, White Shemagh & Agal, VR
 Dark 1, Normal Beard, White Shemagh & Agal, Laser Eyes
 Dark 1, Normal Beard, White Shemagh & Agal, MAX BIDDING
 Dark 1, Normal Beard, White Shemagh & Agal
TXT

pp specs


## bonus attribute(s) to round-up to 24 saudis
HEART_SHADES = Punk::Sheet.find_by( name: 'Heart Shades', gender: 'u' )

saudis = ImageComposite.new( 8, 3, background: '#006C35' )

specs.each_with_index do |attributes,i|
   saudi = Saudi::Image.generate( *attributes )

   saudi.compose!( HEART_SHADES )  if i==23

   saudi.save( "./tmp/saudi#{i}-vol5.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}-vol5@8x.png" )

   saudis << saudi
end


saudis.save( "./tmp/saudis-vol5.png" )
saudis.zoom(4).save( "./tmp/saudis-vol5@4x.png" )




###
#  saudis vol. 6 - try all 9 mouth pieces / props

specs = Csv.parse( <<TXT )
  Light 1,   White Shemagh & Agal,  Mustache, Cigarette
  Medium 1,  Brown Shemagh & Agal, Sideburns & Mustache, Shadowless Cigarette
  Dark 1,    Red Shemagh & Agal,   Normal Beard,  Cigar

  Light 1,   Brown Shemagh & Agal,  Sideburns & Mustache,  Vape
  Medium 1,  Red Shemagh & Agal,  Normal Beard, Shadowless Vape
  Dark 1,    White Shemagh & Agal,  Mustache,  Miswak

  Light 1,   Red Shemagh & Agal,  Normal Beard, Pearwood Pipe
  Medium 1,  White Shemagh & Agal, Mustache, Rosewood Pipe
  Dark 1,    Brown Shemagh & Agal, Sideburns & Mustache,  Bubble Gum
TXT


pp specs



saudis = ImageComposite.new( 3, 3, background: '#006C35' )

specs.each_with_index do |attributes,i|
   saudi = Saudi::Image.generate( *attributes )

   saudi.save( "./tmp/saudi#{i}-vol6.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}-vol6@8x.png" )

   saudis << saudi
end


saudis.save( "./tmp/saudis-vol6.png" )
saudis.zoom(4).save( "./tmp/saudis-vol6@4x.png" )



###
#  saudis vol. 7- mix'n' match try bored saudi apes & desparate habibtis of saudi apes
specs = Csv.parse( <<TXT )
Ape,           Red Shemagh & Agal
Ape Black,     Red Shemagh & Agal, Luxurious Beard, Laser Eyes Gold
Ape Trippy,    Red Shemagh & Agal,  3D Glasses

Cyborg Ape,     White Shemagh & Agal, Earring, Pipe
Ape Solid Gold, White Shemagh & Agal, Laser Eyes Red
Ape DMT,        Brown Shemagh & Agal,  Big Shades, Gold Chain

Cyborg Ape Metal,  White Shemagh & Stylish Gold Agal,  Bubble Gum
Ape Female,   Niquab Blue,   VR
Ape Female,   Niquab Black,   Laser Eyes
TXT

pp specs

saudis = ImageComposite.new( 3, 3, background: '#006C35' )

specs.each_with_index do |attributes,i|
   saudi = Punk::Image.generate( *attributes )

   if attributes[0] == 'Cyborg Ape Metal'    ## quick hack: patch "missing" cyborg ear
      saudi[5,12] = 0xffffffff   ## fill-up with white (0xfffff/ff) pixels
      saudi[5,13] = 0xffffffff
      saudi[5,14] = 0xffffffff
   end

   saudi.save( "./tmp/saudi#{i}-vol7.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}-vol7@8x.png" )

   saudis << saudi
end


saudis.save( "./tmp/saudis-vol7.png" )
saudis.zoom(4).save( "./tmp/saudis-vol7@4x.png" )
saudis.zoom(8).save( "./tmp/saudis-vol7@8x.png" )


puts "bye"

