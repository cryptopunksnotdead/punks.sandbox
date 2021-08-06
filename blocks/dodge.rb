###########
#  to run use:
#    ruby ./attributes.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



## note: 32x32 pixel matric
types = {
 dodge: {
   colors: ['000000', 'DB8A37', 'EDC685', 'FFFFFF' ],
   design: <<TXT,
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . @ @ . . . . . @ . . . . . . . . . . .
. . . . . . . . . . . . @ o o @ . . . @ o @ . . . . . . . . . .
. . . . . . . . . . . . @ o o o @ @ @ o o o @ . . . . . . . . .
. . . . . . . . . . . @ o o o x x x x x x x @ . . . . . . . . .
. . . . . . . . . . . @ o o x x x x x x x x x @ . . . . . . . .
. . . . . . . . . . . @ o x x x x x x x x x x @ . . . . . . . .
. . . . . . . . . . @ x x x x x x x x x x x x x @ . . . . . . .
. . . . . . . . . . @ x x x x x x x x x x x x x @ . . . . . . .
. . . . . . . . . @ x x x x x x x x x x @ ^ x x @ . . . . . . .
. . . . . . . . . @ x x x x x x @ ^ x x x x x x x @ . . . . . .
. . . . . . . . @ x x x x x x x x x x x x x x x x @ . . . . . .
. . . . . . . . @ x x x x x x x x x x x x x x x x @ . . . . . .
. . . . . . . . @ x x x x o o o x x x x @ @ @ @ o @ . . . . . .
. . . . . . . . @ x x x o o o o o o x x x @ @ @ o @ . . . . . .
. . . . . . . . @ x x x o o o o o o o o o o @ o o @ . . . . . .
. . . . . . . . @ x x x o o o o o o @ @ @ @ o o @ . . . . . . .
. . . . . . . . . @ x x x o o o o o o o o o o o @ . . . . . . .
. . . . . . . . . @ x x x o o o o o o o o o o @ . . . . . . . .
. . . . . . . . . . @ x x x o o o o o o o o @ . . . . . . . . .
. . . . . . . . . . . @ @ @ @ @ @ @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
TXT
 },
 "dodge-zombie": {
  colors: ['000000', '4D6341', '5E7253', '7DA269', '9BBC88', 'FF0000'],
  design: <<TXT,
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . @ @ . . . . . @ . . . . . . . . . . .
. . . . . . . . . . . . @ x x @ . . . @ x @ . . . . . . . . . .
. . . . . . . . . . . . @ x x x @ @ @ x x x @ . . . . . . . . .
. . . . . . . . . . . @ x x x ^ ^ ^ ^ ^ ^ ^ @ . . . . . . . . .
. . . . . . . . . . . @ x x ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . . . . . . @ x ^ ^ ~ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . . . . . @ ^ ^ ^ ~ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ o o ^ ^ @ . . . . . . .
. . . . . . . . . @ ^ ^ ^ ^ ^ ^ o o ^ ^ % @ ^ ^ @ . . . . . . .
. . . . . . . . . @ ^ ^ ^ ^ ^ ^ % @ ^ ^ o ^ ^ ^ ^ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ^ ^ ^ o ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ^ x x x ^ ^ ^ ^ @ @ @ @ x @ . . . . . .
. . . . . . . . @ ^ ^ ^ x x x x x x ^ ^ ^ @ @ @ x @ . . . . . .
. . . . . . . . @ ^ ^ ^ x x x x x x x x x x @ x x @ . . . . . .
. . . . . . . . @ ^ ^ ^ x x x x x x @ @ @ @ x x @ . . . . . . .
. . . . . . . . . @ ^ ^ ^ x x x x x o x x x x x @ . . . . . . .
. . . . . . . . . @ ^ ^ ^ x x x x x x x x x x @ . . . . . . . .
. . . . . . . . . . @ ^ ^ ^ x x x x x x x x @ . . . . . . . . .
. . . . . . . . . . . @ @ @ @ @ @ @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
TXT
 },
 "dodge-alien": {
  colors: ['000000', '9BE0E0', 'C8FBFB' ],
  design: <<TXT,
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . @ @ . . . . . @ . . . . . . . . . . .
. . . . . . . . . . . . @ x x @ . . . @ x @ . . . . . . . . . .
. . . . . . . . . . . . @ x x x @ @ @ x x x @ . . . . . . . . .
. . . . . . . . . . . @ x x x o o o o o o o @ . . . . . . . . .
. . . . . . . . . . . @ x x o o o o o o o o o @ . . . . . . . .
. . . . . . . . . . . @ x o o o o o o o o o o @ . . . . . . . .
. . . . . . . . . . @ o o o o o o o o o o o o o @ . . . . . . .
. . . . . . . . . . @ o o o o o o o o o x @ o o @ . . . . . . .
. . . . . . . . . @ o o o o o o x @ o o @ x o o @ . . . . . . .
. . . . . . . . . @ o o o o o o @ x o o o o o o o @ . . . . . .
. . . . . . . . @ o o o o o o o o o o o o o o o o @ . . . . . .
. . . . . . . . @ o o o o o o o o o o o o o o o o @ . . . . . .
. . . . . . . . @ o o o o x x x o o o o @ @ @ @ x @ . . . . . .
. . . . . . . . @ o o o x x x x x x o o o @ @ @ x @ . . . . . .
. . . . . . . . @ o o o x x x x x x x x x x @ x x @ . . . . . .
. . . . . . . . @ o o o x x x x x x @ @ @ @ x x @ . . . . . . .
. . . . . . . . . @ o o o x x x x x x x x x x x @ . . . . . . .
. . . . . . . . . @ o o o x x x x x x x x x x @ . . . . . . . .
. . . . . . . . . . @ o o o x x x x x x x x @ . . . . . . . . .
. . . . . . . . . . . @ @ @ @ @ @ @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
TXT
},
"dodge-dark": {
  colors: [ '000000', '562600', '723709', '713F1D', '96512B'],
  design: <<TXT,
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . @ @ . . . . . @ . . . . . . . . . . .
. . . . . . . . . . . . @ ~ ~ @ . . . @ ~ @ . . . . . . . . . .
. . . . . . . . . . . . @ ~ ~ ~ @ @ @ ~ ~ ~ @ . . . . . . . . .
. . . . . . . . . . . @ ~ ~ ~ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . . . .
. . . . . . . . . . . @ ~ ~ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . . . . . . @ ~ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . . .
. . . . . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . . .
. . . . . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ x x ^ ^ @ . . . . . . .
. . . . . . . . . @ ^ ^ ^ ^ ^ ^ x x ^ ^ @ o ^ ^ @ . . . . . . .
. . . . . . . . . @ ^ ^ ^ ^ ^ ^ @ o ^ ^ ^ ^ ^ ^ ^ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ^ ~ ~ ~ ^ ^ ^ ^ @ @ @ @ ~ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ~ ~ ~ ~ ~ ~ ^ ^ ^ @ @ @ ~ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ @ ~ ~ @ . . . . . .
. . . . . . . . @ ^ ^ ^ ~ ~ ~ ~ ~ ~ @ @ @ @ ~ ~ @ . . . . . . .
. . . . . . . . . @ ^ ^ ^ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ @ . . . . . . .
. . . . . . . . . @ ^ ^ ^ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ @ . . . . . . . .
. . . . . . . . . . @ ^ ^ ^ ~ ~ ~ ~ ~ ~ ~ ~ @ . . . . . . . . .
. . . . . . . . . . . @ @ @ @ @ @ @ @ @ @ @ . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
TXT
}
}


