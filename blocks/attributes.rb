###########
#  to run use:
#    ruby ./attributes.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



attributes = {

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
end


puts "bye"