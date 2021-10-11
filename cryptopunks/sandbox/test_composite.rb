###
#  to run use
#     ruby -I ./lib sandbox/test_composite.rb


require 'cryptopunks'


punks = Punks::ImageComposite.read( './punks.png' )

pp punks.size  #=> 10000


punk = punks[ 0 ]
punk.save( './tmp/punk-0000.png ')
punk.zoom( 3 ).save( './tmp/punk-0000@3x.png ')

punk = punks[ 777 ]
punk.save( './tmp/punk-0777.png ')
punk.zoom( 3 ).save( './tmp/punk-0777@3x.png ')


puts "bye"
