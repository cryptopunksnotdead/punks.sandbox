#####################
#  generate "natural" punks; to run use:
#
#   $ ruby ./generate_200.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



##  get attributes of first hundred punks (using "offline/offchain" contract)
punks = (0..199).map { |id|  CryptopunksData.punk_attributes( id ) }
pp punks



composite  = ImageComposite.new( 20, 20 )  ## 20x20 grid (=400 punks)


punks.each_with_index do |attributes,i|
  name = "punk" + ('%03d' % i)

  punk = Punks::Image.generate( *attributes )

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )

  composite << punk

  punk = Punks::Image.generate( *attributes, style: 'natural' )

  punk.save( "./tmp/#{name}(ii).png" )
  punk.zoom(4).save( "./tmp/#{name}(ii)@4x.png" )

  composite << punk
end



composite.save( "./tmp/punks.png" )
composite.zoom(2).save( "./tmp/punks@2x.png" )


puts "bye"
