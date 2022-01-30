require 'cryptopunks'

## inspired by noun #179 - bud light super bowl LVI 2022 picture profile
#  see https://nouns.wtf/auction/179

FACE_BEER         = Image.read( './i/beer-24x24.png' )
GLASSES_SQUARE    = Image.read( './i/glasses_square_gray_light-24x24.png' )

## more punk attributes


HEART_SHADES = Punks::Sheet.find_by( name: 'Heart Shades', gender: 'm' )
PIPE         = Punks::Sheet.find_by( name: 'Pipe', gender: 'm' )
CIGARETTE    = Punks::Sheet.find_by( name: 'Cigarette', gender: 'm' )
_3D_GLASSES  = Punks::Sheet.find_by( name: '3D Glasses',  gender: 'm' )
BUBBLE_GUM   = Punks::Sheet.find_by( name: 'Bubble Gum',  gender: 'm' )

NERD_GLASSES    = Punks::Sheet.find_by( name: 'Nerd Glasses',  gender: 'm' )
VR             = Punks::Sheet.find_by( name: 'VR', gender: 'm' )
REGULAR_SHADES = Punks::Sheet.find_by( name: 'Regular Shades', gender: 'm' )
BIG_SHADES     = Punks::Sheet.find_by( name: 'Big Shades', gender: 'm' )

BIRTHDAY_HAT   = Punks::Sheet.find_by( name: 'Birthday Hat', gender: 'm' )



composite = ImageComposite.new( 3, 3, background: '#638596' )

punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
composite << punk

punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
punk.compose!( GLASSES_SQUARE)
composite << punk

punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
punk.compose!( GLASSES_SQUARE)
punk.compose!( BIRTHDAY_HAT )
punk.compose!( PIPE )
composite << punk



punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
punk.compose!( _3D_GLASSES )
composite << punk

punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
punk.compose!( HEART_SHADES )
composite << punk

punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
punk.compose!( VR )
composite << punk



punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
punk.compose!( REGULAR_SHADES )
punk.compose!( CIGARETTE )
composite << punk


punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
punk.compose!( BIG_SHADES )
composite << punk


punk = Image.new( 24, 24 )
punk.compose!( FACE_BEER )
punk.compose!( NERD_GLASSES )
punk.compose!( BUBBLE_GUM )
composite << punk



composite.save( "./tmp/beers.png" )
composite.zoom(4).save( "./tmp/beers@4x.png" )
composite.zoom(8).save( "./tmp/beers@8x.png" )



puts "bye"