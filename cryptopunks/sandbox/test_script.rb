###
#  to run use
#     ruby -I ./lib sandbox/test_script.rb


require 'cryptopunks'


punks = Punks::Image::Composite.read( './punks.png' )

pp punks.hexdigest
pp punks.size


punks.punk( 0 ).save( './tmp/punk-0000.png ')
punks.punk( 0 ).zoom( 3 ).save( './tmp/punk-0000x3.png ')

punks[ 777 ].save( './tmp/punk-0777.png ')
punks[ 777 ].zoom( 3 ).save( './tmp/punk-0777x3.png ')


puts "bye"
