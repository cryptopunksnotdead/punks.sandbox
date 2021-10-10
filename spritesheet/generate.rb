#####################
#  generate punks; to run use:
#
#   $ ruby ./generate.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



### use builtin generator

g = Punks.generator

## change to "local" custom version
# g = Punks::Generator.new( './tmp/spritesheet.png',
#                           './tmp/spritesheet.csv' )




sprite = g.spritesheet[ 0 ]
sprite.zoom(4).save( "./tmp/sprite0@4x.png" )

sprite = g.sheet[ 9 ]
sprite.zoom(4).save( "./tmp/sprite9@4x.png" )


## archetypes lookup
sprite = g.find( 'Male 1' )
sprite.zoom(4).save( "./tmp/male1@4x.png" )

sprite = g.find( 'Alien' )
sprite.zoom(4).save( "./tmp/alien@4x.png" )

sprite = g.find( 'Alien 0°' )
sprite.zoom(4).save( "./tmp/alien_0@4x.png" )

## attribute lookup - note: requires gender m/f qualifier!!!!
sprite = g.find( 'Birthday Hat', gender: 'f' )
sprite.zoom(4).save( "./tmp/birthdayhat_(f)@4x.png" )



### punks
punk = g.generate( "Male 1", "Beanie", "Smile" )
punk.zoom(4).save( "./tmp/gen1@4x.png" )

punk = g.generate( "Female 4", "Birthday Hat", "Big Shades" )
punk.zoom(4).save( "./tmp/gen2@4x.png" )

punk = g.generate( "Alien 0°", "Sombrero", "Classic Shades" )
punk.zoom(4).save( "./tmp/gen3@4x.png" )


puts
puts "to_recs:"
pp g.to_recs(  "Male 1", "Beanie", "Smile" )

punk = g.generate( 0, 68, 175 )   # 0=>Male 1, 68=>Beanie (m), 175=>Smile (m)
punk.zoom(4).save( "./tmp/gen1b@4x.png" )




### try Punks::Image
punk = Punks::Image.generate( "Male 1", "Beanie", "Smile" )
punk.zoom(4).save( "./tmp/gen1b@4x.png" )

punk = Punks::Image.generate( "Female 4", "Birthday Hat", "Big Shades" )
punk.zoom(4).save( "./tmp/gen2b@4x.png" )

punk = Punks::Image.generate( "Alien 0°", "Sombrero", "Classic Shades" )
punk.zoom(4).save( "./tmp/gen3b@4x.png" )


puts "bye"
