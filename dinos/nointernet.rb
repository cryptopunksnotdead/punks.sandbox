require 'pixelart'
require 'backgrounds'


dino          = Image.read( "./dino-24x24.png")
dino_gameover = Image.read( "./dino_gameover-24x24.png")

dinos_i = ImageComposite.new( 2, 2 )

dinos_i << dino.background( '#638596' )
dinos_i << dino.background( 'white' )
dinos_i << dino.background( 'pride' )
dinos_i << dino.background( 'ukraine' )


dinos_i.save( "./tmp/dinos_vol1.png" )
dinos_i.zoom(8).save( "./tmp/dinos_vol1@8x.png" )


YELLOW = '#ffff00'
GREEN  = '#00ff00'
RED    = '#ff0000'
BLUE   = '#0000ff'

dinos_ii = ImageComposite.new( 2, 2, background: [YELLOW, GREEN, RED, BLUE] )

dinos_ii << dino
dinos_ii << dino_gameover
dinos_ii << dino_gameover
dinos_ii << dino

dinos_ii.save( "./tmp/dinos_vol2.png" )
dinos_ii.zoom(8).save( "./tmp/dinos_vol2@8x.png" )



composite = ImageComposite.new( 3, 1, width: 144,
                                      height: 144)
composite << dinos_ii.zoom(3)  ## 3x zoom = 72px x (2x2) = 144x144
composite << dinos_i.zoom(3)
composite << Image.read( "./nointernet-144x144.png")

composite.save( "./tmp/dinosg@4x.png" )


puts "bye"

