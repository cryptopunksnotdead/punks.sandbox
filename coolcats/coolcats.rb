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


####
# try some halloween attributes
coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/halloween-jack.png" ))
coolcat.save( "i/halloween1.png")
coolcat.zoom(4).save( "i/halloween1@4x.png" )

coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/halloween-jason.png" ))
coolcat.save( "i/halloween2.png")
coolcat.zoom(4).save( "i/halloween2@4x.png" )

coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/halloween-scream.png" ))
coolcat.save( "i/halloween3.png")
coolcat.zoom(4).save( "i/halloween3@4x.png" )

coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/halloween-skull.png" ))
coolcat.save( "i/halloween4.png")
coolcat.zoom(4).save( "i/halloween4@4x.png" )


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/hat-beret_red.png" ))
coolcat.compose!( Image.read( "i/halloween-jason.png" ))
coolcat.save( "i/halloween5.png")
coolcat.zoom(4).save( "i/halloween5@4x.png" )


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "i/hat-beret_red.png" ))
coolcat.compose!( Image.read( "i/halloween-skull.png" ))
coolcat.save( "i/halloween6.png")
coolcat.zoom(4).save( "i/halloween6@4x.png" )




puts "bye"

