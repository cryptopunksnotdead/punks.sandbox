require 'cryptopunks'


### generate 4x versions

['human-female_darker',
 'human-female_dark',
 'human-female_light',
 'human-female_lighter',
 'zombie-female',
 'ape-female',
 'alien-female'].each do |name|

  path = "./i/attributes/#{name}.png"
  punk = Image.read( path )

  punk.zoom(4).save( "./i/#{name}@4x.png" )
end



ALIEN_FEMALE   = Image.read( './i/attributes/alien-female.png' )
APE_FEMALE     = Image.read( './i/attributes/ape-female.png' )
ZOMBIE_FEMALE  = Image.read( './i/attributes/zombie-female.png' )

CRAZY_HAIR_II = Image.read( './i/attributes/crazyhair.png' )
WILD_HAIR_II  = Image.read( './i/attributes/wildhair.png' )


ALIEN_MALE   = Punks::Sheet.find_by( name: 'Alien' )
APE_MALE     = Punks::Sheet.find_by( name: 'Ape' )
ZOMBIE_MALE  = Punks::Sheet.find_by( name: 'Zombie' )

CAP_FORWARD  = Punks::Sheet.find_by( name: 'Cap Forward', gender: 'm' )
PIPE         = Punks::Sheet.find_by( name: 'Pipe', gender: 'm' )
SMALL_SHADES = Punks::Sheet.find_by( name: 'Small Shades', gender: 'm' )
HEADBAND     = Punks::Sheet.find_by( name: 'Headband', gender: 'm' )
KNITTED_CAP  = Punks::Sheet.find_by( name: 'Knitted Cap', gender: 'm' )
CRAZY_HAIR   = Punks::Sheet.find_by( name: 'Crazy Hair', gender: 'm' )
CHINSTRAP    = Punks::Sheet.find_by( name: 'Chinstrap', gender: 'm' )
EARRING      = Punks::Sheet.find_by( name: 'Earring', gender: 'm' )
WILD_HAIR    = Punks::Sheet.find_by( name: 'Wild Hair', gender: 'm' )
_3D_GLASSES  = Punks::Sheet.find_by( name: '3D Glasses', gender: 'm' )


### note: special case for neckware (differs for "classic/male" and "round/female")
GOLD_CHAIN    = Punks::Sheet.find_by( name: 'Gold Chain', gender: 'm' )
GOLD_CHAIN_II = Punks::Sheet.find_by( name: 'Gold Chain', gender: 'f' )



### try (alien) punk #7804  - "mr mona lisa"
##   with attributes
##  - Cap Forward
##  - Pipe
##  - Small Shades
punk = Image.new( 24, 24 )
punk.compose!( ALIEN_MALE )
punk.compose!( CAP_FORWARD )
punk.compose!( SMALL_SHADES )
punk.compose!( PIPE )
punk.zoom(4).save( "./i/punk7804@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( ALIEN_FEMALE )
punk.compose!( CAP_FORWARD )
punk.compose!( SMALL_SHADES )
punk.compose!( PIPE )
punk.zoom(4).save( "./i/punkette7804@4x.png")

### try (alien) punk #3100
##   with attributes
##   - Headband
punk = Image.new( 24, 24 )
punk.compose!( ALIEN_MALE )
punk.compose!( HEADBAND )
punk.zoom(4).save( "./i/punk3100@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( ALIEN_FEMALE )
punk.compose!( HEADBAND )
punk.zoom(4).save( "./i/punkette3100@4x.png")


#### try (ape) punk #5217
##   with attributes
##    - Gold Chain
##    - Knitted Cap
punk = Image.new( 24, 24 )
punk.compose!( APE_MALE )
punk.compose!( GOLD_CHAIN )
punk.compose!( KNITTED_CAP )
punk.zoom(4).save( "./i/punk5217@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( APE_FEMALE )
punk.compose!( GOLD_CHAIN_II )
punk.compose!( KNITTED_CAP )
punk.zoom(4).save( "./i/punkette5217@4x.png")


#### try (zombie) punk #7252
##   with attributes
##   - Crazy Hair
##   - Chinstrap
##   - Earring
punk = Image.new( 24, 24 )
punk.compose!( ZOMBIE_MALE )
punk.compose!( CRAZY_HAIR )
punk.compose!( CHINSTRAP )
punk.compose!( EARRING )
punk.zoom(4).save( "./i/punk7252@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( ZOMBIE_FEMALE )
punk.compose!( CRAZY_HAIR_II )
punk.compose!( EARRING )
punk.zoom(4).save( "./i/punkette7252@4x.png")


#### try (zombie) punk #8857
##   with attributes
##     - Wild Hair
##     - 3D Glasses
punk = Image.new( 24, 24 )
punk.compose!( ZOMBIE_MALE )
punk.compose!( WILD_HAIR )
punk.compose!( _3D_GLASSES )
punk.zoom(4).save( "./i/punk8857@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( ZOMBIE_FEMALE )
punk.compose!( WILD_HAIR_II )
punk.compose!( _3D_GLASSES )
punk.zoom(4).save( "./i/punkette8857@4x.png")


puts "bye"