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


def generate_punk( *attributes )
  punk = Image.new( 40, 40 )
  attributes.each do |attribute_name|
      attribute =  if attribute_name.is_a?( Image )
                        attribute_name
                   else  ## assume name as string
                        Punk::Sheet.find_by( name: attribute_name, gender: 'm' )
                   end

     offset = if attribute.width == 24 && attribute.height == 24
                [6,7] ## offset x/y for classic 24x24 attributes in 40x40 canvas
              else
                [0,0]
              end

      punk.compose!( attribute, *offset )
  end
  punk
end


################
## let's try football punks

specs = [
   [MALE1, ARGENTINA, 'Smile', 'Mohawk'],
   [MALE2, BRAZIL, 'Wild Hair', 'Pipe', 'Nerd Glasses'],
   [MALE3, FRANCE, 'Goat', 'Earring', 'Wild Hair', 'Big Shades'],

   [MALE1, PORTUGUAL, 'Do-rag'],
   [MALE2, ARSENAL, 'Luxurious Beard', 'Messy Hair'],
   [MALE3, BARCELONA, 'Big Beard', 'Police Cap', 'Clown Nose'],

   [MALE1, BAYERN, 'Luxurious Beard', 'Wild Hair', 'Regular Shades'],
   [MALE2, INTERNAZIONALE, 'Earring', 'Stringy Hair', 'Small Shades'],
   [MALE3, JUVENTUS, 'Frown', 'Mohawk'],

   [MALE1, LILLE, 'Muttonchops', 'Eye Mask'],
   [MALE2, LIVERPOOL, 'Crazy Hair'],
   [MALE3, MANCHERSTER_CITY, 'Earring', 'Messy Hair', 'Classic Shades'],
]


men = ImageComposite.new( 6, 2, width: 40,
                                height: 40,
                                background: ['#2BA734', '#59D062'] )


specs.each_with_index do |attributes,i|
  punk = generate_punk( *attributes )

  punk.save( "./tmp/footballer#{i}.png" )
  punk.zoom(4).save( "./tmp/footballer#{i}@4x.png" )

  men << punk
end


men.save( "./tmp/footballers.png" )
men.zoom(4).save( "./tmp/footballers@4x.png" )


puts "bye"