$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'




## basketball club jerseys
ATLANTA  = Image.read( './attributes/jersey-atlanta_hawks.png' )
BOSTON   = Image.read( './attributes/jersey-boston_celtics.png' )
BROOKLYN = Image.read( './attributes/jersey-brooklyn_nets.png' )
CHARLOTTE = Image.read( './attributes/jersey-charlotte_hornets.png' )
CHICAGO   = Image.read( './attributes/jersey-chicago_bulls.png' )
CHICAGO2  = Image.read( './attributes/jersey-chicago_bulls2.png' )
CLEVELAND = Image.read( './attributes/jersey-cleveland_cavaliers.png' )
DALLAS    = Image.read( './attributes/jersey-dallas_mavericks.png' )
DENVER    = Image.read( './attributes/jersey-denver_nuggets.png' )
GOLDEN_STATE =  Image.read( './attributes/jersey-golden_state_warriors.png' )
GOLDEN_STATE2  = Image.read( './attributes/jersey-golden_state_warriors2.png' )
LOS_ANGELES =  Image.read( './attributes/jersey-los_angeles_lakers.png' )
LOS_ANGELES2 =  Image.read( './attributes/jersey-los_angeles_lakers2.png' )
NEW_YORK = Image.read( './attributes/jersey-new_york_knicks.png' )




################
## let's try basketball punks

specs = [
   ['Male Mid 1', ATLANTA, 'Smile', 'Mohawk'],
   ['Male Mid 2', BOSTON, 'Wild Hair',  'Horned-Rim Glasses'],
   ['Male Mid 3', BROOKLYN, 'Goat', 'Earring', 'Peak Spike',  'Big Shades'],
   ['Male Mid 1', CHARLOTTE, 'Shaved Head', 'Gold Chain'],

   ['Male Mid 2', CHICAGO, 'Luxurious Beard', 'Messy Hair'],
   ['Male Mid 3', CHICAGO2, 'Clown Nose', 'Clown Hair Green', 'Smile'],
   ['Male Mid 1', CLEVELAND, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],

   ['Male Mid 2', DALLAS, 'Earring', 'Stringy Hair', 'Small Shades'],
   ['Male Mid 3', DENVER,  'Big Beard', 'Mohawk'],
   ['Male Mid 1', GOLDEN_STATE, 'Muttonchops', 'Classic Shades'],
   ['Male Mid 2', GOLDEN_STATE2, 'Crazy Hair', 'Spots'],

   ['Male Mid 3', LOS_ANGELES, 'Earring', 'Messy Hair', 'Classic Shades'],
   ['Male Mid 1', LOS_ANGELES2, 'Purple Hair', 'VR', 'Smile'],
   ['Male Mid 2', NEW_YORK, 'Earring', 'Frumpy Hair', 'Bubble Gum'],
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


puts "bye"