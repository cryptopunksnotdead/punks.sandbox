$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'







frame = Image.read( "./i/frame_black24x24.png" )



frame.zoom( 4 ).save( "./i/frame_black24x24@4x.png" )



composite = ImageComposite.new( 2, 2, width: 38+4, height: 38+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 38, 38 )
  punk.compose!( frame )
  punk.compose!( Image.new( 24,24, '#638596' ), 7, 7 )  ## add non-trasparent / opaque background first
  punk.compose!( frameless, 7, 7 )

  punk.save( "./i/framedpunk_black-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk_black-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk_black-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk_black-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 38+4, 38+4 )
  punk_with_padding.compose!( punk, 2, 2)

  composite << punk_with_padding
end


composite.save( "./i/framedpunks_black.png" )
composite.zoom(2).save( "./i/framedpunks_black@2.png" )
composite.zoom(4).save( "./i/framedpunks_black@4x.png" )
composite.zoom(8).save( "./i/framedpunks_black@8x.png" )



puts "bye"