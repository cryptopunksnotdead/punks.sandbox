$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



frame = Image.read( "./i/frame_black24x24.png" )


composite = ImageComposite.new( 8, 4, width: 38+4, height: 38+4 )  # 8x4 = 32


[ 3100, 7804, 4156, 5217, 8857, 2140, 7252, 2338,
  6275, 8888, 3831, 6649, 6965, 8472, 3011, 2890,
  6487, 6297, 3393, 9052,  561, 1422, 2066, 9373,
  6817, 2484, 2306, 1886, 4992, 2329, 4220, 6721
].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk = Image.new( 38+4, 38+4 )
  punk.compose!( frame, 2, 2 )
  punk.compose!( Image.new( 24,24, '#638596' ), 7+2, 7+2 )  ## add non-trasparent / opaque background first
  punk.compose!( frameless, 7+2, 7+2 )

  composite << punk
end


composite.save( "./i/thirty_two_punks.png" )
composite.zoom(2).save( "./i/thirty_two_punks@2.png" )
composite.zoom(4).save( "./i/thirty_two_punks@4x.png" )
composite.zoom(8).save( "./i/thirty_two_punks@8x.png" )


puts "bye"

