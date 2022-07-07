require 'punks'


## add (patch) punk generator with more archetypes & attributes

patch = {
  ## archetype (base) marcs
  'marc'            => Image.read( './marc-24x24.png' ),
  'zombiemarc'      => Image.read( './zombie_marc-24x24.png' ),
  'apemarc'         => Image.read( './ape_marc-24x24.png' ),
  'goldenapemarc'   => Image.read( './golden_ape_marc-24x24.png' ),
  'pinkapemarc'     => Image.read( './pink_ape_marc-24x24.png' ),
  'alienmarc'       => Image.read( './alien_marc-24x24.png' ),
  'greenalienmarc'  => Image.read( './green_alien_marc-24x24.png' ),
  'demonmarc1'       => Image.read( './demon_marc1-24x24.png' ),
  'demonmarc2'       => Image.read( './demon_marc2-24x24.png' ),
  'orcmarc'         => Image.read( './orc_marc-24x24.png' ),
  'skeletonmarc'    => Image.read( './skeleton_marc-24x24.png' ),

  ## archetype (base) marcs variant - classic "old skool"
  'classicmarc'    =>  Image.read( './classic_marc-24x24.png' ),
  'classicapemarc' =>  Image.read( './classic_ape_marc-24x24.png' ),

  ## more attributes
  'mcdvisor'     => Image.read( './mcd_visor-24x24.png' ),
  'mcdshirt'     => Image.read( './mcd_shirt-24x24.png' ),
  'unclesamhat'  => Image.read( './uncle_sam_hat-24x24.png' ),
  'redshirt'     => Image.read( './red_shirt-24x24.png' ),
  'blueshirt'    => Image.read( './blue_shirt-24x24.png' ),
  ## adapted attributes
  'cowboyhat'    => Image.read( './cowboy_hat-24x24.png' ),
  'capforward'   => Image.read( './cap_forward-24x24.png' ),
}


specs = Csv.parse( <<TXT )
  Marc
  Marc, Classic Shades, Smile, Cowboy Hat, Earring
  Marc, McD Visor, McD Shirt, Eye Patch, Handlebars
  Marc, Uncle Sam Hat, Red Shirt

  Demon Marc 1, Heart Shades, Smile
  Marc, Heart Shades, Birthday Hat, Bubble Gum
  Alien Marc, Headband, Pipe
  Ape Marc, Pipe, 3D Glasses

  Marc, Small Shades, Blue Shirt, Frown
  Marc, Clown Hair Green, Clown Nose, Horned Rim Glasses, Buck Teeth
  Zombie Marc, VR, Earring
  Marc, Hoodie, Clown Eyes Green, Luxurious Beard

  Marc, Normal Beard, Cap Forward, Cigarette
  Ape Marc
  Classic Ape Marc, Luxurious Beard
  Classic Marc,  Luxurious Beard, Gold Chain
TXT


pp specs

marcs = ImageComposite.new( 4, 4, background: '#638596' )

specs.each do |attributes|
  marc = Punk::Image.generate( *attributes, patch: patch )
  marcs << marc.mirror
end


marcs.save( "./tmp/marcs.png" )
marcs.zoom(4).save( "./tmp/marcs@4x.png" )



#####
#   add a golden framed "museum-style" marc (a16z)
#


frame = Image.read( "../frame/i/frame24x24.png" )


attributes = ['Marc', 'Luxurious Beard', 'Gold Chain' ]
marc = Punk::Image.generate( *attributes, patch: patch )
marc = marc.mirror

framed = Image.new( 36, 36 )
framed.compose!( frame )
framed.compose!( Image.new( 24,24, '#afcaa1' ), 6, 6 )  ## add non-trasparent / opaque background first
framed.compose!( marc, 6, 6 )

framed.save( "./tmp/marc-golden.png" )
framed.zoom( 8 ).save( "./tmp/marc-golden@8x.png" )



####
#   try new ultra-rare marc archetypes


types = ['Marc',
         'Zombie Marc',
         'Ape Marc',
         'Pink Ape Marc',
         'Golden Ape Marc',
         'Alien Marc',
         'Green Alien Marc',
         'Orc Marc',
         'Demon Marc 1',
         'Demon Marc 2',
         'Skeleton Marc',
         'Classic Marc',
         'Classic Ape Marc']


specs = [
  [],
  ['Normal Beard'],
  ['Luxurious Beard'],
  ['Small Shades', 'Blue Shirt'],
  ['Heart Shades', 'Birthday Hat', 'Bubble Gum'],
  ['Headband', 'Pipe'],
  ['McD Visor', 'McD Shirt', 'Eye Patch'],
  ['VR', 'Earring', 'Gold Chain'],
  ['Uncle Sam Hat', 'Red Shirt'],
]

marcs = ImageComposite.new( specs.size, types.size, background: '#638596' )

types.each do |type|
  specs.each do |more_attributes|
     attributes = [type] + more_attributes
     marc = Punk::Image.generate( *attributes, patch: patch )
     marcs << marc.mirror
  end
end

marcs.save( "./tmp/marcs_vol2.png" )
marcs.zoom(4).save( "./tmp/marcs_vol2@4x.png" )


puts "bye"