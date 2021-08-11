###########
#  to run use:
#    ruby ./wallstreetbets.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



design = <<TXT
. . . . @ @ @ @ @ @ @ @ @ @
. . . . x x x x x x x x x @
. . . @ @ @ @ @ @ @ @ @ x @
. . x x x x x x x x x @ x @
. @ @ @ @ @ @ @ @ @ x @ x @
. x x x x x x x x @ x @ x @
. @ @ @ @ @ . . . . . . x @
x x x x x . . . . . . . . .
@ @ @ @ . . . . . . . . . .
. x x . . . . . . . . . . .
. @ @ . . . . . . . . . . .
TXT

hair = Image.parse( design, colors: ['B4710C', 'F5C10D'] )
punk = Image.new( 24, 24 )
punk.compose!( hair, 3, 2 )
punk.save( "./tmp/wallstreetbets-hair.png" )
punk.zoom(4).save( "./tmp/wallstreetbets-hair4x.png" )
punk.zoom(8).save( "./tmp/wallstreetbets-hair8x.png" )

hair = Image.parse( design, colors: ['6E0202', '970202'] )
punk = Image.new( 24, 24 )
punk.compose!( hair, 3, 2 )
punk.save( "./tmp/wallstreetbets-hair_dark.png" )
punk.zoom(4).save( "./tmp/wallstreetbets-hair_dark4x.png" )
punk.zoom(8).save( "./tmp/wallstreetbets-hair_dark8x.png" )



design = <<TXT
. . . . . @ . . . . @ . . . . . . .
. . . . @ @ @ @ @ @ @ @ @ @ @ . . .
. . . . @ x x x x x @ @ @ @ @ @ . .
. . @ @ @ @ @ @ @ @ x x @ @ @ @ @ .
@ . . x x x x x x @ @ @ x @ @ @ @ @
@ @ @ @ @ @ @ @ @ x @ @ @ x @ @ @ .
. . @ x x x @ @ . . x . @ . x . . .
. . @ @ . . x . . . . . . . . . . .
. @ @ @ . . . . . . . . . . . . . .
. @ @ . . . . . . . . . . . . . . .
. . @ . . . . . . . . . . . . . . .
. . @ . . . . . . . . . . . . . . .
. @ . . . . . . . . . . . . . . . .
TXT

hair = Image.parse( design, colors: ['F5C10D', 'B4710C'])
punk = Image.new( 24, 24 )
punk.compose!( hair, 2, 2 )
punk.save( "./tmp/wallstreetbets-crazyhair.png" )
punk.zoom(4).save( "./tmp/wallstreetbets-crazyhair4x.png" )
punk.zoom(8).save( "./tmp/wallstreetbets-crazyhair8x.png" )

hair = Image.parse( design, colors: ['970202', '6E0202'])
punk = Image.new( 24, 24 )
punk.compose!( hair, 2, 2 )
punk.save( "./tmp/wallstreetbets-crazyhair_dark.png" )
punk.zoom(4).save( "./tmp/wallstreetbets-crazyhair_dark4x.png" )
punk.zoom(8).save( "./tmp/wallstreetbets-crazyhair_dark8x.png" )




## try some all black big shades

shades = Image.parse( <<TXT, colors: ['000000', '603048'] )
@ @ @ @ @ @ @ @ . @ @ @ @ @ @
. . @ @ @ @ @ @ @ @ @ @ @ @ @
. . @ x @ @ @ @ @ @ x @ @ @ .
. . . @ x @ @ @ . @ @ x @ @ .
. . . . @ @ @ . . . @ @ @ @ .
TXT
punk = Image.new( 24, 24 )
punk.compose!( shades, 4, 9 )
punk.save( "./tmp/wallstreetbets-shades.png" )
punk.zoom(4).save( "./tmp/wallstreetbets-shades4x.png" )
punk.zoom(8).save( "./tmp/wallstreetbets-shades8x.png" )






##############
#   try out new building blocks
human_light    = Punks::Image.new( design: 'human-male!light' )
human_darker   = Punks::Image.new( design: 'human-male!darker' )

hair           = Image.read( "./tmp/wallstreetbets-hair.png" )
hair_dark      = Image.read( "./tmp/wallstreetbets-hair_dark.png" )
crazyhair      = Image.read( "./tmp/wallstreetbets-crazyhair.png" )
crazyhair_dark = Image.read( "./tmp/wallstreetbets-crazyhair_dark.png" )
shades         = Image.read( "./tmp/wallstreetbets-shades.png" )



punk = Image.new( 24, 24 )
punk.compose!( human_light )
punk.compose!( hair )
punk.compose!( shades )
punk.save( "./tmp/wsb_hair.png")
punk.zoom(8).save( "./tmp/wsb_hair8x.png" )

punk = Image.new( 24, 24 )
punk.compose!( human_darker )
punk.compose!( hair_dark )
punk.compose!( shades )
punk.save( "./tmp/wsb_hair_dark.png")
punk.zoom(8).save( "./tmp/wsb_hair_dark8x.png" )


punk = Image.new( 24, 24 )
punk.compose!( human_light )
punk.compose!( crazyhair )
punk.compose!( shades )
punk.save( "./tmp/wsb_crazyhair.png")
punk.zoom(8).save( "./tmp/wsb_crazyhair8x.png" )

punk = Image.new( 24, 24 )
punk.compose!( human_darker )
punk.compose!( crazyhair_dark )
punk.compose!( shades )
punk.save( "./tmp/wsb_crazyhair_dark.png")
punk.zoom(8).save( "./tmp/wsb_crazyhair_dark8x.png" )
