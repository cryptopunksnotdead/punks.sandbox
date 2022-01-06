###############################
# to run use:
#    $  ruby hoodies.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'





archetypes =
[
  Punks::Sheet.find_by( name: 'Male 4' ),
  Punks::Sheet.find_by( name: 'Male 3' ),
  Punks::Sheet.find_by( name: 'Male 2' ),
  Punks::Sheet.find_by( name: 'Male 1' ),
  Punks::Sheet.find_by( name: 'Male Chocolate' ),
  Punks::Sheet.find_by( name: 'Male Gold 1' ),
  Punks::Sheet.find_by( name: 'Male Gold 2' ),
  Punks::Sheet.find_by( name: 'Male Gold 3' ),
]


hues = [270, 240, 210,
        180, 150, 120,
         90,  60, 30,
          0, 330, 300]


HOODIE = Punks::Sheet.find_by( name: 'Hoodie',  gender: 'm' )
GRAY =   '#555555'   # (default) hoodie color


composite = ImageComposite.new( 12, archetypes.size )

archetypes.each do |archetype|
  hues.each do |hue|
    punk = Image.new( 24, 24 )
    punk.compose!( archetype )
    punk.compose!( HOODIE.change_colors( { GRAY => [hue, 1.0, 0.5] }) )

    composite << punk
  end
end



composite.save( 'i/hoodie-nation.png' )
composite.zoom(2).save( 'i/hoodie-nation@2x.png' )


puts "bye"


