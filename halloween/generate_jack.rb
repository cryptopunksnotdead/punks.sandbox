###############################
# to run use:
#    $  ruby ./generate_jack.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


#####################################
## generate preview 10x10
composite = ImageComposite.new( 10, 10 )

jack_m = Image.read( "./i/jack-o-lantern-male.png" )
jack_f = Image.read( "./i/jack-o-lantern-female.png" )


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



## add pick random hair color


srand( 888 )  ## make random start with determistic seed


def pick_hair_color
  # colors = ['Blonde', 'Silver', 'Periwinkle',
  #           'Pink', 'Teal', 'Green', 'Light Green',
  #           'Blue', 'Light Blue',
  #           'Red', 'Dark Red']

    ## only use "darker"  colors  - why? why not?
    colors = [ 'Purple',
              'Orange', 'Red', 'Dark Red']

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

   punk.compose!( gender == 'f' ? jack_f : jack_m )

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

     ## change / colorize black hair styles
     attribute = "Big Hair #{pick_hair_color}"   if attribute == 'Wild Hair'

     attribute = "#{pick_hair_color} Afro"       if attribute == 'Do-rag'
     attribute = "#{pick_hair_color} Buzz Cut"   if attribute == 'Shaved Head'



     punk.compose!( Punks::Sheet.find_by( name: attribute, gender: gender ))
   end

   composite << punk
end

composite.save( "./tmp/jackpunks.png" )
composite.zoom(2).save( "./tmp/jackpunks@2x.png" )
composite.zoom(4).save( "./tmp/jackpunks@4x.png" )



puts "bye"

