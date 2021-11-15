#####################
#  generate "natural" punks; to run use:
#
#   $ ruby ./generate_200.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



##  get attributes of first two hundred punks (using "offline/offchain" contract)
punks = (0..199).map { |id|  CryptopunksData.punk_attributes( id ) }
pp punks



composite       = ImageComposite.new( 20, 20 )  ## 20x20 grid (=400 punks)
composite10x10  = ImageComposite.new( 10, 10 )  ## 10x10 grid (=100 punks)

punks.each_with_index do |attributes,i|
  name = "punk" + ('%03d' % i)

  punk = Punks::Image.generate( *attributes )

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )

  composite      << punk
  composite10x10 << punk    if i < 50

  punk = Punks::Image.generate( *attributes, style: 'natural' )

  punk.save( "./tmp/#{name}(ii).png" )
  punk.zoom(4).save( "./tmp/#{name}(ii)@4x.png" )

  composite      << punk
  composite10x10 << punk    if i < 50
end



composite.save( "./tmp/punks.png" )
composite.zoom(2).save( "./tmp/punks@2x.png" )

composite10x10.save( "./tmp/punks10x10.png" )
composite10x10.zoom(4).save( "./tmp/punks10x10@4x.png" )

puts "bye"
