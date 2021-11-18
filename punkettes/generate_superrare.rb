###############################
# to run use:
#    $  ruby ./generate_superrare.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


require_relative 'converters'


#####################################
#  generate preview 10x10
composite = ImageComposite.new( 10, 10 )


count = 0
(0..9999).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## skip unless super rare
   next unless ['Zombie', 'Ape', 'Alien'].include?( attributes[0] )

   count += 1

   puts "==> #{id} / (#{count}):"

   pp attributes
   puts "   ==>"
   attributes_new = convert_to_punkette( *attributes )
   pp attributes_new


   punk = Punks::Image.generate( *attributes )
   punk.zoom(4).save( "./tmp2/punk#{'%04d' % id}.png" )

   composite << punk   if count <= 50


   punk = Punks::Image.generate( *attributes_new )
   punk.zoom(4).save( "./tmp2/punk#{'%04d' % id}(ii).png" )

   composite << punk   if count <= 50
end


composite.save( "./tmp2/punkettes_superrare.png" )
composite.zoom(2).save( "./tmp2/punkettes_superrare@2x.png" )
composite.zoom(4).save( "./tmp2/punkettes_superrare@4x.png" )


puts "  #{count} super rare(s)"      #  121 super rare(s)
puts "bye"

