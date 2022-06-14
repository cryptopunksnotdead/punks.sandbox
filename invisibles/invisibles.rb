require 'punks'



## get base inivisible (1-color/black) base types

MALE   = Image.read( './male.png' )
FEMALE = Image.read( './female.png' )
APE    = Image.read( './ape.png' )
ALIEN  = Image.read( './alien.png' )



TOP_HAT      = Punk::Sheet.find_by( name: 'Top Hat', gender: 'm' )
VR           = Punk::Sheet.find_by( name: 'VR', gender: 'm' )
PIPE         = Punk::Sheet.find_by( name: 'Pipe', gender: 'm' )
NORMAL_BEARD = Punk::Sheet.find_by( name: 'Normal Beard', gender: 'm' )
HEADBAND     = Punk::Sheet.find_by( name: 'Headband', gender: 'm' )
CAP_FORWARD  = Punk::Sheet.find_by( name: 'Cap Forward', gender: 'm' )
SMILE        = Punk::Sheet.find_by( name: 'Smile', gender: 'm' )
EARRING      = Punk::Sheet.find_by( name: 'Earring', gender: 'm' )
_3D_GLASSES  = Punk::Sheet.find_by( name: '3D Glasses', gender: 'm' )

PURPLE_HAIR  = Punk::Sheet.find_by( name: 'Purple Hair', gender: 'm' )
CRAZY_HAIR   = Punk::Sheet.find_by( name: 'Crazy Hair', gender: 'm' )
GOAT         = Punk::Sheet.find_by( name: 'Goat', gender: 'm' )
GOLD_CHAIN   = Punk::Sheet.find_by( name: 'Gold Chain', gender: 'm' )


KNITTED_CAP      = Punk::Sheet.find_by( name: 'Knitted Cap', gender: 'm' )
KNITTED_CAP_F    = Punk::Sheet.find_by( name: 'Knitted Cap', gender: 'f' )
CLASSIC_SHADES   = Punk::Sheet.find_by( name: 'Classic Shades', gender: 'm' )
CLASSIC_SHADES_F = Punk::Sheet.find_by( name: 'Classic Shades', gender: 'f' )
BIG_SHADES_F     = Punk::Sheet.find_by( name: 'Big Shades', gender: 'f' )

WILD_BLONDE      = Punk::Sheet.find_by( name: 'Wild Blonde', gender: 'f' )
WILD_WHITE_HAIR  = Punk::Sheet.find_by( name: 'Wild White Hair', gender: 'f' )
MOLE_F           = Punk::Sheet.find_by( name: 'Mole', gender: 'f' )


YELLOW = '#ffff00'
RED    = '#ff0000'
GREEN  = '#00ff00'
BLUE   = '#0000ff'

punks = ImageComposite.new( 3, 3, background: [RED, GREEN, YELLOW, BLUE] )

invisibles = [
  [MALE],
  [FEMALE],
  [APE],
  [ALIEN, HEADBAND],
  [APE, KNITTED_CAP, CLASSIC_SHADES, EARRING, GOLD_CHAIN],
  [MALE, VR,  TOP_HAT, NORMAL_BEARD, PIPE],
  [MALE, SMILE, CRAZY_HAIR, _3D_GLASSES, GOAT],
  [ALIEN, CAP_FORWARD, PIPE],
  [FEMALE, WILD_BLONDE, SMILE, MOLE_F, BIG_SHADES_F],
]


invisibles.each do |attributes|
   punk = Image.new( 24, 24 )
   attributes.each do |attribute|
     punk.compose!( attribute )
   end
   punks << punk
end


punks.save( "./tmp/invisibles.png" )
punks.zoom(4).save( "./tmp/invisibles@4x.png" )
punks.zoom(8).save( "./tmp/invisibles@8x.png" )


puts "bye"