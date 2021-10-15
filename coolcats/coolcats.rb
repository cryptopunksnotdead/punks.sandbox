##################################################
#  generate some coolcats 24x24 via attributes; to run use
#
#  $ ruby ./coolcats.rb

require 'pixelart'


base = Image.read( "i/base.png" )


base.zoom(4).save( "i/base@4x.png" )
base.zoom(8).save( "i/base@8x.png" )


### try some coolcats
coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/face-ditto.png" ))
coolcat.compose!( Image.read( "i/hat-beret_red.png" ))
coolcat.save( "i/coolcat1.png")
coolcat.zoom(4).save( "i/coolcat1@4x.png" )


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/face-hearts.png" ))
coolcat.compose!( Image.read( "i/hat-afro_black.png" ))
coolcat.save( "i/coolcat2.png")
coolcat.zoom(4).save( "i/coolcat2@4x.png" )


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/face-unamused.png" ))
coolcat.save( "i/coolcat3.png")
coolcat.zoom(4).save( "i/coolcat3@4x.png" )



puts "bye"

