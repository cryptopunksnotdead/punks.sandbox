require 'punks'



MALE1      = Image.read( './attributes/male1.png' )
MALE2      = Image.read( './attributes/male2.png' )
MALE3      = Image.read( './attributes/male3.png' )

## national (selection) team jerseys
ARGENTINA  = Image.read( './attributes/jersey-argentina.png' )
BRAZIL     = Image.read( './attributes/jersey-brazil.png' )
FRANCE     = Image.read( './attributes/jersey-france.png' )
PORTUGUAL  = Image.read( './attributes/jersey-portugal.png' )

## football club jerseys
ARSENAL           = Image.read( './attributes/jersey-arsenal.png' )
BARCELONA         = Image.read( './attributes/jersey-barcelona.png' )
BAYERN            = Image.read( './attributes/jersey-bayern.png' )
INTERNAZIONALE    = Image.read( './attributes/jersey-internazionale.png' )
JUVENTUS          = Image.read( './attributes/jersey-juventus.png' )
LILLE             = Image.read( './attributes/jersey-lille.png' )
LIVERPOOL         = Image.read( './attributes/jersey-liverpool.png' )
MANCHERSTER_CITY  = Image.read( './attributes/jersey-manchester_city.png' )
AUSTRIA           = Image.read( './attributes/jersey-austria_wien.png' )
RAPID              = Image.read( './attributes/jersey-rapid_wien.png' )


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
   [MALE1, ARGENTINA, 'Smile', 'Mohawk'],
   [MALE2, BRAZIL, 'Wild Hair',  'Horned-Rim Glasses'],
   [MALE3, FRANCE, 'Goat', 'Earring', 'Peak Spike',  'Big Shades'],
   [MALE1, PORTUGUAL, 'Shaved Head', 'Gold Chain'],

   [MALE2, ARSENAL, 'Luxurious Beard', 'Messy Hair'],
   [MALE3, BARCELONA, 'Clown Nose', 'Clown Hair Green', 'Smile'],
   [MALE1, BAYERN, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],

   [MALE2, INTERNAZIONALE, 'Earring', 'Stringy Hair', 'Small Shades'],
   [MALE3, JUVENTUS,  'Big Beard', 'Mohawk'],
   [MALE1, LILLE, 'Muttonchops', 'Classic Shades'],
   [MALE2, LIVERPOOL, 'Crazy Hair', 'Spots'],

   [MALE3, MANCHERSTER_CITY, 'Earring', 'Messy Hair', 'Classic Shades'],
   [MALE1, AUSTRIA, 'Purple Hair', 'VR', 'Smile'],
   [MALE2, RAPID, 'Earring', 'Frumpy Hair', 'Bubble Gum'],
]

men = ImageComposite.new( 7, 2, width: 32,
                                height: 32,
                                background: ['#2BA734', '#59D062'] )


specs.each_with_index do |attributes,i|
  punk = generate_punk( *attributes )

  punk.save( "./tmp/footballer#{i}.png" )
  punk.zoom(4).save( "./tmp/footballer#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/footballers_v2.png" )
men.zoom(4).save( "./tmp/footballers_v2@4x.png" )


puts "bye"