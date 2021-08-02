###########
#  to run use:
#    ruby ./blocks.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



attributes = {
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
}



attributes.each do |key,attribute|
  img = Image.parse( attribute[:design], colors: attribute[:colors] )
  punk = Image.new( 24, 24 )
  punk.compose!( img, *attribute[:offset] )
  punk.save( "./tmp/#{key}.png" )
end


puts "bye"