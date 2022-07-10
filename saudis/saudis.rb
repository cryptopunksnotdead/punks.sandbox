$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'



specs = Csv.parse( <<TXT )
  Light 1, Normal Brown Beard & Mustache,  Red Shemagh & Agal, Regular Pixel Shades
  Light 1, Messy White Beard,   Brown Shemagh & Agal, Big Purple Shades
  Light 1, Red Shemagh,  Nerd Glasses, Natural Cigarette
  Light 2, Short White Beard, Red Shemagh & Agal, Stylish Nerd Glasses
  Light 2, Normal Brown Beard & Mustache, White Shemagh & Agal
  Darker 2, Stylish Mustache, Red Shemagh
TXT

pp specs


def slugify( name )
  ## e.g. turn Red Shemagh & Agal  => red_shemagh_agal
  ##           Darker 2            => darker_2
  name = name.downcase.gsub( /[^a-zA-Z0-9 _-]/, '' )
  name = name.gsub( /[ ]+/, '_' )
  name
end



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



puts "bye"

