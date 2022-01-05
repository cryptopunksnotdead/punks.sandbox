require 'pixelart'



ids = [531, 901, 771, 400, 700, 871,
       501, 301, 976, 850, 300, 51]

punks = ImageComposite.read( "../../programming-cryptopunks/i/morepunks.png" )



frame = Image.read( "./i/frame_black24x24_(2).png" )


composite = ImageComposite.new( 4, 3, width: 30+4, height: 30+4 )


ids.each do |id|
  frameless = punks[ id-1]

  ## add 4px (2p on each side transparent padding/border)
  punk = Image.new( 30+4, 30+4 )
  punk.compose!( frame, 2, 2 )
  punk.compose!( Image.new( 24,24, '#ffffff' ), 3+2, 3+2 )  ## add non-trasparent / opaque background first
  punk.compose!( frameless, 3+2, 3+2 )

  composite << punk
end


composite.save( "./i/twelve_more_punks.png" )
composite.zoom(2).save( "./i/twelve_more_punks@2x.png" )
composite.zoom(4).save( "./i/twelve_more_punks@4x.png" )
composite.zoom(8).save( "./i/twelve_more_punks@8x.png" )


puts "bye"
