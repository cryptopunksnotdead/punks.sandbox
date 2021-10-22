###############################
# to run use:
#    $  ruby ./generate_10000.rb


##
## todos/fix/checks:
##  - [ ] change black hair color attributes to more colorful or such - why? why not?
##
##  - remove lipstick attributes ???
##    or smile and frown attributes ???
##
##  - add flowers to blond haired females ???



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


halloween = {
  'Male 1'   => 'Skeleton',
  'Male 2'   => 'Skeleton',
  'Male 3'   => 'Skeleton Gold 2',
  'Male 4'   => 'Mummy',
  'Female 1' => 'Skeleton Female',
  'Female 2' => 'Skeleton Female',
  'Female 3' => 'Skeleton Female Gold 2',
  'Female 4' => 'Mummy Female',
  'Zombie'   => 'Vampire',
  'Ape'      => 'Orc',
  'Alien'    => 'Demon',
}


#####################################
## generate preview 20x20
composite = ImageComposite.new( 20, 20 )

(0..399).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## change archetype to halloween variant
   attributes[0] = halloween[ attributes[0] ]
   pp attributes

   punk = Punks::Image.generate( *attributes )
   composite << punk
end

composite.save( "./tmp/halloweenpunks_preview.png" )



###################################
## generate  100x100 = 10000
composite = ImageComposite.new( 100, 100 )

(0..9999).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## change archetype to halloween variant
   attributes[0] = halloween[ attributes[0] ]
   pp attributes

   punk = Punks::Image.generate( *attributes )
   composite << punk
end

composite.save( "./tmp/halloweenpunks.png" )


puts "bye"

