#####################
#  generate punks; to run use:
#
#   $ ruby ./generate.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



### use builtin generator

### try Punks::Image
punk = Punks::Image.generate( "Male 1", "Beanie", "Smile" )
punk.zoom(4).save( "./tmp/gen1@4x.png" )

punk = Punks::Image.generate( "Female 4", "Birthday Hat", "Big Shades" )
punk.zoom(4).save( "./tmp/gen2@4x.png" )

punk = Punks::Image.generate( "Alien", "Cap Forward", "Laser Eyes", "Pipe" )
punk.zoom(4).save( "./tmp/gen3@4x.png" )

punk = Punks::Image.generate( "Ape", "Knitted Cap", "Laser Eyes", "Gold Chain" )
punk.zoom(4).save( "./tmp/gen4@4x.png" )

punk = Punks::Image.generate( "Zombie", "Crazy Hair", "Laser Eyes", "Earring" )
punk.zoom(4).save( "./tmp/gen5@4x.png" )


punk = Punks::Image.generate( "Demon", "Heart Shades" )
punk.zoom(4).save( "./tmp/gen5@4x.png" )

punk = Punks::Image.generate( "Demon Female", "Heart Shades" )
punk.zoom(4).save( "./tmp/gen6@4x.png" )


## try lookups
## -- archetypes lookup
sprite = Punks::Sheet.find_by( name: 'Male 1' )
sprite.zoom(4).save( "./tmp/male1@4x.png" )

sprite = Punks::Sheet.find_by( name: 'Alien' )
sprite.zoom(4).save( "./tmp/alien@4x.png" )

sprite = Punks::Sheet.find_by( name: 'Alien 0°' )
sprite.zoom(4).save( "./tmp/alien_0@4x.png" )

## -- attribute lookup - note: requires gender m/f qualifier!!!!
sprite = Punks::Sheet.find_by( name: 'Birthday Hat', gender: 'f' )
sprite.zoom(4).save( "./tmp/birthdayhat_(f)@4x.png" )









############################################
## change to "local" custom version
g = Punks::Generator.new( './tmp/spritesheet.png',
                          './tmp/spritesheet.csv' )


### punks
punk = g.generate( "Male 1", "Beanie", "Smile" )
punk.zoom(4).save( "./tmp/gen1_ii@4x.png" )

punk = g.generate( "Female 4", "Birthday Hat", "Big Shades" )
punk.zoom(4).save( "./tmp/gen2_ii@4x.png" )

punk = g.generate( "Alien", "Cap Forward", "Laser Eyes", "Pipe" )
punk.zoom(4).save( "./tmp/gen3_ii@4x.png" )

punk = g.generate( "Ape", "Knitted Cap", "Laser Eyes", "Gold Chain" )
punk.zoom(4).save( "./tmp/gen4_ii@4x.png" )

punk = g.generate( "Zombie", "Crazy Hair", "Laser Eyes", "Earring" )
punk.zoom(4).save( "./tmp/gen5_ii@4x.png" )


puts
puts "to_recs:"
pp g.to_recs(  "Male 1", "Beanie", "Smile" )

punk = g.generate( 0, 68, 175 )   # 0=>Male 1, 68=>Beanie (m), 175=>Smile (m)
punk.zoom(4).save( "./tmp/gen1_iii@4x.png" )



sprite = g.spritesheet[ 0 ]
sprite.zoom(4).save( "./tmp/sprite0@4x.png" )

sprite = g.sheet[ 9 ]
sprite.zoom(4).save( "./tmp/sprite9@4x.png" )


## archetypes lookup
sprite = g.find( 'Male 1' )
sprite.zoom(4).save( "./tmp/male1_ii@4x.png" )

sprite = g.find( 'Alien' )
sprite.zoom(4).save( "./tmp/alien_ii@4x.png" )

sprite = g.find( 'Alien 0°' )
sprite.zoom(4).save( "./tmp/alien_0_ii@4x.png" )

## attribute lookup - note: requires gender m/f qualifier!!!!
sprite = g.find( 'Birthday Hat', gender: 'f' )
sprite.zoom(4).save( "./tmp/birthdayhat_(f)_ii@4x.png" )



puts "bye"
