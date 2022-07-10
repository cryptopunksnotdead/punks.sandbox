$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'



def slugify( name )
  ## e.g. turn Red Shemagh & Agal  => red_shemagh_agal
  ##           Darker 2            => darker_2
  name = name.downcase.gsub( /[^a-zA-Z0-9 _-]/, '' )
  name = name.gsub( /[ ]+/, '_' )
  name
end



specs = Csv.parse( <<TXT )
  Light 1, Normal Brown Beard & Mustache,  Red Shemagh & Agal, Regular Pixel Shades
  Light 1, Messy White Beard,   Brown Shemagh & Agal, Big Purple Shades
  Light 1, Red Shemagh,  Nerd Glasses, Natural Cigarette
  Light 2, Short White Beard, Red Shemagh & Agal, Stylish Nerd Glasses
  Light 2, Normal Brown Beard & Mustache, White Shemagh & Agal
  Darker 2, Stylish Mustache, Red Shemagh
TXT

pp specs




saudis = ImageComposite.new( 3, 2, background: '#ffbf00' )

specs.each_with_index do |attributes,i|
   saudi = Image.new( 24, 24 )
   attributes.each do |attribute|
      slug = slugify( attribute )
      saudi.compose!( Image.read( "./attributes/#{slug}.png" ))
   end

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
  Light 1, Red Shemagh
  Light 1, Red Shemagh & Agal
  Light 2, Red Shemagh & Crown
  Light 2, White Shemagh
  Medium 1, White Shemagh & Agal, Natural Cigarette
  Medium 2, White Shemagh & Gold Agal
  Dark 1, White Shemagh & Stylish Gold Agal, Stylish Mustache
  Dark 2, White Shemagh & Crown
  Darker 1, Brown Shemagh & Agal
  Darker 2, Brown Shemagh & Crown,  Bubble Gum
TXT

pp specs



saudis = ImageComposite.new( 5, 2, background: '#006C35' )

specs.each_with_index do |attributes,i|
   saudi = Image.new( 24, 24 )
   attributes.each do |attribute|
      slug = slugify( attribute )
      saudi.compose!( Image.read( "./attributes/#{slug}.png" ))
   end

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
   saudi = Image.new( 24, 24 )
   attributes.each do |attribute|
      slug = slugify( attribute )
      saudi.compose!( Image.read( "./attributes/#{slug}.png" ))
   end

   saudi.save( "./tmp/saudi#{i}-vol3.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}-vol3@8x.png" )

   saudis << saudi
end


saudis.save( "./tmp/saudis-vol3.png" )
saudis.zoom(4).save( "./tmp/saudis-vol3@4x.png" )
saudis.zoom(8).save( "./tmp/saudis-vol3@8x.png" )






puts "bye"

