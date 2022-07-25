$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'



## national (selection) team jerseys
ARGENTINA  = Image.read( './attributes/argentina.png' )
BRAZIL     = Image.read( './attributes/brazil.png' )
FRANCE     = Image.read( './attributes/france.png' )
PORTUGAL   = Image.read( './attributes/portugal.png' )

## football club jerseys
ARSENAL           = Image.read( './attributes/arsenal.png' )
BARCELONA         = Image.read( './attributes/barcelona.png' )
BAYERN            = Image.read( './attributes/bayern.png' )
INTERNAZIONALE    = Image.read( './attributes/internazionale.png' )
JUVENTUS          = Image.read( './attributes/juventus.png' )
LILLE             = Image.read( './attributes/lille.png' )
LIVERPOOL         = Image.read( './attributes/liverpool.png' )
MANCHERSTER_CITY  = Image.read( './attributes/manchester_city.png' )
AUSTRIA           = Image.read( './attributes/austria_wien.png' )
RAPID              = Image.read( './attributes/rapid_wien.png' )



################
## let's try football punks

specs = [
   ['Male Mid 1', ARGENTINA, 'Smile', 'Mohawk'],
   ['Male Mid 2', BRAZIL, 'Wild Hair',  'Horned-Rim Glasses'],
   ['Male Mid 3', FRANCE, 'Goat', 'Earring', 'Peak Spike',  'Big Shades'],
   ['Male Mid 1', PORTUGAL, 'Shaved Head', 'Gold Chain'],

   ['Male Mid 2', ARSENAL, 'Luxurious Beard', 'Messy Hair'],
   ['Male Mid 3', BARCELONA, 'Clown Nose', 'Clown Hair Green', 'Smile'],
   ['Male Mid 1', BAYERN, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],

   ['Male Mid 2', INTERNAZIONALE, 'Earring', 'Stringy Hair', 'Small Shades'],
   ['Male Mid 3', JUVENTUS,  'Big Beard', 'Mohawk'],
   ['Male Mid 1', LILLE, 'Muttonchops', 'Classic Shades'],
   ['Male Mid 2', LIVERPOOL, 'Crazy Hair', 'Spots'],

   ['Zombie Mid', MANCHERSTER_CITY, 'Earring', 'Messy Hair', 'Classic Shades'],
   ['Ape Mid', AUSTRIA, 'Purple Hair', 'VR', 'Smile'],
   ['Alien Mid', RAPID, 'Earring', 'Frumpy Hair', 'Bubble Gum'],
]

men = ImageComposite.new( 7, 2, width: 32,
                                height: 32,
                                background: ['#2BA734', '#59D062'] )


specs.each_with_index do |attributes,i|
  punk = Punk32::Image.generate( *attributes )

  punk.save( "./tmp/footballer#{i}.png" )
  punk.zoom(4).save( "./tmp/footballer#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/footballers_v2.png" )
men.zoom(4).save( "./tmp/footballers_v2@4x.png" )




module Pixelart
class Image
  def left( left )
     img = Image.new( width, height )
     img.compose!( crop( 0, 0, width-left, height ), left, 0 )
     img
  end
end
end



#####################################
## women's edition (shift left +2px)
##
## national (selection) team jerseys
ARGENTINA_F  = ARGENTINA.left(2)
BRAZIL_F     = BRAZIL.left(2)
FRANCE_F     = FRANCE.left(2)
PORTUGAL_F   = PORTUGAL.left(2)

## football club jerseys
ARSENAL_F           = ARSENAL.left(2)
BARCELONA_F         = BARCELONA.left(2)
BAYERN_F            = BAYERN.left(2)
INTERNAZIONALE_F    = INTERNAZIONALE.left(2)
JUVENTUS_F          = JUVENTUS.left(2)
LILLE_F             = LILLE.left(2)
LIVERPOOL_F         = LIVERPOOL.left(2)
MANCHERSTER_CITY_F  = MANCHERSTER_CITY.left(2)
AUSTRIA_F           = AUSTRIA.left(2)
RAPID_F             = RAPID.left(2)




specs = [
   ['Female Mid 1', ARGENTINA_F, 'Orange Side', 'Purple Lipstick'],
   ['Female Mid 2', BRAZIL_F, 'Wild Hair',  'Horned-Rim Glasses', 'Hot Lipstick'],
   ['Female Mid 3', FRANCE_F,  'Earring',  'Wild Blonde', 'Big Shades', 'Hot Lipstick'],  # 'Peak Spike',
   ['Female Mid 1', PORTUGAL_F, 'Shaved Head', 'Gold Chain', 'Hot Lipstick'],

   ['Female Mid 2', ARSENAL_F,  'Messy Hair', 'Hot Lipstick'],
   ['Female Mid 3', BARCELONA_F, 'Clown Nose', 'Clown Hair Green', 'Hot Lipstick'],
   ['Female Mid 1', BAYERN_F,  'Wild Hair', 'Regular Shades', 'Hot Lipstick'],

   ['Female Mid 2', INTERNAZIONALE_F, 'Earring', 'Stringy Hair', 'Small Shades', 'Hot Lipstick'],
   ['Female Mid 3', JUVENTUS_F, 'Mohawk'],
   ['Female Mid 1', LILLE_F, 'Straight Hair Blonde', 'Classic Shades', 'Hot Lipstick'],
   ['Female Mid 2', LIVERPOOL_F, 'Crazy Hair', 'Spots', 'Purple Lipstick'],

   ['Zombie Female Mid', MANCHERSTER_CITY_F, 'Earring', 'Blonde Short', 'Classic Shades'],
   ['Ape Female  Mid', AUSTRIA_F, 'Purple Hair', 'VR'],
   ['Alien Female  Mid', RAPID_F, 'Earring', 'Frumpy Hair', 'Bubble Gum'],
]

women = ImageComposite.new( 7, 2, width: 32,
                                height: 32,
                                background: ['#2BA734', '#59D062'] )


specs.each_with_index do |attributes,i|
  punk = Punk32::Image.generate( *attributes )

  punk.save( "./tmp/footballer_woman#{i}.png" )
  punk.zoom(4).save( "./tmp/footballer_woman#{i}@4x.png" )

  women << punk
end


women.save( "./tmp/footballers_women.png" )
women.zoom(4).save( "./tmp/footballers_women@4x.png" )



puts "bye"