###########
#  to run use:
#    ruby ./attributes.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



attributes = {

eyepatch: {
  colors: ['000000'],
  offset: [6,10],
  design: <<TXT,
 @ @ @ @ @ @ @ @ @ @ @
 . . @ @ @ @ . . . . .
 . . @ @ @ @ . . . . .
 . . . @ @ . . . . . .
TXT
},

bigshades: {
  colors: ['000000', '690C45', '8C0D5B', 'AD2160'],
  offset: [6,9],
  design: <<TXT,
 . @ @ @ @ @ . @ @ @ @ @
 . @ x x x @ @ @ x x x @
 @ @ o o o @ . @ o o o @
 . @ ^ ^ ^ @ . @ ^ ^ ^ @
 . . @ @ @ . . . @ @ @ .
TXT
},

nerdglasses: {
  colors: ['000000', '80DBDA'],
  offset: [6,10],
  design: <<TXT,
 . . @ @ @ @ . @ @ @ @
 @ @ @ x x @ @ @ x x @
 . . @ x x @ . @ x x @
 . . @ @ @ @ . @ @ @ @
TXT
},

regularshades: {
  colors: ['000000'],
  offset: [5,11],
  design: <<TXT,
 @ @ @ @ @ @ @ @ @ @ @ @ @
 . . . @ @ @ @ . . @ @ @ @
 . . . . @ @ . . . . @ @ .
TXT
},

classicshades: {
  colors: ['000000', '5C390F', 'C77514'],
  offset: [6,10],
  design: <<TXT,
@ @ @ @ @ @ @ @ @ @ @
. . @ x x @ . @ x x @
. . @ o o @ . @ o o @
. . . @ @ . . . @ @ .
TXT
},

"3dglasses": {
  colors: ['328DFD', 'FD3232', 'F0F0F0'],
  offset: [6,10],
  design: <<TXT,
o o o o o o o o o o o
. o o @ @ @ o x x x o
. . o @ @ @ o x x x o
. . o o o o o o o o o
TXT
},

bandana: {
  colors: ['142C7C', '1637A4', '1A43C8'],
  offset: [2,5],
  design: <<TXT,
. . . . . . x x x x x x x x .
. . . . . x o o o o o o o o x
. . . . x o o o o o o o o o x
o x o x @ o x x x x o o o x .
. o x @ . . . . . . x x x . .
. o @ . . . . . . . . . . . .
. o . . . . . . . . . . . . .
TXT
},

fedora: {
  colors: ['3D2F1E', '000000'],
  offset: [3,3],
  design: <<TXT,
 . . . . . . @ @ @ @ @ . . . . . .
 . . . . . @ @ @ @ @ @ @ . . . . .
 . . . . . @ @ @ @ @ @ @ . . . . .
 . . . . @ @ @ @ @ @ @ @ @ . . . .
 . . . x x x x x x x x x x x . . .
 . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ .
 @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT
},

cowboyhat: {
  colors: ['794B11', '502F05'],
  offset: [2,3],
  design: <<TXT,
 . . . . . . @ @ . . . @ @ . . . . . .
 . . . . . @ @ @ @ @ @ @ @ @ . . . . .
 . . . . . @ @ @ @ @ @ @ @ @ . . . . .
 . . . . . @ @ @ @ @ @ @ @ @ . . . . .
 @ . . . x x x x x x x x x x x . . . @
 @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
 . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ .
TXT
},

tophat: {
  colors: ['000000', 'DC1D1D'],
  offset: [4,1],
  design: <<TXT,
 . . . @ @ @ @ @ @ @ @ @ . . .
 . . @ @ @ @ @ @ @ @ @ @ @ . .
 . . @ @ @ @ @ @ @ @ @ @ @ . .
 . . @ @ @ @ @ @ @ @ @ @ @ . .
 . . @ @ @ @ @ @ @ @ @ @ @ . .
 . . x x x x x x x x x x x . .
 . @ @ @ @ @ @ @ @ @ @ @ @ @ .
 @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT
},

beanie: {
  colors: ['000000', '0060C3', 'D60404', 'E4EB17', '3CC300'],
  offset: [6,3],
  design: <<TXT,
  . . . x x x x x . . .
  . . . . . @ . . . . .
  . . x x ^ ^ ^ o o . .
  . x x x ^ ^ ^ o o o .
  x x x ^ ^ ^ ^ ^ o o o
  x x ^ ^ ^ ^ ^ ^ ^ o o
  . . ~ ~ ~ ~ ~ ~ ~ . .
TXT
},


headband:  # todo/check: female version smaller?
  { colors: ['1A6ED5', 'FFFFFF'],
    offset: [7,7],
    design: <<TXT,
  x x x x x x x x x
  @ @ @ @ @ @ @ @ @
TXT
  },

knittedcap:   # note: female version is smaller - width is one pixel less?
{
  colors: ['000000', '933709', 'CA4E11'],
  offset: [5,5],
  design: <<TXT,
  . . . @ @ @ @ @ @ @ . . .
  . . @ o o o o o o o @ . .
  . @ o o o o o o o o o @ .
  @ x x x x x x x x x x x @
  @ x o x o x o x o x o x @
TXT
},

crazyhair:    # note: female version is completely different!!!
{
  colors: ['E22626'],
  offset: [2,2],
  design: <<TXT,
. . . . . @ . . . . @ . . . . . . .
. . . . @ @ @ . @ @ @ @ . . @ . . .
. . . . @ @ @ @ @ @ @ . @ @ @ . . .
. . @ @ @ @ @ @ @ @ @ @ @ @ @ @ . .
@ . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @
@ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ .
. . @ @ @ @ @ @ . . @ . @ . @ . . .
. . @ @ . . @ . . . . . . . . . . .
. @ @ @ . . . . . . . . . . . . . .
. @ @ . . . . . . . . . . . . . . .
. . @ . . . . . . . . . . . . . . .
. . @ . . . . . . . . . . . . . . .
. @ . . . . . . . . . . . . . . . .
TXT
},


capforward:
   { colors: ['000000','353535','515151'],
     offset: [6,4],
     design: <<TXT,
. . @ @ @ @ @ @ @ . . . .
. @ x o o o o o o @ . . .
@ x o o o o o o o o @ . .
@ o o o @ @ @ @ @ @ @ @ .
@ o o @ x x x x x x x x @
@ @ @ @ @ @ @ @ @ @ @ @ @
TXT
  },

smallshades:
  { colors: ['000000'],
    offset: [5,11],
    design: <<TXT,
@ @ @ @ @ @ @ @ @ @ @ @
. . . . @ @ . . . @ @ .
. . . . @ @ . . . @ @ .
TXT
  },

pipe:
  { colors: ['000000', '683c08', '855114', 'b9b9b980'],
    offset: [13,11],
    design: <<TXT,
. . . . . . . ^ . .
. . . . . . ^ ^ ^ .
. . . . . . ^ ^ ^ .
. . . . . . . . . .
. . . . . . . ^ . .
. . . . . . . . . .
. . . . . . . ^ . .
. @ . . . . . . . .
@ o @ . . @ @ @ @ @
. @ o @ . @ o o o @
. . @ o @ @ x o x @
. . . @ o o o x @ .
. . . . @ @ @ @ . .
TXT
  },

# note: only works for alien faces - yes, it's a single pixel :-)
##  todo/fix: add human male face version!!!!
smile:
 {
   colors: ['000000'],
   offset: [10,17],
   design: '@',
 },

"smile-alien":       # note: diffent offset required for smile
  { colors: ['000000'],
    offset: [9,17],
    design: '@',
  },

cap:
 { colors: ['8119b7', 'b261dc'],
   offset: [6,4],
   design: <<TXT
. . @ @ @ @ @ @ @ . . . . .
. @ @ @ @ @ @ x @ @ . . . .
@ @ @ @ @ @ @ @ x @ . . . .
@ @ @ @ @ @ @ @ @ @ @ @ @ .
@ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT
  },
}




attributes.each do |key,attribute|
  img = Image.parse( attribute[:design], colors: attribute[:colors] )
  punk = Image.new( 24, 24 )
  punk.compose!( img, *attribute[:offset] )
  punk.save( "./tmp/#{key}.png" )
  punk.zoom(8).save( "./tmp/#{key}x8.png" )
end


puts "bye"