###############################
# to run use:
#    $  ruby christmas/grinch.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


grinch = Image.read( "./i/grinch.png" )

grinch.zoom(4).save( "./i/grinch@4x.png" )




HEART_SHADES = Punks::Sheet.find_by( name: 'Heart Shades', gender: 'm' )
PIPE         = Punks::Sheet.find_by( name: 'Pipe', gender: 'm' )
CIGAR        = Punks::Sheet.find_by( name: 'Cigar', gender: 'm' )
MEDICAL_MASK  = Punks::Sheet.find_by( name: 'Medical Mask', gender: 'm' )
_3D_GLASSES  = Punks::Sheet.find_by( name: '3D Glasses',  gender: 'm' )
BUBBLE_GUM   = Punks::Sheet.find_by( name: 'Bubble Gum',  gender: 'm' )

NERD_GLASSES       = Punks::Sheet.find_by( name: 'Nerd Glasses',  gender: 'm' )
HORNED_RIM_GLASSES = Punks::Sheet.find_by( name: 'Horned Rim Glasses', gender: 'm' )
VR                 = Punks::Sheet.find_by( name: 'VR', gender: 'm' )
CLASSIC_SHADES     = Punks::Sheet.find_by( name: 'Classic Shades', gender: 'm' )

EARRING            = Punks::Sheet.find_by( name: 'Earring', gender: 'm' )



BACKGROUND = '#97C24E'

composite = ImageComposite.new( 3, 3 )

punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )

composite << punk


punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )
punk.compose!( HEART_SHADES )

composite << punk


punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )
punk.compose!( HEART_SHADES )
punk.compose!( BUBBLE_GUM )

composite << punk


punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )
punk.compose!( MEDICAL_MASK )

composite << punk

punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )
punk.compose!( PIPE )
punk.compose!( _3D_GLASSES )

composite << punk


punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )
punk.compose!( NERD_GLASSES )

composite << punk


punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )
punk.compose!( CLASSIC_SHADES )
punk.compose!( EARRING )
punk.compose!( CIGAR )

composite << punk


punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )
punk.compose!( HORNED_RIM_GLASSES )

composite << punk


punk = Image.new( 24, 24, BACKGROUND )
punk.compose!( grinch )
punk.compose!( VR )
composite << punk



composite.save( "./tmp/grinch.png" )
composite.zoom( 4 ).save( "./tmp/grinch@4x.png" )
composite.zoom( 8 ).save( "./tmp/grinch@8x.png" )


puts "bye"
