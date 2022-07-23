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


TOP_HAT        = Image.read( './attributes/top_hat.png')
BUNNY          = Image.read( './attributes/bunny.png')
RED_TAIL    = Image.read( './attributes/hair-red_tail.png')
RAINBOW_TAIL   = Image.read( './attributes/hair-rainbow_tail.png')

GAG  = Image.read( './attributes/gag.png' )



def generate_punk( *attributes )
  punk = Image.new( 40, 40 )
  attributes.each do |attribute_name|

      attribute =  if attribute_name.is_a?( Image )
                        attribute_name
                   else  ## assume name as string
                        Punk::Sheet.find_by( name: attribute_name, gender: 'f' )
                   end

     offset = if attribute.width == 24 && attribute.height == 24
                  [6,7] ## offset x/y for classic 24x24 attributes in 40x40 canvas
              elsif attribute.width == 32 && attribute.height == 32
                  [0,8]
              else
                  [0,0]
              end
      punk.compose!( attribute, *offset )
  end
  punk
end



specs = [
  [FEMALE11, DRESS_BLACK_WHITE, 'Orange Bob', 'Big Shades', 'Gold Chain', 'Hot Lipstick'],
  [FEMALE31, DRESS_BLACK, 'Straight Hair Blonde', 'Earring', '3D Glasses', 'Hot Lipstick'],
  [ZOMBIE1,  DRESS_SHORTER_BLACK, 'Choker', 'Crazy Hair'],
  [ALIEN1,  DRESS_SHORTEST_BLACK, 'Panama Hat',  'Purple Lipstick', 'Pipe'],

  [FEMALE1, BRA_YELLOW, 'Orange Side', 'Classic Shades', 'Hot Lipstick', 'Gold Chain'],
  [FEMALE3, BRA_CYAN, 'Wild Blonde', 'Earring',  'Big Shades', 'Hot Lipstick'],
  [ZOMBIE,  BRA_BLACK, RED_TAIL, 'Choker'],
  [ALIEN,  BRA_PINK, 'Cap', 'Purple Lipstick'],

  [FEMALE1,  RAINBOW_TAIL, 'Purple Lipstick'],
  [FEMALE3,  'Half Shaved', 'Earring', 'VR', 'Hot Lipstick'],
  [ZOMBIE, 'Straight Hair', 'Sombrero', 'Heart Shades'],
  [ALIEN,  'Bandana', 'Laser Eyes', 'Purple Lipstick'],

  [FEMALE1_BIG, 'Straight Hair Dark', 'Police Cap', 'Laser Eyes Gold', 'Cigarette'],
  [FEMALE31_BIG, DRESS_PINK_BIG, BUNNY,  'Pink Lipstick'],
  [ZOMBIE_BIG, GAG, 'Pigtails', 'Horned-Rim Glasses', 'Choker'],
  [ALIEN_BIG, DRESS_BLUE_BIG, TOP_HAT, 'Regular Shades', 'Purple Lipstick', 'Bubble Gum'],
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