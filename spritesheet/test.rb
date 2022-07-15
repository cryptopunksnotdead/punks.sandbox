#####################
#  generate punks; to run use:
#
#   $ ruby ./generate.rb


$LOAD_PATH.unshift( "../cryptopunks/punks/lib" )
require 'punks'




############################################
## change to "local" custom version
g = Punk::Generator.new(  './tmp/spritesheet.png',
                          './tmp/spritesheet.csv',
                          image_class: Punk::Image )


specs = Csv.parse( <<TXT )
  Male 1, Beanie, Smile
  Female 4, Birthday Hat, Big Shades
  Alien, Cap Forward, Laser Eyes, Pipe
  Ape, Knitted Cap, Laser Eyes, Gold Chain
  Zombie, Crazy Hair, Laser Eyes, Earring

  ## try cyborgs
  Cyborg Male 1, Cap
  Cyborg Female 1, Cap
  Cyborg Ape, Cap
  Cyborg Ape Metal, Cap

  ### try (dr. ellis) monk skin tones
  Male MST10, Beanie, Smile
  Male M01, Beanie, Smile
  Female MST10, Beanie
  Female M01, Beanie

  ## try planet of ape
  Ape Trippy,  Knitted Cap
  Ape Male Trippy,  Knitted Cap
  Ape Death Bot,   Cap
  Ape Pink,       Cap
  Ape Black,     Cap
  Ape White,     Cap

  ## try saudis mix'n'match

  Male M02,   Red Shemagh & Agal,  Laser Eyes Gold
  Male M07,   White Shemagh & Agal, Luxurious Beard, Laser Eyes Red

  Ape,           Red Shemagh & Agal
  Ape Black,     Red Shemagh & Agal,  Laser Eyes Gold
  Ape Trippy,    Red Shemagh & Agal,  3D Glasses
  Ape Blue,      Brown Shemagh & Agal,  Big Shades
  Ape DMT,      Brown Shemagh & Agal,  Big Shades
  Ape Solid Gold,      White Shemagh & Agal, Laser Eyes Red
  Cyborg Ape,    White Shemagh & Agal,  Pipe
  Cyborg Ape Metal,  White Shemagh & Stylish Gold Agal,  Bubble Gum

  Female M02,   Niquab Black
  Female M07,   Niquab Blue
  Ape Female,   Niquab Black,   Laser Eyes
  Ape Female,   Niquab Black,   VR
  Ape Female Gold, Niquab Black,  Laser Eyes Red

  ## try wallstreetbets
  Male M03,   Wallstreetbets Hair
  Male M06,   Wallstreetbets Hair Dark
  Male M04,   Wallstreetbets Hair,        Regular Shades (Reflective), Normal Beard
  Male M07,   Wallstreetbets Hair Dark,   Regular Shades (Reflective), Luxurious Beard

  ## try rainbow
  Male M05,   Rainbow Hair,  Smile
  Female M05,   Rainbow Hair,  Hot Lipstick

  ## try jews
  Male M03,  Jewish Hat 1,  Chinstrap,  3D Glasses
  Male M04,   Jewish Hat 2
  Male M05,   Jewish Hat 3, Normal Beard Black
  Male M06,   Jewish Hat 4,  Big Beard, Laser Eyes Blue
  Male M07,   Jewish Hat 5, Luxurious White Beard
TXT


specs.each_with_index do |attributes,i|
  punk = g.generate( *attributes )
  punk.zoom(4).save( "./tmp/test/punk#{i}_ii@4x.png" )
end


puts
puts "to_recs:"
pp g.to_recs(  "Male 1", "Beanie", "Smile" )


sprite = g.sheet[ 0 ]
sprite.zoom(4).save( "./tmp/test/sprite0@4x.png" )

sprite = g.sheet[ 9 ]
sprite.zoom(4).save( "./tmp/test/sprite9@4x.png" )


## archetypes lookup
sprite = g.find( 'Male 1' )
sprite.zoom(4).save( "./tmp/test/male1_ii@4x.png" )

sprite = g.find( 'Alien' )
sprite.zoom(4).save( "./tmp/test/alien_ii@4x.png" )

sprite = g.find( 'Alien 0°' )
sprite.zoom(4).save( "./tmp/test/alien_0_ii@4x.png" )

## attribute lookup - note: requires gender m/f qualifier!!!!
sprite = g.find( 'Birthday Hat', gender: 'f' )
sprite.zoom(4).save( "./tmp/test/birthdayhat_(f)_ii@4x.png" )


puts "bye"
