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


####
#  try new american hair styles (that, Joe Biden | Elon Musk | Donald Trump)


patch = {
  'hairjoebiden'    => Image.read( "./hair-joe_biden.png"),
  'hairelonmusk'    => Image.read( "./hair-elon_musk.png"),
  'hairdonaldtrump' => Image.read( "./hair-donald_trump.png"),
}

specs = Csv.parse( <<TXT )
  Male M04,  Hair Joe Biden
  Male M04,  Hair Elon Musk
  Male M04,  Hair Donald Trump

  Male M04,  Hair Joe Biden,    Regular Shades (Reflective), Earring, Smile
  Male M04,  Hair Elon Musk,    Regular Shades (Reflective), Frown, Pipe
  Male M04,  Hair Donald Trump, Heart Shades, Normal Beard

  Male Blue,    Hair Joe Biden,   3D Glasses
  Male Yellow,  Hair Elon Musk,   VR
  Male Red,    Hair Donald Trump, Rosy Cheeks, Clown Nose, Laser Eyes Gold, Gold Chain
TXT


americans = ImageComposite.new( 3, 3 )

specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes, patch: patch ).background( 'USA' )
  punk.zoom(8).save( "./tmp/american_ii#{i}@8x.png" )

  americans << punk
end

americans.save( "./tmp/americans_vol2.png" )
americans.zoom(8).save( "./tmp/americans_vol2@8x.png" )



puts "bye"
