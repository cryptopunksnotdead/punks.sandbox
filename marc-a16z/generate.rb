require 'punks'


## add (patch) punk generator with more archetypes & attributes

patch = {
  'marc'      => Image.read( './marc-24x24.png' ),
  'mcdvisor'  => Image.read( './mcd_visor-24x24.png' ),
  'mcdshirt'  => Image.read( './mcd_shirt-24x24.png' ),
  'usahat'    => Image.read( './usa_hat-24x24.png' ),
  'usashirt'  => Image.read( './usa_shirt-24x24.png' ),
  'cowboyhat' => Image.read( './cowboy_hat-24x24.png' ),
}


specs = Csv.parse( <<TXT )
  Marc
  Marc, Classic Shades, Smile, Cowboy Hat, Earring
  Marc, McD Visor, McD Shirt, Eye Patch, Handlebars
  Marc, USA Shirt, USA Hat
  Marc, Heart Shades, Smile
  Marc, Heart Shades, Birthday Hat, Bubble Gum
  Marc, Headband, Pipe
  Marc, Pipe, 3D Glasses, Cap Forward
  Marc, Nerd Glasses, Beanie
  Marc, Clown Hair Green, Clown Nose, Horned Rim Glasses, Buck Teeth
  Marc, VR, Earring, Frown
  Marc, Hoodie, Clown Eyes Green, Luxurious Beard
TXT


pp specs

marcs = ImageComposite.new( 4, 3, background: '#638596' )

specs.each do |attributes|
  marc = Punk::Image.generate( *attributes, patch: patch )
  marcs << marc.mirror
end


marcs.save( "./tmp/marcs.png" )
marcs.zoom(4).save( "./tmp/marcs@4x.png" )




puts "bye"