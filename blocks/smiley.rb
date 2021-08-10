###########
#  to run use:
#    ruby ./smiley.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



BLACK  = '000000'
YELLOW = 'F7FF09'
RED    = 'FF0000'
GREEN  = '267F00'

###
## note:  keep last line at bottom - why? why not?
##            or add two lines

template = <<TXT

## basic
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . @ @ . . . . . @ @ . . . . . . . .
. . . . . . @ . . . . . . . . . @ . . . . . . .
. . . . . @ . . . . . . . . . . . @ . . . . . .
. . . . @ . . . . . . . . . . . . . @ . . . . .
. . . . @ . . . . . . . . . . . . . @ . . . . .
. . . @ . . . @ @ . . . . . @ @ . . . @ . . . .
. . . @ . . . @ @ . . . . . @ @ . . . @ . . . .
. . . @ . . . . . . . . . . . . . . . @ . . . .
. . . @ . . . . . . . . . . . . . . . @ . . . .
. . . @ . . . @ . . . . . . . @ . . . @ . . . .
. . . . @ . . . @ . . . . . @ . . . @ . . . . .
. . . . @ . . . . @ @ @ @ @ . . . . @ . . . . .
. . . . . @ . . . . . . . . . . . @ . . . . . .
. . . . . . @ . . . . . . . . . @ . . . . . . .
. . . . . . . @ @ . . . . . @ @ . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .

## heart
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . @ @ . . . . . @ @ . . . . . . . .
. . . . . . @ . . . . . . . . . @ . . . . . . .
. . . . . x x . x x . . . x x . x x . . . . . .
. . . . x x x x x x x . x x x x x x x . . . . .
. . . . x x x x x x x . x x x x x x x . . . . .
. . . @ . x x x x x . . . x x x x x . @ . . . .
. . . @ . . x x x . . . . . x x x . . @ . . . .
. . . @ . . . x . . . . . . . x . . . @ . . . .
. . . @ . . . . . . . . . . . . . . . @ . . . .
. . . @ . . . @ . . . . . . . @ . . . @ . . . .
. . . . @ . . . @ . . . . . @ . . . @ . . . . .
. . . . @ . . . . @ @ @ @ @ . . . . @ . . . . .
. . . . . @ . . . . . . . . . . . @ . . . . . .
. . . . . . @ . . . . . . . . . @ . . . . . . .
. . . . . . . @ @ . . . . . @ @ . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .

## dollar
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . @ @ . . . . . @ @ . . . . . . . .
. . . . . . @ . x . . . . . x . @ . . . . . . .
. . . . . @ . x x x x . . x x x x @ . . . . . .
. . . . @ . x . x . . . x . x . . . @ . . . . .
. . . . @ . . x x x . . . x x x . . @ . . . . .
. . . @ . . . . x . x . . . x . x . . @ . . . .
. . . @ . . x x x x . . x x x x . . . @ . . . .
. . . @ . . . . x . . . . . x . . . . @ . . . .
. . . @ . . . . . . . . . . . . . . . @ . . . .
. . . @ . . . @ . . . . . . . @ . . . @ . . . .
. . . . @ . . . @ . . . . . @ . . . @ . . . . .
. . . . @ . . . . @ @ @ @ @ . . . . @ . . . . .
. . . . . @ . . . . . . . . . . . @ . . . . . .
. . . . . . @ . . . . . . . . . @ . . . . . . .
. . . . . . . @ @ . . . . . @ @ . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .

## zombie?
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . @ @ . . . . . @ @ . . . . . . . .
. . . . . . @ . . . . . . . . . @ . . . . . . .
. . . . . @ . . . . . . . . . . . @ . . . . . .
. . . . @ . . . . . . . . . . . . . @ . . . . .
. . . . @ . . . . . . . . . . . . . @ . . . . .
. . . @ . . . x x . . . . . x x . . . @ . . . .
. . . @ . . . o @ . . . . . o @ . . . @ . . . .
. . . @ . . . x . . . . . . x . . . . @ . . . .
. . . @ . . . . . . . . . . . . . . . @ . . . .
. . . @ . . . . . . . . . . . . . . . @ . . . .
. . . . @ . . . . . . . . . . . . . @ . . . . .
. . . . @ . . . . @ @ @ @ @ . . . . @ . . . . .
. . . . . @ . . . x . . . . . . . @ . . . . . .
. . . . . . @ . . . . . . . . . @ . . . . . . .
. . . . . . . @ @ . . . . . @ @ . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT



### todo/fix: add a auto-fill
##              to keep template cleaner
##                 eg. replace all . if inside (get first and last non-dot-chars) - why? why not?

##
## todo/fix:
##     use eyes (classic / standard ?)
##      and mouth (happy / smile?) and use empty smiley!!!
##
##  use eyes zombie and mouth zombie - why? why not?


basic = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . @ @ x x x x x @ @ . . . . . . . .
. . . . . . @ x x x x x x x x x @ . . . . . . .
. . . . . @ x x x x x x x x x x x @ . . . . . .
. . . . @ x x x x x x x x x x x x x @ . . . . .
. . . . @ x x x x x x x x x x x x x @ . . . . .
. . . @ x x x @ @ x x x x x @ @ x x x @ . . . .
. . . @ x x x @ @ x x x x x @ @ x x x @ . . . .
. . . @ x x x x x x x x x x x x x x x @ . . . .
. . . @ x x x x x x x x x x x x x x x @ . . . .
. . . @ x x x @ x x x x x x x @ x x x @ . . . .
. . . . @ x x x @ x x x x x @ x x x @ . . . . .
. . . . @ x x x x @ @ @ @ @ x x x x @ . . . . .
. . . . . @ x x x x x x x x x x x @ . . . . . .
. . . . . . @ x x x x x x x x x @ . . . . . . .
. . . . . . . @ @ x x x x x @ @ . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

