###############################
# to run use:
#    $  ruby ./generate_joker.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


#####################################
## generate preview 10x10
composite = ImageComposite.new( 10, 10 )

joker_m = Image.read( "./i/joker-male.png" )
joker_f = Image.read( "./i/joker-female.png" )


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

EYES_MAKEUP = ['Purple Eye Shadow',
               'Blue Eye Shadow',
               'Green Eye Shadow']

EXCLUDE =  MOUTH_EXPRESSION +
           MOUTH_TEETH +
           MOUTH_MAKEUP +
           EYES_MAKEUP +
           BEARD



## add pick random hair color


srand( 888 )  ## make random start with determistic seed



def pick_hair_color
  # colors = ['Blonde', 'Silver', 'Periwinkle',
  #           'Pink', 'Teal', 'Green', 'Light Green',
  #           'Blue', 'Light Blue',
  #           'Red', 'Dark Red']

    ## only use "darker"  colors  - why? why not?
    colors = [
              'Orange', 'Red', 'Green', 'Purple']

   colors[ rand( colors.size ) ]
end



(0..99).each do |id|
   attributes = CryptopunksData.punk_attributes( id )
   pp attributes

   punk = Image.new( 24, 24 )

   gender =  if attributes[0].index( "Female")
                'f'
             else ## assume male
                'm'
             end

   punk.compose!( gender == 'f' ? joker_f : joker_m )

   attributes[1..-1].each do |attribute|

     next if EXCLUDE.include?( attribute )

     attribute_hair = nil

     # "beautify" some "boring" attributes
     attribute = 'Jester Hat'           if attribute == 'Police Cap'

     attribute, attribute_hair = ['Royal Cocktail Hat',
                                   "Straight Hair Dark"]  if attribute == 'Pilot Helmet'  # female only
     attribute, attribute_hair = ['Bow',
                                  "Straight Hair Dark"]  if attribute == 'Pink With Hat'  # female only
     attribute = 'Flowers'  if attribute == 'Welding Goggles' # female only

     attribute = "Beret"                if attribute == 'Bandana'
     attribute = "Sombrero 2"           if attribute == 'Cap'
     attribute = 'Panama Hat'           if attribute == 'Stringy Hair'

     attribute = 'Heart Shades'         if attribute == 'Eye Patch'

     ## change / colorize black hair styles
     attribute = "Big Hair #{pick_hair_color}"   if attribute == 'Wild Hair'

     attribute = "#{pick_hair_color} Afro"       if attribute == 'Do-rag'
     attribute = "#{pick_hair_color} Buzz Cut"   if attribute == 'Shaved Head'

     ## change hoodie
     hoodies = ['Bear Hood', 'Frog Hood']
     attribute = hoodies[ rand( hoodies.size ) ]  if attribute == 'Hoodie'

     punk.compose!( Punks::Sheet.find_by( name: attribute_hair, gender: gender ))  if attribute_hair
     punk.compose!( Punks::Sheet.find_by( name: attribute, gender: gender ))
   end

   composite << punk
end

composite.save( "./tmp/jokerpunks.png" )
composite.zoom(2).save( "./tmp/jokerpunks@2x.png" )
composite.zoom(4).save( "./tmp/jokerpunks@4x.png" )



puts "bye"

