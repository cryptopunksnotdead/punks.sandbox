###########
#  to run use:
#    ruby ./attributes.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


EARRING_COLORS = ['000000', 'FFD926']
EARRING_DESIGN =<<TXT   ## same design for m/f (different offset)
. @ .
@ x @
. @ .
TXT

EYESHADOW_DESIGN =<<TXT  ## same design for all colors
x x . . . x x
@ o . . . @ o
TXT


attributes = {
#######
# Earring | 2459  (24.59 %) | Male (1498) · Female (933) · Zombie (22) · Alien (3) · Ape (3)
"earring-male": {
  colors: EARRING_COLORS,
  offset: [4,13],
  design: EARRING_DESIGN,
},
"earring-female": {
  colors: EARRING_COLORS,
  offset: [5,13],
  design: EARRING_DESIGN,
},


####################
# Green Eye Shadow |  271  ( 2.71 %) | Female (271)
#
# note: fix: different shades of green for skintones!!!
#                 requires alpha channel/ opacity?
#    always use colors for medium for now
# no. 3770 - 5C915F, 6AA06E  (albino)
#            507C33, 5D8B43  (medium)
# no. 2022 - 3C6827, 486F2B  (dark)
greeneyeshadow: {
  colors: ['000000', '507C33', '5D8B43' ],
  offset: [9,12],
  design: EYESHADOW_DESIGN,
},
#######################
# Purple Eye Shadow |  262  ( 2.62 %) | Female (262)
#   note: see above (use medium for now)
purpleeyeshadow: {
  colors: ['000000', 'AF2C7B', 'C13F8F'],
  offset: [9,12],
  design: EYESHADOW_DESIGN,
},
############
# Blue Eye Shadow      |  266  ( 2.66 %) | Female (266)
#   note: see above (use medium for now)
blueeyeshadow: {
  colors: ['000000', '506A65', '5D7975'],
  offset: [9,12],
  design: EYESHADOW_DESIGN,
},


###########
#  Blonde Bob |  147  (1.47 %) | Female (147)
blondebob: {
  colors: ['FFF68E'],
  design: <<TXT,
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . @ @ @ @ @ @ @ @ . @ @ @ . . . . . .
. . . . . . @ @ . @ @ @ @ . . . @ @ . . . . . .
. . . . . . @ @ . . . @ . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ @ . . . . . . . . . @ @ . . . . . .
. . . . . @ @ . . . . . . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . @ @ @ @ @ . . . . . . . @ @ @ @ . . . .
. . . . . . @ @ @ @ . . . . . @ @ . . . . . . .
TXT
},


####
# Wild Hair |  447  (4.47 %) | Male (296) · Female (144) · Zombie (7)
"wildhair-male": {
 colors: ['000000'],
 design: <<TXT,
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . @ @ . . . . @ @ @ @ @ . . . . . . .
. . . @ . . @ @ @ @ @ @ @ @ @ @ . . @ @ . . . .
. . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . . . . .
. . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . . . .
. . . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . . . . .
. . . @ @ @ @ @ @ @ @ @ . . @ @ @ @ @ . . . . .
. . @ @ @ @ @ @ @ . . @ @ . . @ @ @ . . . . . .
. . . . @ @ @ @ . . . . . . . . @ @ @ . . . . .
. . . @ @ @ @ @ . . . . . . . . @ @ @ . . . . .
. . . @ . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . @ @ @ @ . . . . . . . . @ @ . . . . . .
. . . . @ @ @ . . . . . . . . . @ @ . . . . . .
TXT
},
"wildhair-female": {
  colors: ['000000'],
  design: <<TXT,
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . @ . . . . . . . . .
. . . . . . @ . . @ . . . @ . . @ . . . . . . .
. . . . . @ . @ . @ @ . @ @ @ @ @ . . @ . . . .
. . . @ . @ @ @ @ @ @ @ @ @ @ @ @ . @ . . . . .
. . . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . . . . .
. . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . . . .
. . . . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . . . . .
. . . @ @ @ @ @ @ @ @ @ . . @ @ @ @ . . . . . .
. . @ @ @ @ @ @ @ . . @ @ . . @ @ @ @ . . . . .
. . . . @ @ @ @ . . . . . . . . @ @ @ @ . . . .
. . . @ @ @ @ @ . . . . . . . . @ @ @ . . . . .
. . . @ . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . @ @ @ @ . . . . . . . . @ @ @ @ . . . .
. . . . @ . @ @ . . . . . . . . @ @ . . . . . .
. . . . . . @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ . @ . . . . . . . . @ @ . . . . . .
. . . . . . . @ . . . . . . . . @ . @ . . . . .
TXT
},



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
  offset_x, offset_y = attribute[:offset] || [0,0]
  punk.compose!( img, offset_x, offset_y )
  punk.save( "./tmp/#{key}.png" )
  punk.zoom(8).save( "./tmp/#{key}x8.png" )
end


puts "bye"