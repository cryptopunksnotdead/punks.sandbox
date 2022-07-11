$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'punks'



ATTRIBUTE_NAMES = %w[
   light_1
   light_2
   medium_1
   medium_2
   darker_1
   darker_2
   dark_1
   dark_2

   headwear/brown_shemagh_agal
   headwear/brown_shemagh_crown
   headwear/red_shemagh
   headwear/red_shemagh_agal
   headwear/red_shemagh_crown
   headwear/white_shemagh
   headwear/white_shemagh_agal
   headwear/white_shemagh_crown
   headwear/white_shemagh_gold_agal
   headwear/white_shemagh_stylish_gold_agal

   beard/light_beard
   beard/luxurious_beard
   beard/luxurious_brown_beard
   beard/luxurious_white_beard
   beard/messy_brown_beard
   beard/messy_white_beard
   beard/mustache
   beard/normal_beard
   beard/normal_brown_beard
   beard/normal_brown_beard_mustache
   beard/normal_white_beard
   beard/shadow_beard
   beard/shadow_beard_mustache
   beard/short_grey_beard
   beard/short_white_beard
   beard/sideburns
   beard/sideburns_mustache
   beard/stylish_mustache

   eyewear/3d_glasses
   eyewear/big_green_shades
   eyewear/big_pixel_shades
   eyewear/big_purple_shades
   eyewear/big_round_shades
   eyewear/big_shades
   eyewear/classic_gold_shades
   eyewear/classic_green_shades
   eyewear/classic_shades
   eyewear/horn_rimmed_glasses
   eyewear/laser_eyes
   eyewear/max_bidding
   eyewear/nerd_glasses
   eyewear/regular_pixel_shades
   eyewear/regular_reflective_shades
   eyewear/regular_shades
   eyewear/rimless_glasses
   eyewear/round_shades
   eyewear/small_shades
   eyewear/square_reflective_shades
   eyewear/square_shades
   eyewear/stylish_nerd_glasses
   eyewear/vr

   mouthprop/bubble_gum
   mouthprop/natural_cigarette
   mouthprop/vape
  ]

pp ATTRIBUTE_NAMES

ATTRIBUTES = ATTRIBUTE_NAMES.reduce({}) do |h, name|
                             h[ File.basename( name ) ] = Image.read( "./attributes/#{name}.png" )
                             h
                            end

## bonus attributes
ATTRIBUTES['heart_shades'] = Punk::Sheet.find_by( name: 'Heart Shades', gender: 'u' )


def slugify( name )
  ## e.g. turn Red Shemagh & Agal  => red_shemagh_agal
  ##           Darker 2            => darker_2
  name = name.downcase.gsub( /[^a-zA-Z0-9 _-]/, '' )
  name = name.gsub( /[ ]+/, '_' )
  name
end


def generate_saudi( *attributes )
   saudi = Image.new( 24, 24 )
   attributes.each do |attribute_name|
      slug = slugify( attribute_name )
      attribute = ATTRIBUTES[ slug ]
      if attribute.nil?
         puts "!! ERROR - attribute >#{attribute_name}< w/ slug >#{slug}< not found; sorry:"
         pp attributes
         exit
      end
      saudi.compose!( attribute )
   end
   saudi
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
   saudi = generate_saudi( *attributes )

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
   saudi = generate_saudi( *attributes )

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
   saudi = generate_saudi( *attributes )

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
   saudi = generate_saudi( *attributes )

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
 Dark 1, Normal Beard, White Shemagh & Agal,  Heart Shades
TXT

pp specs



saudis = ImageComposite.new( 8, 3, background: '#006C35' )

specs.each_with_index do |attributes,i|
   saudi = generate_saudi( *attributes )

   saudi.save( "./tmp/saudi#{i}-vol5.png" )
   saudi.zoom(8).save( "./tmp/saudi#{i}-vol5@8x.png" )

   saudis << saudi
end


saudis.save( "./tmp/saudis-vol5.png" )
saudis.zoom(4).save( "./tmp/saudis-vol5@4x.png" )




puts "bye"

