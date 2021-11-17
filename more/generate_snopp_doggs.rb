#####################
#  generate "natural" punks; to run use:
#
#   $ ruby ./generate_snopp_doggs.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



composite  = ImageComposite.new( 2, 2 )  ## 2x2 grid (=4 punks)

punk = Punks::Image.generate( "Male 1", style: 'natural' )
punk.zoom(4).save( "./tmp/snopp_dogg0.png" )
composite << punk

punk = Punks::Image.generate( "Male 1", "Bandana", "Earring", style: 'natural' )
punk.zoom(4).save( "./tmp/snopp_dogg1.png" )
composite << punk

punk = Punks::Image.generate( "Male 1", "Bandana", "Earring", "Big Shades", style: 'natural' )
punk.zoom(4).save( "./tmp/snopp_dogg2.png" )
composite << punk

punk = Punks::Image.generate( "Male 1", "Bandana", "Earring", "Big Shades" )
punk.zoom(4).save( "./tmp/snopp_dogg3.png" )
composite << punk



composite.save( "./tmp/snopp_doggs.png" )
composite.zoom(4).save( "./tmp/snopp_doggs@4x.png" )
composite.zoom(8).save( "./tmp/snopp_doggs@8x.png" )

puts "bye"
