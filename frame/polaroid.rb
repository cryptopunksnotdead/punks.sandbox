$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'




polaroid = Image.read( "./i/polaroid24x24.png" )

polaroid.zoom( 4 ).save( "./i/polaroid24x24@4x.png" )


composite = ImageComposite.new( 2, 2, width: 34+4, height: 38+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 34, 38 )
  punk.compose!( polaroid )
  punk.compose!( Image.new( 24,24, '#638596' ), 2, 2 )  ## add non-trasparent / opaque background first
  punk.compose!( frameless, 2, 2 )

  punk.save( "./i/polaroid-#{id}.png" )
  punk.zoom(2).save( "./i/polaroid-#{id}@2x.png" )
  punk.zoom(4).save( "./i/polaroid-#{id}@4x.png" )
  punk.zoom(8).save( "./i/polaroid-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 34+4, 38+4 )
  punk_with_padding.compose!( punk, 2, 2)

  composite << punk_with_padding
end


composite.save( "./i/polaroids.png" )
composite.zoom(2).save( "./i/polaroids@2.png" )
composite.zoom(4).save( "./i/polaroids@4x.png" )
composite.zoom(8).save( "./i/polaroids@8x.png" )



puts "bye"