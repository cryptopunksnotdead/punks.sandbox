require 'punks'



MALE1      = Image.read( '../football/attributes/male1.png' )
MALE2      = Image.read( '../football/attributes/male2.png' )
MALE3      = Image.read( '../football/attributes/male3.png' )

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
## let's try football punks

specs = [
   [MALE1, ATLANTA, 'Smile', 'Mohawk'],
   [MALE2, BOSTON, 'Wild Hair',  'Horned-Rim Glasses'],
   [MALE3, BROOKLYN, 'Goat', 'Earring', 'Peak Spike',  'Big Shades'],
   [MALE1, CHARLOTTE, 'Shaved Head', 'Gold Chain'],

   [MALE2, CHICAGO, 'Luxurious Beard', 'Messy Hair'],
   [MALE3, CHICAGO2, 'Clown Nose', 'Clown Hair Green', 'Smile'],
   [MALE1, CLEVELAND, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],

   [MALE2, DALLAS, 'Earring', 'Stringy Hair', 'Small Shades'],
   [MALE3, DENVER,  'Big Beard', 'Mohawk'],
   [MALE1, GOLDEN_STATE, 'Muttonchops', 'Classic Shades'],
   [MALE2, GOLDEN_STATE2, 'Crazy Hair', 'Spots'],

   [MALE3, LOS_ANGELES, 'Earring', 'Messy Hair', 'Classic Shades'],
   [MALE1, LOS_ANGELES2, 'Purple Hair', 'VR', 'Smile'],
   [MALE2, NEW_YORK, 'Earring', 'Frumpy Hair', 'Bubble Gum'],
]


men = ImageComposite.new( 7, 2, width: 32,
                                height: 32,
                                background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = generate_punk( *attributes )

  punk.save( "./tmp/basketballer#{i}.png" )
  punk.zoom(4).save( "./tmp/basketballer#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/basketballers.png" )
men.zoom(4).save( "./tmp/basketballers@4x.png" )


puts "bye"