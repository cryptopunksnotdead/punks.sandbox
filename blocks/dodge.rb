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




capforward = Image.parse( <<TXT, colors: ['000000', '363535', '515150'] )
 . . @ @ @ @ @ @ @ @ @ @ . . . . .
 . @ x o o o o o o o o o @ . . . .
 @ x o o o o o o o o o o o @ . . .
 @ o o o o o o @ @ @ @ @ @ @ @ @ .
 @ o o o o o @ x x x x x x x x x @
 @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( capforward, 10, 7 )
dodge.save( "./tmp/capforward-dodge.png" )
dodge.zoom(4).save( "./tmp/capforward-dodgex4.png" )
dodge.zoom(8).save( "./tmp/capforward-dodgex8.png" )



bandana = Image.parse( <<TXT, colors: ['122B7C', '1537A4', '1A43C8'] )
 . . . . . . . x x x x x x x x x x .
 . . . . . . x o o o o o o o o o o x
 . . . . . x o o o o o o o o o o o x
 . . . . x o o o o o o o o o o o o x
 o x o x @ o x x x x x x o o o o x .
 . o x @ . . . . . . . . x x x x . .
 . o @ . . . . . . . . . . . . . . .
 . o . . . . . . . . . . . . . . . .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( bandana, 6, 7 )
dodge.save( "./tmp/bandana-dodge.png" )
dodge.zoom(4).save( "./tmp/bandana-dodgex4.png" )
dodge.zoom(8).save( "./tmp/bandana-dodgex8.png" )



fedora = Image.parse( <<TXT, colors: ['3D2F1E', '000000'] )
 . . . . . . @ @ @ @ @ @ @ . . . . . .
 . . . . . @ @ @ @ @ @ @ @ @ . . . . .
 . . . . . @ @ @ @ @ @ @ @ @ . . . . .
 . . . . @ @ @ @ @ @ @ @ @ @ @ . . . .
 . . . x x x x x x x x x x x x x . . .
 . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ .
 @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( fedora, 8, 6 )
dodge.save( "./tmp/fedora-dodge.png" )
dodge.zoom(4).save( "./tmp/fedora-dodgex4.png" )
dodge.zoom(8).save( "./tmp/fedora-dodgex8.png" )



tophat = Image.parse( <<TXT, colors: ['000000', 'DD1C1C'] )
 . . . . @ @ @ @ @ @ @ @ @ @ @ . . . .
 . . . @ @ @ @ @ @ @ @ @ @ @ @ @ . . .
 . . . @ @ @ @ @ @ @ @ @ @ @ @ @ . . .
 . . . @ @ @ @ @ @ @ @ @ @ @ @ @ . . .
 . . . @ @ @ @ @ @ @ @ @ @ @ @ @ . . .
 . . . @ @ @ @ @ @ @ @ @ @ @ @ @ . . .
 . . x x x x x x x x x x x x x x x . .
 . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ .
 @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( tophat, 8, 4 )
dodge.save( "./tmp/tophat-dodge.png" )
dodge.zoom(4).save( "./tmp/tophat-dodgex4.png" )
dodge.zoom(8).save( "./tmp/tophat-dodgex8.png" )


crazyhair = Image.parse( <<TXT, colors: ['E22626'] )
. . . . . . @ . . . . @ . . . . . . . . . .
. . . . . @ @ @ . @ @ @ @ . . . . @ . . . .
. . . . . @ @ @ @ @ @ @ . @ @ @ @ @ . . . .
. . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . .
@ . . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ .
. . @ @ @ @ @ @ @ . . . . . @ . @ . @ @ @ .
. . @ @ @ @ . @ . . . . . . . . . . @ . . .
. @ @ @ @ . . . . . . . . . . . . . . . . .
. @ @ @ @ . . . . . . . . . . . . . . . . .
. @ @ @ . . . . . . . . . . . . . . . . . .
. . @ @ . . . . . . . . . . . . . . . . . .
. . @ . . . . . . . . . . . . . . . . . . .
. @ . . . . . . . . . . . . . . . . . . . .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( crazyhair, 5, 5 )
dodge.save( "./tmp/crazyhair-dodge.png" )
dodge.zoom(4).save( "./tmp/crazyhair-dodgex4.png" )
dodge.zoom(8).save( "./tmp/crazyhair-dodgex8.png" )





