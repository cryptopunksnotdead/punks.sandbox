require 'punks'



MALE1      = Image.read( './attributes/male1.png' )
MALE2      = Image.read( './attributes/male2.png' )
MALE3      = Image.read( './attributes/male3.png' )
ZOMBIE     = Image.read( './attributes/zombie.png' )
APE        = Image.read( './attributes/ape.png' )
ALIEN      = Image.read( './attributes/alien.png' )

SUIT1_BLACK = Image.read( './attributes/suit1-black.png' )
SUIT2_BLACK = Image.read( './attributes/suit2-black.png' )

HOODIE1_BLACK  = Image.read( './attributes/hoodie1-black.png' )
HOODIE1_CREAM  = Image.read( './attributes/hoodie1-cream.png' )
HOODIE1_SKY    = Image.read( './attributes/hoodie1-sky.png' )

HOODIE2_DARK     = Image.read( './attributes/hoodie2-dark.png' )
HOODIE2_PHAROAH  = Image.read( './attributes/hoodie2-pharoah.png' )



def generate_punk( *attributes )
  punk = Image.new( 32, 32 )
  attributes.each do |attribute_name|
      attribute =  if attribute_name.is_a?( Image )
                        attribute_name
                   else  ## assume name as string
                        Punk::Sheet.find_by( name: attribute_name, gender: 'm' )
                   end

     if attribute.width == 24 && attribute.height == 24
          ## cut-off top 1px (24x23)
          attribute =  attribute.crop( 0, 1, 24, 23 )
          ## offset x/y for classic 24x24 attributes in 40x40 canvas
          punk.compose!( attribute, 6, 0 )
     else
          punk.compose!( attribute )
     end
  end
  punk
end


################
## let's try the first twelve male punks
##   plus six top seller aliens, apes & zombies

specs = [
  [MALE1, SUIT1_BLACK, 'Smile', 'Mohawk'],
  [MALE2, SUIT2_BLACK, 'Wild Hair', 'Horned-Rim Glasses'],
  [MALE2, SUIT1_BLACK, 'Goat', 'Earring', 'Peak Spike', 'Big Shades'],

  [MALE2, SUIT2_BLACK, 'Shaved Head', 'Classic Shades'],
  [MALE1, SUIT1_BLACK, 'Luxurious Beard', 'Messy Hair'],
  [MALE2, SUIT2_BLACK, 'Big Beard', 'Clown Hair Green', 'Clown Nose', 'Smile'],

  [MALE3, SUIT1_BLACK, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],
  [MALE2, SUIT2_BLACK, 'Earring', 'Stringy Hair', 'Small Shades'],
  [MALE3, SUIT1_BLACK, 'Frown', 'Mohawk', 'Spots'],

  [MALE2, SUIT2_BLACK, 'Muttonchops', 'Laser Eyes'],
  [MALE3, SUIT1_BLACK, 'Crazy Hair', 'VR', 'Smile'],
  [MALE3, SUIT2_BLACK, 'Earring', 'Frumpy Hair', 'Bubble Gum'],

  [ALIEN, SUIT1_BLACK, 'Headband'],
  [ALIEN, SUIT2_BLACK, 'Cap Forward', 'Small Shades', 'Pipe'],
  [APE,   SUIT1_BLACK, 'Bandana'],
  [APE,   SUIT2_BLACK, 'Knitted Cap', 'Gold Chain'],
  [ZOMBIE, SUIT1_BLACK, 'Wild Hair', '3D Glasses'],
  [ZOMBIE, SUIT2_BLACK, 'Crazy Hair', 'Earring', 'Chinstrap'],

  [MALE1],
  [MALE2],
  [MALE3],
  [ZOMBIE],
  [APE],
  [ALIEN]
]


men = ImageComposite.new( 6, 4, width: 32,
                                height: 32,
                                background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = generate_punk( *attributes )

  punk.save( "./tmp/maninblack#{i}.png" )
  punk.zoom(4).save( "./tmp/maninblack#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/meninblack_v2.png" )
men.zoom(4).save( "./tmp/meninblack_v2@4x.png" )




specs = [
  [MALE1, HOODIE1_BLACK, 'Smile'],
  [MALE2, HOODIE1_CREAM, 'Pipe', 'Horned-Rim Glasses'],
  [MALE2, HOODIE1_SKY, 'Goat', 'Earring', 'Big Shades'],

  [MALE2, HOODIE1_BLACK, 'VR'],
  [MALE1, HOODIE1_CREAM, 'Luxurious Beard'],
  [MALE2, HOODIE1_SKY, 'Big Beard', 'Clown Nose'],

  [MALE3, HOODIE2_PHAROAH, 'Luxurious Beard'],
  [MALE2, HOODIE1_BLACK,  'Earring', '3D Glasses'],
  [MALE3, HOODIE1_SKY, 'Frown', 'Spots'],

  [MALE2, HOODIE2_DARK, 'Muttonchops'],
  [MALE3, HOODIE1_CREAM, 'Laser Eyes Gold'],
  [MALE3, HOODIE1_SKY, 'Earring', 'Classic Shades'],

  [ALIEN, HOODIE2_DARK, 'Bubble Gum'],
  [ALIEN, HOODIE1_CREAM, 'Small Shades', 'Pipe'],
  [APE,   HOODIE2_DARK],
  [APE,   HOODIE1_BLACK, 'Gold Chain', 'Laser Eyes'],
  [ZOMBIE, HOODIE1_CREAM, '3D Glasses'],
  [ZOMBIE, HOODIE2_PHAROAH, 'Chinstrap', 'Smile'],
]


men = ImageComposite.new( 6, 3, width: 32,
                                height: 32,
                                background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = generate_punk( *attributes )

  punk.save( "./tmp/maninhoodie#{i}.png" )
  punk.zoom(4).save( "./tmp/maninhoodie#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/meninhoodies_v2.png" )
men.zoom(4).save( "./tmp/meninhoodies_v2@4x.png" )





puts "bye"