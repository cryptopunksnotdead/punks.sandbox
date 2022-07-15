#####################
#  generate american punk (pixel) characters / heads; to run use:
#
#   $ ruby ./americans.rb


$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
$LOAD_PATH.unshift( "../../pixelart/backgrounds/lib" )
require 'punks'
require 'backgrounds'




specs = Csv.parse( <<TXT )
  Male M04,   Wallstreetbets Hair,        Regular Shades (Reflective), Normal Beard
  Male M07,   Wallstreetbets Hair Dark,   Regular Shades (Reflective), Luxurious Beard
  Female M08,   Rainbow Hair,  Hot Lipstick, Heart Shades
  Female 3,    Wild Blonde, Earring,  Mole, Big Shades, Smile,  Bubble Gum
TXT


americans = ImageComposite.new( 2, 2 )

specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes ).background( 'USA' )
  punk.zoom(8).save( "./tmp/american#{i}@8x.png" )

  americans << punk
end

americans.save( "./tmp/americans.png" )
americans.zoom(8).save( "./tmp/americans@8x.png" )


puts "bye"
