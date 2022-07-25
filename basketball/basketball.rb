$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'




## basketball club jerseys
ATLANTA  = Image.read( './attributes/atlanta_hawks.png' )
BOSTON   = Image.read( './attributes/boston_celtics.png' )
BROOKLYN = Image.read( './attributes/brooklyn_nets.png' )
CHARLOTTE = Image.read( './attributes/charlotte_hornets.png' )
CHICAGO   = Image.read( './attributes/chicago_bulls.png' )
CHICAGO2  = Image.read( './attributes/chicago_bulls2.png' )
CLEVELAND = Image.read( './attributes/cleveland_cavaliers.png' )
DALLAS    = Image.read( './attributes/dallas_mavericks.png' )
DENVER    = Image.read( './attributes/denver_nuggets.png' )
GOLDEN_STATE =  Image.read( './attributes/golden_state_warriors.png' )
GOLDEN_STATE2  = Image.read( './attributes/golden_state_warriors2.png' )
LOS_ANGELES =  Image.read( './attributes/los_angeles_lakers.png' )
LOS_ANGELES2 =  Image.read( './attributes/los_angeles_lakers2.png' )
NEW_YORK = Image.read( './attributes/new_york_knicks.png' )




################
## let's try basketball punks

specs = [
   ['Male Mid 1', ATLANTA, 'Smile', 'Mohawk'],
   ['Male Mid 2', BOSTON, 'Wild Hair',  'Horned-Rim Glasses'],
   ['Male Mid 3', BROOKLYN, 'Goat',  'Peak Spike', 'Earring', 'Big Shades'],
   ['Male Mid 1', CHARLOTTE, 'Shaved Head', 'Gold Chain'],

   ['Male Mid 2', CHICAGO, 'Luxurious Beard', 'Messy Hair'],
   ['Male Mid 3', CHICAGO2, 'Clown Nose', 'Clown Hair Green', 'Smile'],
   ['Male Mid 1', CLEVELAND, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],

   ['Male Mid 2', DALLAS,  'Stringy Hair', 'Earring', 'Small Shades'],
   ['Male Mid 3', DENVER,  'Big Beard', 'Mohawk'],
   ['Male Mid 1', GOLDEN_STATE, 'Muttonchops', 'Classic Shades'],
   ['Male Mid 2', GOLDEN_STATE2, 'Crazy Hair', 'Spots'],

   ['Zombie Mid', LOS_ANGELES, 'Messy Hair', 'Earring', 'Classic Shades'],
   ['Ape Mid', LOS_ANGELES2, 'Purple Hair', 'VR', 'Smile'],
   ['Alien Mid', NEW_YORK,  'Frumpy Hair', 'Earring', 'Bubble Gum'],
]


