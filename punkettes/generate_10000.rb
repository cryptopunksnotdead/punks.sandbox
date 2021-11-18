###############################
# to run use:
#    $  ruby ./generate_superrare.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


require_relative 'converters'


#####################################
#  generate preview 20x20
composite = ImageComposite.new( 20, 20 )   # 20x20 (= 400punks)


count = 0
(0..399).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## convert all male to female (will drop beard and buck teeth) & keep female as is
   attributes = convert_to_punkette( *attributes )

   puts "==> #{id}:"
   pp attributes

   punk = Punks::Image.generate( *attributes )
   composite << punk
end


composite.save( "./tmp/punkettes_preview.png" )
composite.zoom(2).save( "./tmp/punkettes_preview@2x.png" )




#####################################
#  generate 100x100
composite = ImageComposite.new( 100, 100 )   # 100x100 (= 10000 punks)


count = 0
(0..9999).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## convert all male to female
   attributes = convert_to_punkette( *attributes )

   puts "==> #{id}:"
   pp attributes

   punk = Punks::Image.generate( *attributes )
   composite << punk
end


composite.save( "./tmp/punkettes.png" )



puts "bye"

