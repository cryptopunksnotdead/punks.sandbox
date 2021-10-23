###############################
# to run use:
#    $  ruby ./generate_scream.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


#####################################
## generate preview 10x10
composite = ImageComposite.new( 10, 10 )

scream_m = Image.read( "./i/scream-male.png" )
scream_f = Image.read( "./i/scream-female.png" )


MOUTH_EXPRESSION = ['Smile', 'Frown']
MOUTH_TEETH      = ['Buck Teeth']
MOUTH_MAKEUP     = ['Black Lipstick', 'Purple Lipstick', 'Hot Lipstick']
BEARD =  [ 'Big Beard', 'Front Beard Dark', 'Handlebars', 'Front Beard',
              'Chinstrap', ## keep chin strap beard for now - why?
              'Goat',
              'Muttonchops',
              'Luxurious Beard',
              'Mustache',
              'Normal Beard Black', 'Normal Beard',
              'Shadow Beard' ]

EXCLUDE =  MOUTH_EXPRESSION +
           MOUTH_TEETH +
           MOUTH_MAKEUP +
           BEARD


(0..99).each do |id|
   attributes = CryptopunksData.punk_attributes( id )
   pp attributes

   punk = Image.new( 24, 24 )

   gender =  if attributes[0].index( "Female" )
                'f'
             else ## assume male
                'm'
             end

   punk.compose!( gender == 'f' ? scream_f : scream_m )

   attributes[1..-1].each do |attribute|

     next if EXCLUDE.include?( attribute )

    # "beautify" some "boring" attributes
     attribute = 'Jester Hat'           if attribute == 'Police Cap'
     attribute = 'Royal Cocktail Hat'   if attribute == 'Pilot Helmet'  # female only
     attribute = 'Flowers'              if attribute == 'Welding Goggles' # female only
     attribute = 'Bow'                  if attribute == 'Pink With Hat'  # female only

     attribute = "Beret"                if attribute == 'Bandana'
     attribute = "Sombrero 2"           if attribute == 'Cap'
     attribute = 'Panama Hat'           if attribute == 'Stringy Hair'

     attribute = 'Heart Shades'         if attribute == 'Eye Patch'

     attribute = "Black Afro"           if attribute == 'Do-rag'
     attribute = "Black Buzz Cut"       if attribute == 'Shaved Head'

     punk.compose!( Punks::Sheet.find_by( name: attribute, gender: gender ))
   end

   composite << punk
end

composite.save( "./tmp/screampunks.png" )
composite.zoom(2).save( "./tmp/screampunks@2x.png" )
composite.zoom(4).save( "./tmp/screampunks@4x.png" )



puts "bye"

