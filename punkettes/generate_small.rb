###############################
# to run use:
#    $  ruby ./generate_small.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


#####################################
## generate preview 10x10
composite = ImageComposite.new( 10, 10 )


MOUTH_EXPRESSION = [ 'Smile',
                    'Frown']
MOUTH_TEETH      = ['Buck Teeth']
BEARD =  [ 'Big Beard', 'Front Beard Dark', 'Handlebars', 'Front Beard',
              'Chinstrap',
              'Goat',
              'Muttonchops',
              'Luxurious Beard',
              'Mustache',
              'Normal Beard Black', 'Normal Beard',
              'Shadow Beard' ]

MOUTH_MAKEUP     = ['Black Lipstick', 'Purple Lipstick', 'Hot Lipstick']


EXCLUDE =  MOUTH_EXPRESSION +
           MOUTH_TEETH +
           BEARD


## fix: add smile!!
## !! WARN - no lookup found for 3 key(s) >["smile1_(f+s)", "smile1_(f+u)", "smile1_(u+s)"]<


count = 0
(0..200).each do |id|
   attributes = CryptopunksData.punk_attributes( id )
   pp attributes

   punk_org = Punks::Image.generate( *attributes )


   punk = Image.new( 24, 24 )

   if attributes[0].index( "Male")
         ## change male to female (unisize)
          attributes[0] = attributes[0].sub('Male','Female')
   else
        next  ### skip all others for now
   end

   pp attributes

   count += 1

   composite << punk_org


   archetype = Punks::Sheet.find_by( name: attributes[0] )
   punk.compose!( archetype )


   attributes[1..-1].each do |attribute|

       next if EXCLUDE.include?( attribute )

      # if attributes[0].index( "Female") && attribute == 'Smile'
      #    attribute = "Smile 1"   if attributes[0].index( "Female 1" )
      #    attribute = "Smile 2"   if attributes[0].index( "Female 3" )
      #    attribute = "Smile 3"   if attributes[0].index( "Female 2" )
      # end

       attribute = "Black Afro"       if attribute == 'Peak Spike'

     part = Punks::Sheet.find_by( name: attribute, gender: 'f', size: 's' )
     punk.compose!( part )
   end

   composite << punk

   break if count >= 50
end

composite.save( "./tmp/punkettes_small.png" )
composite.zoom(2).save( "./tmp/punkettes_small@2x.png" )
composite.zoom(4).save( "./tmp/punkettes_small@4x.png" )



puts "bye"

