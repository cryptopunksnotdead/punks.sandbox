###############################
# to run use:
#    $  ruby ./generate_10000.rb


##
## todos/fix/checks:
##  - [ ]  add back colored mouth in (human) females (like in zombies) - why? why not?
##
##  - [ ] change black hair color attributes to silver or such - why? why not?
##  - [ ] auto-change other attributes to make more "golden" ????



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


golden = {
  'Male 1'   => 'Male Gold 1',
  'Male 2'   => 'Male Gold 2',
  'Male 3'   => 'Male Gold 3',
  'Male 4'   => 'Male Yellow',
  'Female 1' => 'Female Gold 1',
  'Female 2' => 'Female Gold 2',
  'Female 3' => 'Female Gold 3',
  'Female 4' => 'Female Yellow',
  'Zombie'   => 'Zombie Gold 1',
  'Ape'      => 'Ape Gold 1',
  'Alien'    => 'Alien Gold 1',
}


#####################################
## generate preview 20x20
composite = ImageComposite.new( 20, 20 )

(0..399).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## change archetype to golden variant
   attributes[0] = golden[ attributes[0] ]
   pp attributes

   punk = Punks::Image.generate( *attributes )
   composite << punk
end

composite.zoom(2).save( "./tmp/goldenpunks_preview@2x.png" )
composite.save( "./tmp/goldenpunks_preview.png" )



###################################
## generate  100x100 = 10000
composite = ImageComposite.new( 100, 100 )

(0..9999).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## change archetype to golden variant
   attributes[0] = golden[ attributes[0] ]
   pp attributes

   punk = Punks::Image.generate( *attributes )
   composite << punk
end

composite.save( "./tmp/goldenpunks.png" )





puts "bye"