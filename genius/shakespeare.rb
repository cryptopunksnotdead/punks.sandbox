###############################
# to run use:
#    $  ruby ./shakespeare.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


##############################
# get shakespeare (no. 25) from punk, the genius edition

genius = ImageComposite.read( "../../awesome-24px/collection/genius.png" )

## change left-looking to right-looking (mirror image)
shakespeare = genius[24].mirror   ## start counting at zero (no. 25 is 25-1= 24)


shakespeare.save( "./tmp/shakespeare.png" )
shakespeare.zoom(4).save( "./tmp/shakespeare@4x.png" )



HEART_SHADES = Punks::Sheet.find_by( name: 'Heart Shades', gender: 'm' )
HEADBAND     = Punks::Sheet.find_by( name: 'Headband', gender: 'm' )
PIPE         = Punks::Sheet.find_by( name: 'Pipe', gender: 'm' )
CAP_FORWARD  = Punks::Sheet.find_by( name: 'Cap Forward', gender: 'm' )
_3D_GLASSES  = Punks::Sheet.find_by( name: '3D Glasses',  gender: 'm' )
BIRTHDAY_HAT = Punks::Sheet.find_by( name: 'Birthday Hat',  gender: 'm' )
BUBBLE_GUM   = Punks::Sheet.find_by( name: 'Bubble Gum',  gender: 'm' )

NERD_GLASSES       = Punks::Sheet.find_by( name: 'Nerd Glasses',  gender: 'm' )
HORNED_RIM_GLASSES = Punks::Sheet.find_by( name: 'Horned Rim Glasses', gender: 'm' )
VR                 = Punks::Sheet.find_by( name: 'VR', gender: 'm' )

HOODIE             = Punks::Sheet.find_by( name: 'Hoodie', gender: 'm' )
BEANIE             = Punks::Sheet.find_by( name: 'Beanie', gender: 'm' )

EARRING            = Punks::Sheet.find_by( name: 'Earring', gender: 'm' )


## note:   archetype "off-by-one"
##         to allow "overflow" place into 26x26 frame
composite = ImageComposite.new( 3, 3, width: 26, height: 26 )

composite << shakespeare


punk = Image.new( 26, 26 )
punk.compose!( shakespeare, 1, 1 )
punk.compose!( HEART_SHADES, 1+1, 1 )

composite << punk


punk = Image.new( 26, 26 )
punk.compose!( shakespeare, 1, 1 )
punk.compose!( HEART_SHADES, 1+1, 1 )
punk.compose!( BIRTHDAY_HAT, 1+1, 1 )
punk.compose!( BUBBLE_GUM, 1+1, 1 )

composite << punk


punk = Image.new( 26, 26 )
punk.compose!( shakespeare, 1, 1 )
punk.compose!( HEADBAND, 1+1, 1 )
punk.compose!( PIPE, 1+1, 1 )

composite << punk

punk = Image.new( 26, 26 )
punk.compose!( shakespeare, 1, 1 )
punk.compose!( PIPE, 1+1, 1 )
punk.compose!( _3D_GLASSES, 1+1, 1 )
punk.compose!( CAP_FORWARD, 1+1, 1-1 )

composite << punk


punk = Image.new( 26, 26 )
punk.compose!( shakespeare, 1, 1 )
punk.compose!( NERD_GLASSES, 1+1, 1 )
punk.compose!( BEANIE, 1+1, 1-1 )

composite << punk

punk = Image.new( 26, 26 )
punk.compose!( shakespeare, 1, 1 )
punk.compose!( HORNED_RIM_GLASSES, 1+1, 1 )
punk.compose!( EARRING, 1+1, 1 )

composite << punk

punk = Image.new( 26, 26 )
punk.compose!( shakespeare, 1, 1 )
punk.compose!( VR, 1+1, 1 )

composite << punk


punk = Image.new( 26, 26 )
punk.compose!( shakespeare, 1, 1 )
punk.compose!( HOODIE, 1+1, 1 )

composite << punk



composite.save( "./tmp/shakespeares.png" )
composite.zoom( 4 ).save( "./tmp/shakespeares@4x.png" )
composite.zoom( 8 ).save( "./tmp/shakespeares@8x.png" )


puts "bye"
