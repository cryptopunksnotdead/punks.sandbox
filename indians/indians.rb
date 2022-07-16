#####################
#  generate indian punk (pixel) characters / heads; to run use:
#
#   $ ruby ./indians.rb


$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'


patch = {
  'turban1'            => Image.read( './turban1.png' ),
  'turban2'            => Image.read( './turban2.png' ),
  'turban3'            => Image.read( './turban3.png' ),
  'redpoint'          => Image.read( './red_point.png' ),
  'whitecurlybeard'   => Image.read( './white_curly_beard.png' ),
  'blackcurlybeard'   => Image.read( './black_curly_beard.png' ),
  'callcenter'        => Image.read( './call_center.png' ),
}



specs = Csv.parse( <<TXT )
  Male M07,   Turban 1, Red Point, Horned-Rim Glasses, Luxurious White Beard
  Male M09,   Turban 3, Red Point, White Curly Beard
  Male M05,   Turban 2, Red Point, 3D Glasses, Black Curly Beard
  Male M06,   Red Point,  Call Center, VR, Mustache
TXT


indians = ImageComposite.new( 2, 2 )

specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes, patch: patch )
  ## add indian flag (three-colored horizontal stripes) background
  punk = punk.stripes( '#FF9934', '#FFFFFF', '#138708' )

  punk.zoom(8).save( "./tmp/indians#{i}@8x.png" )

  indians << punk
end

indians.save( "./tmp/indians.png" )
indians.zoom(8).save( "./tmp/indians@8x.png" )


puts "bye"
