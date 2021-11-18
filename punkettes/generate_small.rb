###############################
# to run use:
#    $  ruby ./generate_small.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


require_relative 'converters'


#####################################
#  generate preview 10x10
composite = ImageComposite.new( 10, 10 )


count = 0
(0..200).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## skip all archetypes except male(s) 1/2/3/4
   next unless attributes[0].index( "Male" )

   count += 1

   puts "==> #{id}:"
   pp attributes
   puts "   ==>"
   attributes_new = convert_to_punkette( *attributes )
   pp attributes_new

   punk = Punks::Image.generate( *attributes )
   composite << punk

   punk = Punks::Image.generate( *attributes_new )
   composite << punk

   break if count >= 50
end


composite.save( "./tmp/punkettes_small.png" )
composite.zoom(2).save( "./tmp/punkettes_small@2x.png" )
composite.zoom(4).save( "./tmp/punkettes_small@4x.png" )



puts "bye"

