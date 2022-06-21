require 'pixelart'
require 'backgrounds'


base = Image.read( "./doge_x_goblins-32x32.png" )


doge = ImageComposite.new( 2, 2, width: 32,
                                 height: 32 )


doge << base.background( '#ffbf00' ).mirror    ## phunk left-looking
doge << base.background( '#4F3828' )
doge << base.background( 'ukraine' )
doge << base.background( 'pride')


doge.save( "./tmp/doge_x_goblins.png" )
doge.zoom(4).save( "./tmp/doge_x_goblins@4x.png" )
doge.zoom(8).save( "./tmp/doge_x_goblins@8x.png" )

puts "bye"