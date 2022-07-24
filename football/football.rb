require 'punks'



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



################
## let's try football punks

specs = [
   ['Male Mid 1', ARGENTINA, 'Smile', 'Mohawk'],
   ['Male Mid 2', BRAZIL, 'Wild Hair',  'Horned-Rim Glasses'],
   ['Male Mid 3', FRANCE, 'Goat', 'Earring', 'Peak Spike',  'Big Shades'],
   ['Male Mid 1', PORTUGUAL, 'Shaved Head', 'Gold Chain'],

   ['Male Mid 2', ARSENAL, 'Luxurious Beard', 'Messy Hair'],
   ['Male Mid 3', BARCELONA, 'Clown Nose', 'Clown Hair Green', 'Smile'],
   ['Male Mid 1', BAYERN, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],

   ['Male Mid 2', INTERNAZIONALE, 'Earring', 'Stringy Hair', 'Small Shades'],
   ['Male Mid 3', JUVENTUS,  'Big Beard', 'Mohawk'],
   ['Male Mid 1', LILLE, 'Muttonchops', 'Classic Shades'],
   ['Male Mid 2', LIVERPOOL, 'Crazy Hair', 'Spots'],

   ['Male Mid 3', MANCHERSTER_CITY, 'Earring', 'Messy Hair', 'Classic Shades'],
   ['Male Mid 1', AUSTRIA, 'Purple Hair', 'VR', 'Smile'],
   ['Male Mid 2', RAPID, 'Earring', 'Frumpy Hair', 'Bubble Gum'],
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


puts "bye"