cowboyhat = Image.parse( <<TXT, colors: ['794B10', '4F2E05'] )
. . . . . . @ @ . . . @ @ . . . . . .
. . . . . @ @ @ @ @ @ @ @ @ . . . . .
. . . . . @ @ @ @ @ @ @ @ @ . . . . .
. . . . . @ @ @ @ @ @ @ @ @ . . . . .
@ . . . x x x x x x x x x x x . . . @
@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
. @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( cowboyhat, 8, 6 )
dodge.save( "./tmp/cowboyhat-dodge.png" )
dodge.zoom(4).save( "./tmp/cowboyhat-dodgex4.png" )
dodge.zoom(8).save( "./tmp/cowboyhat-dodgex8.png" )



tiara = Image.parse( <<TXT, colors: ['FFBB00', 'FF2100'] )
@ @ @ @ @ @ . @ @ @
. . . . . . @ . . .
. . . . . @ x @ . .
. . . . . . @ . . .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( tiara, 12, 10 )
dodge.save( "./tmp/tiara-dodge.png" )
dodge.zoom(4).save( "./tmp/tiara-dodgex4.png" )
dodge.zoom(8).save( "./tmp/tiara-dodgex8.png" )




regularshades = Image.parse( <<TXT, colors: ['000000'] )
@ @ @ @ @ @ @ @ @ @ @ @ @
. . . @ @ @ @ . @ @ @ @ .
. . . @ @ @ @ . @ @ @ @ .
. . . . @ @ . . . @ @ . .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( regularshades, 11, 14 )
dodge.save( "./tmp/regularshades-dodge.png" )
dodge.zoom(4).save( "./tmp/regularshades-dodgex4.png" )
dodge.zoom(8).save( "./tmp/regularshades-dodgex8.png" )



classicshades = Image.parse( <<TXT, colors: ['000000', '5C390F', 'AC6009'] )
@ @ @ @ @ @ @ @ @ @ @ @ @
. . . @ x x @ . @ x x @ .
. . . @ o o @ . @ o o @ .
. . . . @ @ . . . @ @ . .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( classicshades, 11, 14 )
dodge.save( "./tmp/classicshades-dodge.png" )
dodge.zoom(4).save( "./tmp/classicshades-dodgex4.png" )
dodge.zoom(8).save( "./tmp/classicshades-dodgex8.png" )


eyepatch = Image.parse( <<TXT, colors: ['000000'] )
@ @ @ @ @ @ @ @ @ @ @ @ @
. . . . @ @ @ @ . . . . .
. . . . @ @ @ @ . . . . .
. . . . . @ @ . . . . . .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( eyepatch, 11, 13 )
dodge.save( "./tmp/eyepatch-dodge.png" )
dodge.zoom(4).save( "./tmp/eyepatch-dodgex4.png" )
dodge.zoom(8).save( "./tmp/eyepatch-dodgex8.png" )




smallshades = Image.parse( <<TXT, colors: ['000000'] )
@ @ @ @ @ @ @ @ @ @ @ @ @
. . . . @ @ @ . . @ @ @ .
. . . . @ @ @ . . @ @ @ .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( smallshades, 11, 14 )
dodge.save( "./tmp/smallshades-dodge.png" )
dodge.zoom(4).save( "./tmp/smallshades-dodgex4.png" )
dodge.zoom(8).save( "./tmp/smallshades-dodgex8.png" )






nerdglasses = Image.parse( <<TXT, colors: ['000000', '80DCDB'] )
. . . . @ @ @ @ @ . @ @ @ @ @
@ @ @ @ @ x x x @ @ @ x x x @
. . . . @ x x x @ . @ x x x @
. . . . @ @ @ @ @ . @ @ @ @ @
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( nerdglasses, 10, 14 )
dodge.save( "./tmp/nerdglasses-dodge.png" )
dodge.zoom(4).save( "./tmp/nerdglasses-dodgex4.png" )
dodge.zoom(8).save( "./tmp/nerdglasses-dodgex8.png" )




bigshades = Image.parse( <<TXT, colors: ['000000', '690B45', '8C0C5B', 'AD2160'] )
. . . @ @ @ @ @ @ . @ @ @ @ @ @
. . . @ x x x x @ @ @ x x x x @
@ @ @ @ o o o o @ . @ o o o o @
. . . @ ^ ^ ^ ^ @ . @ ^ ^ ^ ^ @
. . . . @ @ @ @ . . . @ @ @ @ .
TXT

dodge = Image.new( 32, 32 )
dodge.compose!( bigshades, 10, 13 )
dodge.save( "./tmp/bigshades-dodge.png" )
dodge.zoom(4).save( "./tmp/bigshades-dodgex4.png" )
dodge.zoom(8).save( "./tmp/bigshades-dodgex8.png" )






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

