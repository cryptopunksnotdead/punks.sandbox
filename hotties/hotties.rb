require 'punks'



FEMALE1      = Image.read( './attributes/female1.png' )
FEMALE11      = Image.read( './attributes/female1.1.png' )
FEMALE2      = Image.read( './attributes/female2.png' )
FEMALE3      = Image.read( './attributes/female3.png' )
FEMALE31      = Image.read( './attributes/female3.1.png' )
FEMALE1_BIG  = Image.read( './attributes/female1-big.png' )
FEMALE2_BIG  = Image.read( './attributes/female2-big.png' )
FEMALE3_BIG  = Image.read( './attributes/female3-big.png' )
FEMALE31_BIG  = Image.read( './attributes/female3.1-big.png' )
ZOMBIE       = Image.read( './attributes/zombie.png' )
ZOMBIE1       = Image.read( './attributes/zombie.1.png' )
ZOMBIE_BIG   = Image.read( './attributes/zombie-big.png' )
APE          = Image.read( './attributes/ape.png' )
APE_BIG      = Image.read( './attributes/ape-big.png' )
ALIEN        = Image.read( './attributes/alien.png' )
ALIEN1        = Image.read( './attributes/alien.1.png' )
ALIEN_BIG    = Image.read( './attributes/alien-big.png' )

BRA_CYAN      = Image.read( './attributes/bra-cyan.png' )
BRA_YELLOW    = Image.read( './attributes/bra-yellow.png' )
BRA_PINK      = Image.read( './attributes/bra-pink.png' )
BRA_BLACK      = Image.read( './attributes/bra-black.png' )


DRESS_BLACK       = Image.read( './attributes/dress1-black.png' )
DRESS_BLACK_WHITE = Image.read( './attributes/dress2-black_white.png' )
DRESS_LIGHT_BLUE    = Image.read( './attributes/dress3-light_blue.png' )
DRESS_LONG_BLACK     = Image.read( './attributes/dress4-black.png' )
DRESS_LONG_WHITE     = Image.read( './attributes/dress4-white.png' )
DRESS_SHORT_WHITE    = Image.read( './attributes/dress5-white.png' )
DRESS_SHORT_BLACK    = Image.read( './attributes/dress5-black.png' )
DRESS_SHORTEST_BLACK    = Image.read( './attributes/dress6-black.png' )
DRESS_SHORTER_BLACK    = Image.read( './attributes/dress7-black.png' )
DRESS_SHORTER_GREEN   = Image.read( './attributes/dress7-green.png' )

DRESS_BLUE_BIG = Image.read( './attributes/big_dress1-blue.png' )
DRESS_GREEN_BIG = Image.read( './attributes/big_dress1-green.png' )
DRESS_PINK_BIG = Image.read( './attributes/big_dress2-pink.png' )



BUNNY          = Image.read( './attributes/bunny.png')
RED_TAIL    = Image.read( './attributes/hair-red_tail.png')
RAINBOW_TAIL   = Image.read( './attributes/hair-rainbow_tail.png')

GAG  = Image.read( './attributes/gag.png' )


_3D_GLASSES  = Punk::Sheet.find_by( name: '3D Glasses', gender: 'f' )
VR  = Punk::Sheet.find_by( name: 'VR', gender: 'f' )
BIG_SHADES   = Punk::Sheet.find_by( name: 'Big Shades', gender: 'f' )
CLASSIC_SHADES   = Punk::Sheet.find_by( name: 'Classic Shades', gender: 'f' )
HEART_SHADES   = Punk::Sheet.find_by( name: 'Heart Shades', gender: 'f' )
HORNED_RIM_GLASSES = Punk::Sheet.find_by( name: 'Horned-Rim Glasses', gender: 'f' )
LASER_EYES_GOLD = Punk::Sheet.find_by( name: 'Laser Eyes Gold', gender: 'f' )
LASER_EYES_RED  = Punk::Sheet.find_by( name: 'Laser Eyes', gender: 'f' )

GOLD_CHAIN   = Punk::Sheet.find_by( name: 'Gold Chain', gender: 'f' )
EARRING      = Punk::Sheet.find_by( name: 'Earring',   gender: 'f' )
CHOKER       = Punk::Sheet.find_by( name: 'Choker',   gender: 'f' )

