#####################
#  generate nigerian punk (pixel) characters / heads; to run use:
#
#   $ ruby ./nigerians.rb


$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'


patch = {
 'hat1'      => Image.read( './hat1.png' ),
 'hat2'      => Image.read( './hat2.png' ),
 'headband'  => Image.read( './headband.png' ),
 'beard1'    => Image.read( './beard1.png' ),
 'beard2'    => Image.read( './beard2.png' ),
 'bigshades' => Image.read( './big_shades.png' ),
}


specs = Csv.parse( <<TXT )
  Male M10,   Beard 1, Hat 1, Smile
  Male M08,   Headband,  Normal Beard Black, Pipe

  Male M09,   Beard 2, Big Shades, Gold Chain
  Male M07,   Hat 2, Regular Shades Reflective, Earring, Bubble Gum
TXT


nigerians = ImageComposite.new( 2, 2, background: '#00874C' )

specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes, patch: patch )

  punk.zoom(8).save( "./tmp/nigerian#{i}@8x.png" )

  nigerians << punk
end

nigerians.save( "./tmp/nigerians.png" )
nigerians.zoom(8).save( "./tmp/nigerians@8x.png" )


puts "bye"
