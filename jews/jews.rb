#####################
#  generate punk (pixel) characters / heads; to run use:
#
#   $ ruby ./jews.rb


$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'



specs = Csv.parse( <<TXT )
  Male M03,  Jewish Hat 1,  Chinstrap,  3D Glasses
  Male M07,  Jewish Hat 5, Luxurious White Beard
  Male M05,  Jewish Hat 3, Normal Beard Black
  Male M06,  Jewish Hat 4,  Big Beard, Laser Eyes Blue
TXT


jews = ImageComposite.new( 2, 2, background: '#1750DB' )

specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes )
  punk.zoom(8).save( "./tmp/jew#{i}@8x.png" )

  jews << punk
end

jews.save( "./tmp/jews.png" )
jews.zoom(8).save( "./tmp/jews@8x.png" )


puts "bye"