men = ImageComposite.new( 7, 2, width: 32,
                                height: 32,
                                background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = Punk32::Image.generate( *attributes )

  punk.save( "./tmp/basketballer#{i}.png" )
  punk.zoom(4).save( "./tmp/basketballer#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/basketballers.png" )
men.zoom(4).save( "./tmp/basketballers@4x.png" )



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
## basketball club jerseys
ATLANTA_F  =   ATLANTA.left(2)
BOSTON_F   =   BOSTON.left(2)
BROOKLYN_F =   BROOKLYN.left(2)
CHARLOTTE_F =   CHARLOTTE.left(2)
CHICAGO_F   =   CHICAGO.left(2)
CHICAGO2_F  =   CHICAGO2.left(2)
CLEVELAND_F =   CLEVELAND.left(2)
DALLAS_F    =  DALLAS.left(2)
DENVER_F    =  DENVER.left(2)
GOLDEN_STATE_F =   GOLDEN_STATE.left(2)
GOLDEN_STATE2_F  = GOLDEN_STATE2.left(2)
LOS_ANGELES_F =   LOS_ANGELES.left(2)
LOS_ANGELES2_F = LOS_ANGELES2.left(2)
NEW_YORK_F =  NEW_YORK.left(2)


specs = [
   ['Female Mid 1', ATLANTA_F, 'Orange Side', 'Purple Lipstick'],
   ['Female Mid 2', BOSTON_F, 'Wild Hair',  'Horned-Rim Glasses', 'Hot Lipstick'],
   ['Female Mid 3', BROOKLYN_F,  'Wild Blonde', 'Earring',  'Big Shades', 'Hot Lipstick'],  # 'Peak Spike',
   ['Female Mid 1', CHARLOTTE_F, 'Shaved Head', 'Gold Chain', 'Hot Lipstick'],

   ['Female Mid 2', CHICAGO_F,  'Messy Hair', 'Hot Lipstick'],
   ['Female Mid 3', CHICAGO2_F, 'Clown Nose', 'Clown Hair Green', 'Hot Lipstick'],
   ['Female Mid 1', CLEVELAND_F,  'Wild Hair', 'Regular Shades', 'Hot Lipstick'],

   ['Female Mid 2', DALLAS_F, 'Stringy Hair', 'Earring', 'Small Shades', 'Hot Lipstick'],
   ['Female Mid 3', DENVER_F, 'Mohawk'],
   ['Female Mid 1', GOLDEN_STATE_F, 'Straight Hair Blonde', 'Classic Shades', 'Hot Lipstick'],
   ['Female Mid 2', GOLDEN_STATE2_F, 'Crazy Hair', 'Spots', 'Purple Lipstick'],

   ['Zombie Female Mid', LOS_ANGELES_F,  'Blonde Short', 'Earring', 'Classic Shades'],
   ['Ape Female  Mid', LOS_ANGELES2_F, 'Purple Hair', 'VR'],
   ['Alien Female  Mid', NEW_YORK_F, 'Frumpy Hair', 'Earring', 'Bubble Gum'],
]

women = ImageComposite.new( 7, 2, width: 32,
                                height: 32,
                                background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = Punk32::Image.generate( *attributes )

  punk.save( "./tmp/basketballer_woman#{i}.png" )
  punk.zoom(4).save( "./tmp/basketballer_woman#{i}@4x.png" )

  women << punk
end


women.save( "./tmp/basketballer_women.png" )
women.zoom(4).save( "./tmp/basketballer_women@4x.png" )


specs = [
   ['Male Mid 1', ATLANTA, 'Smile', 'Mohawk'],
   ['Female Mid 1', ATLANTA_F, 'Orange Side', 'Purple Lipstick'],
   ['Male Mid 2', BOSTON, 'Wild Hair',  'Horned-Rim Glasses'],
   ['Female Mid 2', BOSTON_F, 'Wild Hair',  'Horned-Rim Glasses', 'Hot Lipstick'],
   ['Male Mid 3', BROOKLYN, 'Goat',  'Peak Spike', 'Earring', 'Big Shades'],
   ['Female Mid 3', BROOKLYN_F,  'Wild Blonde', 'Earring',  'Big Shades', 'Hot Lipstick'],  # 'Peak Spike',
   ['Male Mid 1', CHARLOTTE, 'Shaved Head', 'Gold Chain'],
   ['Female Mid 1', CHARLOTTE_F, 'Shaved Head', 'Gold Chain', 'Hot Lipstick'],

   ['Male Mid 2', CHICAGO, 'Luxurious Beard', 'Messy Hair'],
   ['Female Mid 2', CHICAGO_F,  'Messy Hair', 'Hot Lipstick'],
   ['Male Mid 3', CHICAGO2, 'Clown Nose', 'Clown Hair Green', 'Smile'],
   ['Female Mid 3', CHICAGO2_F, 'Clown Nose', 'Clown Hair Green', 'Hot Lipstick'],
   ['Male Mid 1', CLEVELAND, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],
   ['Female Mid 1', CLEVELAND_F,  'Wild Hair', 'Regular Shades', 'Hot Lipstick'],

   ['Male Mid 2', DALLAS,  'Stringy Hair', 'Earring', 'Small Shades'],
   ['Female Mid 2', DALLAS_F, 'Stringy Hair', 'Earring', 'Small Shades', 'Hot Lipstick'],
   ['Male Mid 3', DENVER,  'Big Beard', 'Mohawk'],
   ['Female Mid 3', DENVER_F, 'Mohawk'],
   ['Male Mid 1', GOLDEN_STATE, 'Muttonchops', 'Classic Shades'],
   ['Female Mid 1', GOLDEN_STATE_F, 'Straight Hair Blonde', 'Classic Shades', 'Hot Lipstick'],
   ['Male Mid 2', GOLDEN_STATE2, 'Crazy Hair', 'Spots'],
   ['Female Mid 2', GOLDEN_STATE2_F, 'Crazy Hair', 'Spots', 'Purple Lipstick'],

   ['Zombie Mid', LOS_ANGELES, 'Messy Hair', 'Earring', 'Classic Shades'],
   ['Zombie Female Mid', LOS_ANGELES_F,  'Blonde Short', 'Earring', 'Classic Shades'],
   ['Ape Mid', LOS_ANGELES2, 'Purple Hair', 'VR', 'Smile'],
   ['Ape Female  Mid', LOS_ANGELES2_F, 'Purple Hair', 'VR'],
   ['Alien Mid', NEW_YORK,  'Frumpy Hair', 'Earring', 'Bubble Gum'],
   ['Alien Female  Mid', NEW_YORK_F, 'Frumpy Hair', 'Earring', 'Bubble Gum'],
  ]

basketball = ImageComposite.new( 7, 4, width: 32,
                                height: 32,
                                background: '#638596' )




specs.each_with_index do |attributes,i|
  punk = Punk32::Image.generate( *attributes )
  basketball << punk
end


basketball.save( "./tmp/basketballers_allstars.png" )
basketball.zoom(4).save( "./tmp/basketballers_allstars@4x.png" )


puts "bye"
