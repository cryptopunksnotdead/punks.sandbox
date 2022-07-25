$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'



SUIT1_BLACK = Image.read( './attributes/suit1-black.png' )
SUIT2_BLACK = Image.read( './attributes/suit2-black.png' )


################
## let's try the first twelve male punks
##   plus six top seller aliens, apes & zombies

specs = [
  ['Male XS 1', SUIT1_BLACK, 'Smile', 'Mohawk'],
  ['Male XS 2', SUIT2_BLACK, 'Wild Hair', 'Horned-Rim Glasses'],
  ['Male XS 2', SUIT1_BLACK, 'Goat', 'Earring', 'Peak Spike', 'Big Shades'],

  ['Male XS 2', SUIT2_BLACK, 'Shaved Head', 'Classic Shades'],
  ['Male XS 1', SUIT1_BLACK, 'Luxurious Beard', 'Messy Hair'],
  ['Male XS 2', SUIT2_BLACK, 'Big Beard', 'Clown Hair Green', 'Clown Nose', 'Smile'],

  ['Male XS 3', SUIT1_BLACK, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],
  ['Male XS 2', SUIT2_BLACK, 'Earring', 'Stringy Hair', 'Small Shades'],
  ['Male XS 3', SUIT1_BLACK, 'Frown', 'Mohawk', 'Spots'],

  ['Male XS 2', SUIT2_BLACK, 'Muttonchops', 'Laser Eyes'],
  ['Male XS 3', SUIT1_BLACK, 'Crazy Hair', 'VR', 'Smile'],
  ['Male XS 3', SUIT2_BLACK, 'Earring', 'Frumpy Hair', 'Bubble Gum'],

  ['Alien XS', SUIT1_BLACK, 'Headband'],
  ['Alien XS', SUIT2_BLACK, 'Cap Forward', 'Small Shades', 'Pipe'],
  ['Ape XS',   SUIT1_BLACK, 'Bandana'],
  ['Ape XS',   SUIT2_BLACK, 'Knitted Cap', 'Gold Chain'],
  ['Zombie XS', SUIT1_BLACK, 'Wild Hair', '3D Glasses'],
  ['Zombie XS', SUIT2_BLACK, 'Crazy Hair', 'Earring', 'Chinstrap'],

  ['Male XS 1'],
  ['Male XS 2'],
  ['Male XS 3'],
  ['Zombie XS'],
  ['Ape XS'],
  ['Alien XS']
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


HOODIE1_BLACK  = Image.read( './attributes/hoodie1-black.png' )
HOODIE1_CREAM  = Image.read( './attributes/hoodie1-cream.png' )
HOODIE1_SKY    = Image.read( './attributes/hoodie1-sky.png' )

HOODIE2_DARK     = Image.read( './attributes/hoodie2-dark.png' )
HOODIE2_PHAROAH  = Image.read( './attributes/hoodie2-pharoah.png' )

specs = [
  ['Male XS 1', HOODIE1_BLACK, 'Smile'],
  ['Male XS 2', HOODIE1_CREAM, 'Pipe', 'Horned-Rim Glasses'],
  ['Male XS 2', HOODIE1_SKY, 'Goat', 'Earring', 'Big Shades'],

  ['Male XS 2', HOODIE1_BLACK, 'VR'],
  ['Male XS 1', HOODIE1_CREAM, 'Luxurious Beard'],
  ['Male XS 2', HOODIE1_SKY, 'Big Beard', 'Clown Nose'],

  ['Male XS 3', HOODIE2_PHAROAH, 'Luxurious Beard'],
  ['Male XS 2', HOODIE1_BLACK,  'Earring', '3D Glasses'],
  ['Male XS 3', HOODIE1_SKY, 'Frown', 'Spots'],

  ['Male XS 2', HOODIE2_DARK, 'Muttonchops'],
  ['Male XS 3', HOODIE1_CREAM, 'Laser Eyes Gold'],
  ['Male XS 3', HOODIE1_SKY, 'Earring', 'Classic Shades'],

  ['Alien XS',  HOODIE2_DARK, 'Bubble Gum'],
  ['Alien XS',  HOODIE1_CREAM, 'Small Shades', 'Pipe'],
  ['Ape XS',    HOODIE2_DARK],
  ['Ape XS',    HOODIE1_BLACK, 'Gold Chain', 'Laser Eyes'],
  ['Zombie XS',  HOODIE1_CREAM, '3D Glasses'],
  ['Zombie XS',  HOODIE2_PHAROAH, 'Chinstrap', 'Smile'],
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