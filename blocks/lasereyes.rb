###########
#  to run use:
#    ruby ./lasereyes.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


design = <<TXT
 . . . . @ . . . . . @ . . . .
 . . . . @ . . . . . @ . . . .
 . . . @ x @ . . . @ x @ . . .
 @ x x x o x @ . @ x o x x x @
 . . . @ x @ . . . @ x @ . . .
 . . . . @ . . . . . @ . . . .
 . . . . @ . . . . . @ . . . .
TXT

laser = Image.parse( design, colors: ['FB1A06', 'F85C0F', 'FFDB3C'] )
punk = Image.new( 24, 24 )
punk.compose!( laser, 5, 8 )
punk.save( "./tmp/lasereyes.png" )
punk.zoom(4).save( "./tmp/lasereyes4x.png" )
punk.zoom(8).save( "./tmp/lasereyes8x.png" )


laser = Image.parse( design, colors: ['E6D300', 'FFF799', 'FFFFFF'] )
punk = Image.new( 24, 24 )
punk.compose!( laser, 5, 8 )
punk.save( "./tmp/lasereyes_light.png" )
punk.zoom(4).save( "./tmp/lasereyes_light4x.png" )
punk.zoom(8).save( "./tmp/lasereyes_light8x.png" )







##############
#   try out new building blocks
human_light    = Punks::Image.new( design: 'human-male!light' )
alien          = Punks::Image.new( design: 'alien-male' )

laser            = Image.read( "./tmp/lasereyes.png" )
laser_light      = Image.read( "./tmp/lasereyes_light.png" )

### more
# cap_red         = Image.read( "./tmp/cap_0.png" )
# cap_blue        = Image.read( "./tmp/cap_240.png" )
capforward      = Image.read( "./tmp/capforward.png" )
bandana         = Image.read( "./tmp/bandana.png" )
# beanie          = Image.read( "./tmp/beanie.png" )
smile           = Image.read( "./tmp/smile.png" )
smile_alien     = Image.read( "./tmp/smile-alien.png" )



punk = Image.new( 24, 24 )
punk.compose!( human_light )
punk.compose!( capforward )
punk.compose!( laser )
punk.compose!( smile)
punk.save( "./tmp/laser.png" )
punk.zoom(4).save( "./tmp/laser4x.png" )

punk = Image.new( 24, 24 )
punk.compose!( human_light )
punk.compose!( bandana )
punk.compose!( laser_light )
punk.compose!( smile)
punk.save( "./tmp/laser_light.png")
punk.zoom(4).save( "./tmp/laser_light4x.png" )



punk = Image.new( 24, 24 )
punk.compose!( alien )
punk.compose!( capforward )
punk.compose!( laser )
punk.compose!( smile_alien )
punk.save( "./tmp/laser_alien.png")
punk.zoom(4).save( "./tmp/laser_alien4x.png" )

punk = Image.new( 24, 24 )
punk.compose!( alien )
punk.compose!( bandana )
punk.compose!( laser_light )
punk.compose!( smile_alien )
punk.save( "./tmp/laser_alien_light.png")
punk.zoom(4).save( "./tmp/laser_alien_light4x.png" )

