###############################
# to run use:
#    $  ruby ./generate.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


#####################################
## generate 12x12
composite = ImageComposite.new( 12, 12 )



(0..9999).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   next unless attributes.include?( 'Pipe' )

   pp attributes

   laser_eyes = ['Laser Eyes', 'Laser Eyes Gold']

   attributes = attributes.map do |attribute|
                    attribute = 'Bubble Gum'   if attribute == 'Pipe'

                    # bonus - "beautify" some "boring" attributes
                    attribute = 'Jester Hat'           if attribute == 'Police Cap'
                    attribute = 'Royal Cocktail Hat'   if attribute == 'Pilot Helmet'  # female only
                    attribute = 'Flowers'              if attribute == 'Welding Goggles' # female only
                    attribute = 'Bow'                  if attribute == 'Pink With Hat'  # female only

                    attribute = "Beret"                if attribute == 'Bandana'
                    attribute = "Sombrero"             if attribute == 'Cap'
                    attribute = 'Panama Hat'           if attribute == 'Stringy Hair'

                    attribute = 'Heart Shades'         if attribute == 'Eye Patch'

                    attribute = "Black Afro"           if attribute == 'Do-rag'
                    attribute = "Black Buzz Cut"       if attribute == 'Shaved Head'

                    attribute = laser_eyes[ rand( laser_eyes.size ) ]  if attribute == 'Small Shades'

                    attribute
                end

   punk = Punks::Image.generate( *attributes )

   composite << punk

   break if composite.count >= 144   ## 12x12
end


composite.save( "./tmp/bubblepunks.png" )
composite.zoom(2).save( "./tmp/bubblepunks@2x.png" )
composite.zoom(4).save( "./tmp/bubblepunks@4x.png" )



puts "bye"

