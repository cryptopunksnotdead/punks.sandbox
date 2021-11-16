#####################
#  generate corona/covid punks; to run use:
#
#   $ ruby ./generate.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


ALIEN    =  Image.read( "./i/alien.png" )
ALIEN_II =  Image.read( "./i/alien-ii.png" )
DEMON    =  Image.read( "./i/demon.png" )
DEMON_II =  Image.read( "./i/demon-ii.png" )
ZOMBIE   =  Image.read( "./i/zombie.png" )
HUMAN1   =  Image.read( "./i/human-darker.png" )
HUMAN3   =  Image.read( "./i/human-light.png" )
SKELETON =  Image.read( "./i/skeleton.png" )


PIPE           = Punks::Sheet.find_by( name: "Pipe",       gender: "m" )
CIGARETTE      = Punks::Sheet.find_by( name: "Cigarette",  gender: "m" )
BUBBLE_GUM     = Punks::Sheet.find_by( name: "Bubble Gum",  gender: "m" )
FLOWERS        = Punks::Sheet.find_by( name: "Flowers",  gender: "f" )
HEADBAND       = Punks::Sheet.find_by( name: "Headband",   gender: "m" )
_3D_GLASSES    = Punks::Sheet.find_by( name: "3D Glasses",  gender: "m" )
EYE_PATCH      = Punks::Sheet.find_by( name: "Eye Patch",   gender: "m" )
CLASSIC_SHADES = Punks::Sheet.find_by( name: "Classic Shades",  gender: "m" )
VR             = Punks::Sheet.find_by( name: "VR",  gender: "m" )

KNITTED_CAP    = Punks::Sheet.find_by( name: "Knitted Cap",  gender: "m" )
CAP            = Punks::Sheet.find_by( name: "Cap",          gender: "m" )

BIRTHDAY_HAT     = Punks::Sheet.find_by( name: "Birthday Hat",   gender: "m" )


composite = ImageComposite.new( 3, 8, width: 28, height: 28 )  # 3x8 = 24 punks


punk = Image.new( 26, 26 )   ## add 1px "buffer"
punk.compose!( ALIEN, 1, 1 )
punk.zoom(4).save( "./tmp/alien@4x.png" )
composite << punk

punk.compose!( HEADBAND, 1, 0 )
punk.zoom(4).save( "./tmp/alien0@4x.png" )
composite << punk

punk.compose!( PIPE, 1, 0 )
punk.zoom(4).save( "./tmp/alien1@4x.png" )

punk.compose!( _3D_GLASSES, 1, 0 )
punk.zoom(4).save( "./tmp/alien2@4x.png" )
composite << punk



punk = Image.new( 26, 26 )   ## add 1px "buffer"
punk.compose!( ALIEN_II, 1, 1 )
punk.zoom(4).save( "./tmp/alien(ii)@4x.png" )
composite << punk

punk.compose!( HEADBAND, 1, 0 )
punk.zoom(4).save( "./tmp/alien(ii)0@4x.png" )
composite << punk

punk.compose!( PIPE, 1, 0 )
punk.zoom(4).save( "./tmp/alien(ii)1@4x.png" )

punk.compose!( _3D_GLASSES, 1, 0 )
punk.zoom(4).save( "./tmp/alien(ii)2@4x.png" )
composite << punk




punk = Image.new( 26, 26 )   ## add 1px "buffer"
punk.compose!( ZOMBIE, 1, 1 )
punk.zoom(4).save( "./tmp/zombie@4x.png" )
composite << punk

punk.compose!( CLASSIC_SHADES, 1, 0 )
punk.zoom(4).save( "./tmp/zombie0@4x.png" )
composite << punk

punk.compose!( KNITTED_CAP, 1, 0 )
punk.zoom(4).save( "./tmp/zombie1@4x.png" )
composite << punk




punk = Image.new( 26, 26 )   ## add 1px "buffer"
punk.compose!( HUMAN1, 1, 1 )
punk.zoom(4).save( "./tmp/humani@4x.png" )
composite << punk

punk.compose!( VR, 1, 0 )
punk.zoom(4).save( "./tmp/humani0@4x.png" )
composite << punk

punk.compose!( CAP, 1, 0 )
punk.zoom(4).save( "./tmp/humani1@4x.png" )
composite << punk



punk = Image.new( 26, 26 )   ## add 1px "buffer"
punk.compose!( HUMAN3, 1, 1 )
punk.zoom(4).save( "./tmp/humaniii@4x.png" )
composite << punk

punk.compose!( _3D_GLASSES, 1, 0 )
punk.zoom(4).save( "./tmp/humaniii0@4x.png" )
composite << punk

punk.compose!( BIRTHDAY_HAT, 1, 0 )
punk.zoom(4).save( "./tmp/humaniii1@4x.png" )
composite << punk



punk = Image.new( 26, 26 )   ## add 1px "buffer"
punk.compose!( DEMON, 1, 1 )
punk.zoom(4).save( "./tmp/demon@4x.png" )
composite << punk

punk.compose!( CIGARETTE, 1, 0 )
punk.zoom(4).save( "./tmp/demon0@4x.png" )
composite << punk

punk.compose!( EYE_PATCH, 1, 0 )
punk.zoom(4).save( "./tmp/demon1@4x.png" )
composite << punk


punk = Image.new( 26, 26 )   ## add 1px "buffer"
punk.compose!( DEMON_II, 1, 1 )
punk.zoom(4).save( "./tmp/demon(ii)@4x.png" )
composite << punk

punk.compose!( CIGARETTE, 1, 0 )
punk.zoom(4).save( "./tmp/demon(ii)0@4x.png" )
composite << punk

punk.compose!( EYE_PATCH, 1, 0 )
punk.zoom(4).save( "./tmp/demon(ii)1@4x.png" )
composite << punk


punk = Image.new( 26, 26 )   ## add 1px "buffer"
punk.compose!( SKELETON, 1, 1 )
punk.zoom(4).save( "./tmp/skeleton@4x.png" )
composite << punk

punk.compose!( FLOWERS, 1, 0 )
punk.zoom(4).save( "./tmp/skeleton0@4x.png" )
composite << punk

punk.compose!( BUBBLE_GUM, 1, 0 )
punk.zoom(4).save( "./tmp/skeleton1@4x.png" )
composite << punk



composite.save( "./tmp/punks.png" )
composite.zoom( 2 ).save( "./tmp/punks@2x.png" )


puts "bye"