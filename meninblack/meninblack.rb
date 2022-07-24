$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'



SUIT1_BLACK = Image.read( './attributes/suit1-black.png' )
SUIT2_BLACK = Image.read( './attributes/suit2-black.png' )


HOODIE1_BLACK  = Image.read( './attributes/hoodie1-black.png' )
HOODIE1_CREAM  = Image.read( './attributes/hoodie1-cream.png' )
HOODIE1_SKY    = Image.read( './attributes/hoodie1-sky.png' )

HOODIE2_DARK     = Image.read( './attributes/hoodie2-dark.png' )
HOODIE2_PHAROAH  = Image.read( './attributes/hoodie2-pharoah.png' )



################
## let's try the first twelve male punks
##   plus six top seller aliens, apes & zombies

specs = [
  ['Male 1', SUIT1_BLACK, 'Smile', 'Mohawk'],
  ['Male 2', SUIT2_BLACK, 'Wild Hair', 'Horned-Rim Glasses'],
  ['Male 2', SUIT1_BLACK, 'Goat', 'Earring', 'Peak Spike', 'Big Shades'],

  ['Male 2', SUIT2_BLACK, 'Shaved Head', 'Classic Shades'],
  ['Male 1', SUIT1_BLACK, 'Luxurious Beard', 'Messy Hair'],
  ['Male 2', SUIT2_BLACK, 'Big Beard', 'Clown Hair Green', 'Clown Nose', 'Smile'],

  ['Male 3', SUIT1_BLACK, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],
  ['Male 2', SUIT2_BLACK, 'Earring', 'Stringy Hair', 'Small Shades'],
  ['Male 3', SUIT1_BLACK, 'Frown', 'Mohawk', 'Spots'],

  ['Male 2', SUIT2_BLACK, 'Muttonchops', 'Laser Eyes'],
  ['Male 3', SUIT1_BLACK, 'Crazy Hair', 'VR', 'Smile'],
  ['Male 3', SUIT2_BLACK, 'Earring', 'Frumpy Hair', 'Bubble Gum'],

  ['Alien', SUIT1_BLACK, 'Headband'],
  ['Alien', SUIT2_BLACK, 'Cap Forward', 'Small Shades', 'Pipe'],
  ['Ape',   SUIT1_BLACK, 'Bandana'],
  ['Ape',   SUIT2_BLACK, 'Knitted Cap', 'Gold Chain'],
  ['Zombie', SUIT1_BLACK, 'Wild Hair', '3D Glasses'],
  ['Zombie', SUIT2_BLACK, 'Crazy Hair', 'Earring', 'Chinstrap'],

  ['Male 1'],
  ['Male 2'],
  ['Male 3'],
  ['Zombie'],
  ['Ape'],
  ['Alien']
]


men = ImageComposite.new( 6, 4, width: 32,
                                height: 32,
                                background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = Punk32::Image.generate( *attributes )

  punk.save( "./tmp/maninblack#{i}.png" )
  punk.zoom(4).save( "./tmp/maninblack#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/meninblack_v2.png" )
men.zoom(4).save( "./tmp/meninblack_v2@4x.png" )



specs = [
  ['Male 1', HOODIE1_BLACK, 'Smile'],
  ['Male 2', HOODIE1_CREAM, 'Pipe', 'Horned-Rim Glasses'],
  ['Male 2', HOODIE1_SKY, 'Goat', 'Earring', 'Big Shades'],

  ['Male 2', HOODIE1_BLACK, 'VR'],
  ['Male 1', HOODIE1_CREAM, 'Luxurious Beard'],
  ['Male 2', HOODIE1_SKY, 'Big Beard', 'Clown Nose'],

  ['Male 3', HOODIE2_PHAROAH, 'Luxurious Beard'],
  ['Male 2', HOODIE1_BLACK,  'Earring', '3D Glasses'],
  ['Male 3', HOODIE1_SKY, 'Frown', 'Spots'],

  ['Male 2', HOODIE2_DARK, 'Muttonchops'],
  ['Male 3', HOODIE1_CREAM, 'Laser Eyes Gold'],
  ['Male 3', HOODIE1_SKY, 'Earring', 'Classic Shades'],

  ['Alien',  HOODIE2_DARK, 'Bubble Gum'],
  ['Alien',  HOODIE1_CREAM, 'Small Shades', 'Pipe'],
  ['Ape',    HOODIE2_DARK],
  ['Ape',    HOODIE1_BLACK, 'Gold Chain', 'Laser Eyes'],
  ['Zombie',  HOODIE1_CREAM, '3D Glasses'],
  ['Zombie',  HOODIE2_PHAROAH, 'Chinstrap', 'Smile'],
]


men = ImageComposite.new( 6, 3, width: 32,
                                height: 32,
                                background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = Punk32::Image.generate( *attributes )

  punk.save( "./tmp/maninhoodie#{i}.png" )
  punk.zoom(4).save( "./tmp/maninhoodie#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/meninhoodies_v2.png" )
men.zoom(4).save( "./tmp/meninhoodies_v2@4x.png" )



puts "bye"