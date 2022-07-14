#####################
#  generate punks; to run use:
#
#   $ ruby ./generate_unisize.rb


require 'punks'



### use builtin generator

specs = Csv.parse( <<TXT )
  Female 1 (U)

  Alien Female (U), Headband
  Alien Female (U), Cap Forward, Small Shades, Pipe
  Alien Female (U), Cap Forward, Small Shades, Bubble Gum
  Alien Female, Cap Forward, Small Shades, Pipe

  Ape Female (U), Knitted Cap, Gold Chain
  Ape Female, Knitted Cap, Gold Chain

  Zombie Female (U), Crazy Hair, Earring
  Zombie Female, Crazy Hair, Earring

  Zombie Female (U), Wild Hair, 3D Glasses
  Zombie Female,  Wild Hair, 3D Glasses
TXT


specs.each_with_index do |attributes, i|
  punk = Punk::Image.generate( *attributes )
  punk.zoom(4).save( "./tmp/unisize/uni#{i}@4x.png" )
end




###########################
## try lookups
## -- archetypes lookup
sprite = Punk::Sheet.find_by( name: 'Female 1 (U)' )
sprite.zoom(4).save( "./tmp/unisize/female1+u@4x.png" )

sprite = Punk::Sheet.find_by( name: 'Alien Female (U)' )
sprite.zoom(4).save( "./tmp/unisize/alien-female+u@4x.png" )

sprite = Punk::Sheet.find_by( name: 'Zombie Female (U)' )
sprite.zoom(4).save( "./tmp/unisize/zombie-female+u@4x.png" )

puts "bye"
