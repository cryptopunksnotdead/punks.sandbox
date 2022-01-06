###############################
# to run use:
#    $  ruby girls.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


FEMALE3    = Punks::Sheet.find_by( name: 'Female 3', size: 's' )

COWBOY_HAT = Punks::Sheet.find_by( name: 'Cowboy Hat', gender: 'f', size: 's' )
HEADBAND   = Punks::Sheet.find_by( name: 'Headband',   gender: 'f', size: 's' )
BIG_SHADES = Punks::Sheet.find_by( name: 'Big Shades', gender: 'f', size: 's' )
PIGTAILS   = Punks::Sheet.find_by( name: 'Pigtails',   gender: 'f', size: 's' )

SMILE3     = Punks::Sheet.find_by( name: 'Smile 3',    gender: 'f', size: 's' )


AMBER = '#ffbf00'    # background colors
BLUE  = '#638596'



####
#  girl 1 - sophia
punk = Image.new( 24, 24, AMBER )
punk.compose!( FEMALE3 )
punk.compose!( PIGTAILS )

punk.save( 'i/sophia.png' )
punk.zoom(4).save( 'i/sophia@4x.png' )

punk.compose!( SMILE3 )
punk.save( 'i/sophia_(2).png' )
punk.zoom(4).save( 'i/sophia_(2)@4x.png' )

punk = punk.change_colors( { AMBER => BLUE })
punk.save( 'i/sophia_(3).png' )
punk.zoom(4).save( 'i/sophia_(3)@4x.png' )



####
#  girl 2 - chloe
punk = Image.new( 24, 24, AMBER )
punk.compose!( FEMALE3 )
punk.compose!( HEADBAND )
punk.compose!( BIG_SHADES )

punk.save( 'i/chloe.png' )
punk.zoom(4).save( 'i/chloe@4x.png' )

punk.compose!( SMILE3 )
punk.save( 'i/chloe_(2).png' )
punk.zoom(4).save( 'i/chloe_(2)@4x.png' )

punk = punk.change_colors( { AMBER => BLUE })
punk.save( 'i/chloe_(3).png' )
punk.zoom(4).save( 'i/chloe_(3)@4x.png' )


####
#  girl 3 - veda
punk = Image.new( 24, 24, AMBER )
punk.compose!( FEMALE3 )
punk.compose!( COWBOY_HAT )

punk.save( 'i/veda.png' )
punk.zoom(4).save( 'i/veda@4x.png' )

punk.compose!( SMILE3 )
punk.save( 'i/veda_(2).png' )
punk.zoom(4).save( 'i/veda_(2)@4x.png' )

## change background color to "classic" blue-ish
punk = punk.change_colors( { AMBER => BLUE })
punk.save( 'i/veda_(3).png' )
punk.zoom(4).save( 'i/veda_(3)@4x.png' )



####
#  Bonus - smiling girls with hoodies

HOODIE     = Punks::Sheet.find_by( name: 'Hoodie',   gender: 'f', size: 's' )

punk = Image.new( 24, 24, BLUE )
punk.compose!( FEMALE3 )
punk.compose!( HOODIE )

punk.save( 'i/girl.png' )
punk.zoom(4).save( 'i/girl@4x.png' )


punk.compose!( SMILE3 )

punk.save( 'i/girl_(2).png' )
punk.zoom(4).save( 'i/girl_(2)@4x.png' )



GRAY =   '#555555'     # hoodie colors
PINK =   '#FFC0CB'

punk = Image.new( 24, 24, BLUE )
punk.compose!( FEMALE3 )
punk.compose!( HOODIE.change_colors( GRAY => PINK ) )
punk.compose!( SMILE3 )

punk.save( 'i/girl_(3).png' )
punk.zoom(4).save( 'i/girl_(3)@4x.png' )
punk.zoom(8).save( 'i/girl_(3)@8x.png' )




#####
#  save the attributes for inline display in quote

punk = Image.new( 24, 24 )
punk.compose!( FEMALE3 )
punk.compose!( HOODIE )
punk.save( 'i/hoodie.png' )

punk = Image.new( 24, 24 )
punk.compose!( FEMALE3 )
punk.compose!( COWBOY_HAT )
punk.save( 'i/cowboy_hat.png' )

punk = Image.new( 24, 24 )
punk.compose!( FEMALE3 )
punk.compose!( SMILE3 )
punk.save( 'i/smile3.png' )


puts "bye"


