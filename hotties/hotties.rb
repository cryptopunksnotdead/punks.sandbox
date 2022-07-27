$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'



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


TOP_HAT        = Image.read( './attributes/top_hat.png')
BUNNY          = Image.read( './attributes/bunny.png')
RED_TAIL    = Image.read( './attributes/hair-red_tail.png')
RAINBOW_TAIL   = Image.read( './attributes/hair-rainbow_tail.png')

GAG  = Image.read( './attributes/gag.png' )



####
## generate a hottie in 110x110px (3x zoom + overflow)
##    for museum frame
##  32x3 => 96px
##   - add 14px on top and 7px left/right

hottie = Punk32::Image.generate( 'Female L 3', BRA_PINK,
                                 'Wild Blonde', 'Earring',
                                 'Mole', '3D Glasses', 'Hot Lipstick' )

framed = Image.new( 110, 110, '#6A8493' )
framed.compose!( hottie.zoom(3), 7, 14 )
framed.save( "./tmp/hottie-110x110.png")



##########
#  generate hotties

specs = [
  ['Female L 1A', DRESS_BLACK_WHITE, 'Orange Bob', 'Big Shades', 'Gold Chain', 'Hot Lipstick'],
  ['Female L 3A', DRESS_BLACK, 'Straight Hair Blonde', 'Earring', '3D Glasses', 'Hot Lipstick'],
  ['Zombie Female L A',  DRESS_SHORTER_BLACK, 'Choker', 'Crazy Hair'],
  ['Alien Female L A',  DRESS_SHORTEST_BLACK, 'Panama Hat',  'Purple Lipstick', 'Pipe'],

  ['Female L 1', BRA_YELLOW, 'Orange Side', 'Classic Shades', 'Hot Lipstick', 'Gold Chain'],
  ['Female L 3', BRA_CYAN, 'Wild Blonde', 'Earring',  'Big Shades', 'Hot Lipstick'],
  ['Zombie Female L',  BRA_BLACK, RED_TAIL, 'Choker'],
  ['Alien Female L',  BRA_PINK, 'Cap', 'Purple Lipstick'],

  ['Female L 1',  RAINBOW_TAIL, 'Purple Lipstick'],
  ['Female L 3',  'Half Shaved', 'Earring', 'VR', 'Hot Lipstick'],
  ['Zombie Female L ', 'Straight Hair', 'Sombrero', 'Heart Shades'],
  ['Alien Female L',  'Bandana', 'Laser Eyes', 'Purple Lipstick'],

  ['Female Big 1', 'Straight Hair Dark', 'Police Cap', 'Laser Eyes Gold', 'Cigarette'],
  ['Female Big 3A', DRESS_PINK_BIG, BUNNY,  'Pink Lipstick'],
  ['Zombie Female Big', GAG, 'Pigtails', 'Horned-Rim Glasses', 'Choker'],
  ['Alien Female Big', DRESS_BLUE_BIG, TOP_HAT, 'Regular Shades', 'Purple Lipstick', 'Bubble Gum'],
]



hotties = ImageComposite.new( 4, 4, width: 40,
                                    height: 40,
                                    background: '#638596' )


specs.each_with_index do |attributes,i|
  punk = Punk40::Image.generate( *attributes )

  punk.save( "./tmp/hottie#{i}.png" )
  punk.zoom(4).save( "./tmp/hottie#{i}@4x.png" )

  hotties << punk
end


hotties.save( "./tmp/hotties.png" )
hotties.zoom(4).save( "./tmp/hotties@4x.png" )



puts "bye"