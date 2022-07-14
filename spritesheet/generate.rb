#####################
#  generate punks; to run use:
#
#   $ ruby ./generate.rb


$LOAD_PATH.unshift( "../cryptopunks/punks/lib" )
require 'punks'



### use builtin generator

specs = Csv.parse( <<TXT )
  Male 1, Beanie, Smile
  Female 4, Birthday Hat, Big Shades
  Alien, Cap Forward, Laser Eyes, Pipe
  Ape, Knitted Cap, Laser Eyes, Gold Chain
  Zombie, Crazy Hair, Laser Eyes, Earring
  Demon, Heart Shades
  Demon Female, Heart Shades
  Vampire Female, Wild Hair
  Vampire, Wild Hair
TXT

specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes )
  punk.zoom(4).save( "./tmp/test/punk#{i}@4x.png" )
end





## try lookups
## -- archetypes lookup
sprite = Punk::Sheet.find_by( name: 'Male 1' )
sprite.zoom(4).save( "./tmp/test/male1@4x.png" )

sprite = Punk::Sheet.find_by( name: 'Alien' )
sprite.zoom(4).save( "./tmp/test/alien@4x.png" )

sprite = Punk::Sheet.find_by( name: 'Alien 0°' )
sprite.zoom(4).save( "./tmp/test/alien_0@4x.png" )

## -- attribute lookup - note: requires gender m/f qualifier!!!!
sprite = Punk::Sheet.find_by( name: 'Birthday Hat', gender: 'f' )
sprite.zoom(4).save( "./tmp/test/birthdayhat_(f)@4x.png" )



puts "bye"