ORANGE_SIDE  = Punk::Sheet.find_by( name: 'Orange Side',   gender: 'f' )
ORANGE_BOB   = Punk::Sheet.find_by( name: 'Orange Bob',   gender: 'f' )
WILD_BLONDE  = Punk::Sheet.find_by( name: 'Wild Blonde',   gender: 'f' )
CRAZY_HAIR   = Punk::Sheet.find_by( name: 'Crazy Hair',    gender: 'f' )
HALF_SHAVED   = Punk::Sheet.find_by( name: 'Half Shaved',    gender: 'f' )
STRAIGHT_HAIR_DARK = Punk::Sheet.find_by( name: 'Straight Hair Dark',    gender: 'f' )
STRAIGHT_HAIR_BLONDE = Punk::Sheet.find_by( name: 'Straight Hair Blonde',    gender: 'f' )
STRAIGHT_HAIR_BRUNETTE = Punk::Sheet.find_by( name: 'Straight Hair',    gender: 'f' )
PIGTAILS      = Punk::Sheet.find_by( name: 'Pigtails',    gender: 'f' )
TOP_HAT      = Punk::Sheet.find_by( name: 'Top Hat',   gender: 'f' )
PANAMA_HAT      = Punk::Sheet.find_by( name: 'Panama Hat',   gender: 'f' )
BANDANA      = Punk::Sheet.find_by( name: 'Bandana',   gender: 'f' )
POLICE_CAP   = Punk::Sheet.find_by( name: 'Police Cap',   gender: 'f' )
SOMBRERO      = Punk::Sheet.find_by( name: 'Sombrero',   gender: 'f' )
CAP           = Punk::Sheet.find_by( name: 'Cap', gender: 'f' )
REGULAR_SHADES = Punk::Sheet.find_by( name: 'Regular Shades',   gender: 'f' )

PIPE         = Punk::Sheet.find_by( name: 'Pipe',   gender: 'f' )
CIGARETTE    = Punk::Sheet.find_by( name: 'Cigarette',   gender: 'f' )
BUBBLEGUM    = Punk::Sheet.find_by( name: 'Bubble Gum',   gender: 'f' )

HOT_LIPSTICK    = Punk::Sheet.find_by( name: 'Hot Lipstick',   gender: 'f' )
PURPLE_LIPSTICK = Punk::Sheet.find_by( name: 'Purple Lipstick',   gender: 'f' )
PINK_LIPSTICK   = Punk::Sheet.find_by( name: 'Pink Lipstick',   gender: 'f' )


def generate_punk( *attributes )
  punk = Image.new( 40, 40 )
  attributes.each do |attribute|
     offset = if attribute.width == 24 && attribute.height == 24
                [6,7] ## offset x/y for classic 24x24 attributes in 40x40 canvas
              else
                [0,0]
              end
      punk.compose!( attribute, *offset )
  end
  punk
end



specs = [
  [FEMALE11, DRESS_BLACK_WHITE, ORANGE_BOB, BIG_SHADES, GOLD_CHAIN, HOT_LIPSTICK],
  [FEMALE31, DRESS_BLACK, STRAIGHT_HAIR_BLONDE, EARRING, _3D_GLASSES, HOT_LIPSTICK],
  [ZOMBIE1,  DRESS_SHORTER_BLACK, CHOKER, CRAZY_HAIR],
  [ALIEN1,  DRESS_SHORTEST_BLACK, PANAMA_HAT,  PURPLE_LIPSTICK, PIPE],

  [FEMALE1, BRA_YELLOW, ORANGE_SIDE, CLASSIC_SHADES, HOT_LIPSTICK, GOLD_CHAIN],
  [FEMALE3, BRA_CYAN, WILD_BLONDE, EARRING, BIG_SHADES, HOT_LIPSTICK],
  [ZOMBIE,  BRA_BLACK,  CHOKER, RED_TAIL],
  [ALIEN,  BRA_PINK, CAP, PURPLE_LIPSTICK],

  [FEMALE1,  RAINBOW_TAIL, PURPLE_LIPSTICK],
  [FEMALE3,  HALF_SHAVED, EARRING, VR, HOT_LIPSTICK],
  [ZOMBIE, STRAIGHT_HAIR_BRUNETTE, SOMBRERO, HEART_SHADES],
  [ALIEN,  BANDANA, LASER_EYES_RED, PURPLE_LIPSTICK],

  [FEMALE1_BIG, STRAIGHT_HAIR_DARK, POLICE_CAP, LASER_EYES_GOLD,  CIGARETTE],
  [FEMALE31_BIG,  BUNNY,    DRESS_PINK_BIG, PINK_LIPSTICK],
  [ZOMBIE_BIG,  PIGTAILS, HORNED_RIM_GLASSES, GAG, CHOKER],
  [ALIEN_BIG,  TOP_HAT, REGULAR_SHADES, PURPLE_LIPSTICK, BUBBLEGUM, DRESS_BLUE_BIG],
]



hotties = ImageComposite.new( 4, 4, width: 40,
                                    height: 40,
                                    background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = generate_punk( *attributes )

  punk.save( "./tmp/hottie#{i}.png" )
  punk.zoom(4).save( "./tmp/hottie#{i}@4x.png" )

  hotties << punk
end


hotties.save( "./tmp/hotties.png" )
hotties.zoom(4).save( "./tmp/hotties@4x.png" )



puts "bye"