#####################
#  generate punks; to run use:
#
#   $ ruby ./generate_unisize.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



### use builtin generator

### try Punks::Image
punk = Punks::Image.generate( "Female 1 (U)" )
punk.zoom(4).save( "./tmp/uni1@4x.png" )

punk = Punks::Image.generate( "Alien Female (U)", "Headband" )
punk.zoom(4).save( "./tmp/uni2@4x.png" )


punk = Punks::Image.generate( "Alien Female (U)", "Cap Forward" )
punk.zoom(4).save( "./tmp/uni3@4x.png" )

punk = Punks::Image.generate( "Alien Female", "Cap Forward" )
punk.zoom(4).save( "./tmp/small3@4x.png" )


punk = Punks::Image.generate( "Ape Female (U)", "Knitted Cap", "Gold Chain" )
punk.zoom(4).save( "./tmp/uni4@4x.png" )

punk = Punks::Image.generate( "Ape Female", "Knitted Cap", "Gold Chain" )
punk.zoom(4).save( "./tmp/small4@4x.png" )


## try lookups
## -- archetypes lookup
sprite = Punks::Sheet.find_by( name: 'Female 1 (U)' )
sprite.zoom(4).save( "./tmp/female1+u@4x.png" )

sprite = Punks::Sheet.find_by( name: 'Alien Female (U)' )
sprite.zoom(4).save( "./tmp/alien-female+u@4x.png" )


puts "bye"
