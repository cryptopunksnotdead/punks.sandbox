#####################
#  generate italian punk (pixel) characters / heads; to run use:
#
#   $ ruby ./italians.rb


$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'


flag = Image.read( './flag.png' )


patch = {
  'hoodiedesigner1'      => Image.read( './hoodie-designer1.png' ),
  'hoodiedesigner2'      => Image.read( './hoodie-designer2.png' ),
  'knittedcapdesigner1' => Image.read( './knitted_cap-designer1.png' ),
  'knittedcapdesigner2' => Image.read( './knitted_cap-designer2.png' ),
  'tophatdesigner1'     => Image.read( './top_hat-designer1.png' ),
  'tophatdesigner2'    => Image.read( './top_hat-designer2.png' ),
  '3dglassesdesigner1' => Image.read( './3d_glasses-designer1.png' ),
}




specs = Csv.parse( <<TXT )
  Male M04, Top Hat Designer 1, Regular Shades Reflective, Smile, Bubble Gum
  Male M08, Knitted Cap Designer 1, 3D Glasses Designer 1, Earring, Gold Chain
  Male M05, Hoodie Designer 1,  Normal Beard Black

  Male M06, Hoodie Designer 2, Spots, Horned-Rim Glasses
  Male M05, Knitted Cap Designer 2, VR, Earring, Goat
  Male M03, Top Hat Designer 2, 3D Glasses Designer 1, Smile, Pipe
TXT


italians = ImageComposite.new( 3, 2, background: ['#009144', '#ffffff', '#E2001A'])

specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes, patch: patch )
  # punk = punk.background( flag )

  punk.zoom(8).save( "./tmp/italian#{i}@8x.png" )

  italians << punk
end

italians.save( "./tmp/italians.png" )
italians.zoom(8).save( "./tmp/italians@8x.png" )


puts "bye"