smiley = Image.parse( basic, colors: [BLACK, YELLOW] )
smiley.save( "./tmp/smiley-basic.png")
smiley.zoom(4).save( "./tmp/smiley-basic4x.png" )
smiley.zoom(8).save( "./tmp/smiley-basic8x.png" )


heart =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . @ @ o o o o o @ @ . . . . . . . .
. . . . . . @ o o o o o o o o o @ . . . . . . .
. . . . . x x o x x o o o x x o x x . . . . . .
. . . . x x x x x x x o x x x x x x x . . . . .
. . . . x x x x x x x o x x x x x x x . . . . .
. . . @ o x x x x x o o o x x x x x o @ . . . .
. . . @ o o x x x o o o o o x x x o o @ . . . .
. . . @ o o o x o o o o o o o x o o o @ . . . .
. . . @ o o o o o o o o o o o o o o o @ . . . .
. . . @ o o o @ o o o o o o o @ o o o @ . . . .
. . . . @ o o o @ o o o o o @ o o o @ . . . . .
. . . . @ o o o o @ @ @ @ @ o o o o @ . . . . .
. . . . . @ o o o o o o o o o o o @ . . . . . .
. . . . . . @ o o o o o o o o o @ . . . . . . .
. . . . . . . @ @ o o o o o @ @ . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

smiley = Image.parse( heart, colors: [BLACK, RED, YELLOW] )
smiley.save( "./tmp/smiley-heart.png")
smiley.zoom(4).save( "./tmp/smiley-heart4x.png" )
smiley.zoom(8).save( "./tmp/smiley-heart8x.png" )

smiley = Image.parse( heart, colors: [BLACK, RED, '7DA269'] )
smiley.save( "./tmp/smiley-heart_alien.png")
smiley.zoom(4).save( "./tmp/smiley-heart_alien4x.png" )
smiley.zoom(8).save( "./tmp/smiley-heart_alien8x.png" )


## movo dollar one pixel up or down- why? why not?
dollar = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . @ @ o o o o o @ @ . . . . . . . .
. . . . . . @ o x o o o o o x o @ . . . . . . .
. . . . . @ o x x x x o o x x x x @ . . . . . .
. . . . @ o x o x o o o x o x o o o @ . . . . .
. . . . @ o o x x x o o o x x x o o @ . . . . .
. . . @ o o o o x o x o o o x o x o o @ . . . .
. . . @ o o x x x x o o x x x x o o o @ . . . .
. . . @ o o o o x o o o o o x o o o o @ . . . .
. . . @ o o o o o o o o o o o o o o o @ . . . .
. . . @ o o o @ o o o o o o o @ o o o @ . . . .
. . . . @ o o o @ o o o o o @ o o o @ . . . . .
. . . . @ o o o o @ @ @ @ @ o o o o @ . . . . .
. . . . . @ o o o o o o o o o o o @ . . . . . .
. . . . . . @ o o o o o o o o o @ . . . . . . .
. . . . . . . @ @ o o o o o @ @ . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

smiley = Image.parse( dollar, colors: [BLACK, GREEN, YELLOW] )
smiley.save( "./tmp/smiley-dollar.png")
smiley.zoom(4).save( "./tmp/smiley-dollar4x.png" )
smiley.zoom(8).save( "./tmp/smiley-dollar8x.png" )


zombie = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . @ @ ^ ^ ^ ^ ^ @ @ . . . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . .
. . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . .
. . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . .
. . . @ ^ ^ ^ x x ^ ^ ^ ^ ^ x x ^ ^ ^ @ . . . .
. . . @ ^ ^ ^ o @ ^ ^ ^ ^ ^ o @ ^ ^ ^ @ . . . .
. . . @ ^ ^ ^ x ^ ^ ^ ^ ^ ^ x ^ ^ ^ ^ @ . . . .
. . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . .
. . . @ ^ ^ ^ @ ^ ^ ^ ^ ^ ^ ^ @ ^ ^ ^ @ . . . .
. . . . @ ^ ^ ^ @ ^ ^ ^ ^ ^ @ ^ ^ ^ @ . . . . .
. . . . @ ^ ^ ^ ^ @ @ @ @ @ ^ ^ ^ ^ @ . . . . .
. . . . . @ ^ ^ ^ x ^ ^ ^ ^ ^ ^ ^ @ . . . . . .
. . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . @ @ ^ ^ ^ ^ ^ @ @ . . . . . . . .
. . . . . . . . . @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

smiley = Image.parse( zombie, colors: [BLACK, '5E7253', 'FF0000', '7DA269'] )
smiley.save( "./tmp/smiley-zombie.png")
smiley.zoom(4).save( "./tmp/smiley-zombie4x.png" )
smiley.zoom(8).save( "./tmp/smiley-zombie8x.png" )


knitted_cap = Image.parse( <<TXT, colors: ['000000', '933709', 'CA4E11'] )
. . . @ @ @ @ @ @ @ @ @ @ @ . . .
. . @ o o o o o o o o o o o @ . .
. @ o o o o o o o o o o o o o @ .
@ x x x x x x x x x x x x x x x @
@ x o x o x o x o x o x o x o x @
TXT

smiley.compose!( knitted_cap, 3, 3 )
smiley.save( "./tmp/smiley-knittedcap.png" )
smiley.zoom(4).save( "./tmp/smiley-knittedcap4x.png" )
smiley.zoom(8).save( "./tmp/smiley-knittedcap8x.png" )


