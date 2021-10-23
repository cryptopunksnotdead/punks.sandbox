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


(0..99).each do |id|
   attributes = CryptopunksData.punk_attributes( id )
   pp attributes

   punk = Image.new( 24, 24 )

   gender =  if attributes[0].index( "Female")
                'f'
             else ## assume male
                'm'
             end

   punk.compose!( gender == 'f' ? scream_f : scream_m )

   attributes[1..-1].each do |attribute|

     next if ['Smile', 'Frown',
              'Buck Teeth',
              'Big Beard', 'Front Beard Dark', 'Handlebars', 'Front Beard',
              'Chinstrap', ## keep chin strap beard for now - why?
              'Goat',
              'Muttonchops',
              'Luxurious Beard',
              'Mustache',
              'Normal Beard Black', 'Normal Beard',
              'Black Lipstick',
              'Purple Lipstick',
              'Hot Lipstick',
              ].include?( attribute )

    # "beautify" some "boring" attributes
     attribute = 'Jester Hat'           if attribute == 'Police Cap'
     attribute = 'Royal Cocktail Hat'   if attribute == 'Pilot Helmet'
     attribute = 'Panama Hat'           if attribute == 'Stringy Hair'
     attribute = 'Flowers'              if attribute == 'Welding Goggles'
     attribute = 'Bow'                  if attribute == 'Pink With Hat'
     attribute = "Beret"                if attribute == 'Bandana'  ## Bear Skin?
     attribute = "Sombrero 2"           if attribute == 'Cap'

     punk.compose!( Punks::Sheet.find_by( name: attribute, gender: gender ))
   end

   composite << punk
end

composite.save( "./tmp/screampunks.png" )
composite.zoom(2).save( "./tmp/screampunks@2x.png" )
composite.zoom(4).save( "./tmp/screampunks@4x.png" )



puts "bye"