def cutoff_top( img )   ## "wipe-out" pixel lines 7,8,9 (top)
  [7,8,9].each do |y|
    img.width.times do |x|
      img[ x, y ] = Color::TRANSPARENT
    end
  end
  img
end



dodge = nil
types.each do |key,type|
   dodge = Image.parse( type[:design], colors: type[:colors] )
   dodge.save( "./tmp/#{key}.png")
   dodge.zoom(4).save( "./tmp/#{key}4x.png" )
   dodge.zoom(8).save( "./tmp/#{key}8x.png" )

   dodge = cutoff_top( dodge )
   dodge.save( "./tmp/#{key}_notop.png" )   ## check: change notop to noears or nohead or such or ???
end


beanie = Image.parse( <<TXT, colors: ['000000', '0060C3', 'D60404', '3CC300', 'E4EB17'] )
. . . . x x x x x . . . .
. . . . . . @ . . . . . .
. . x x x ~ ~ ~ o o o . .
. x x x x ~ ~ ~ o o o o .
x x x x ~ ~ ~ ~ ~ o o o o
x x x ~ ~ ~ ~ ~ ~ ~ o o o
. . . ^ ^ ^ ^ ^ ^ ^ . . .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( beanie, 11, 6 )
dodge.save( "./tmp/beanie-dodge.png" )
dodge.zoom(4).save( "./tmp/beanie-dodgex4.png" )
dodge.zoom(8).save( "./tmp/beanie-dodgex8.png" )



_3dglasses = Image.parse( <<TXT, colors: ['328DFD', 'FD3232', 'F0F0F0'] )
o o o o o o o o o o o o o o o
. o o @ @ @ @ @ o x x x x x o
. . o @ @ @ @ @ o x x x x x o
. . o o o o o o o o o o o o o
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( _3dglasses, 10, 13 )
dodge.save( "./tmp/3dglasses-dodge.png" )
dodge.zoom(4).save( "./tmp/3dglasses-dodgex4.png" )
dodge.zoom(8).save( "./tmp/3dglasses-dodgex8.png" )




headband = Image.parse( <<TXT, colors: ['1A6ED5','FFFFFF'] )
x x x x x x x x x x x
@ @ @ @ @ @ @ @ @ @ @
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( headband, 12, 11 )
dodge.save( "./tmp/headband-dodge.png" )
dodge.zoom(4).save( "./tmp/headband-dodgex4.png" )
dodge.zoom(8).save( "./tmp/headband-dodgex8.png" )



knitted_cap = Image.parse( <<TXT, colors: ['000000', '933709', 'CA4E11'] )
. . . @ @ @ @ @ @ @ @ @ @ @ . . .
. . @ o o o o o o o o o o o @ . .
. @ o o o o o o o o o o o o o @ .
@ x x x x x x x x x x x x x x x @
@ x o x o x o x o x o x o x o x @
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( knitted_cap, 9, 8 )
dodge.save( "./tmp/knittedcap-dodge.png" )
dodge.zoom(4).save( "./tmp/knittedcap-dodgex4.png" )
dodge.zoom(8).save( "./tmp/knittedcap-dodgex8.png" )




cap = Image.parse( <<TXT, colors: [ '8119B7', 'B261DC'] )
. . @ @ @ @ @ @ @ @ @ @ @ . . . . . .
. @ @ @ @ @ @ @ @ @ x @ @ @ . . . . .
@ @ @ @ @ @ @ @ @ @ @ x @ @ . . . . .
@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . .
@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( cap, 10, 8 )
dodge.save( "./tmp/cap-dodge.png" )
dodge.zoom(4).save( "./tmp/cap-dodgex4.png" )
dodge.zoom(8).save( "./tmp/cap-dodgex8.png" )




puts "bye"

