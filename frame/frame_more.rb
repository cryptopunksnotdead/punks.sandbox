$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'




frame = Image.read( "./i/frame24x24_(4).png" ) ## "wood" frame in 38x36

frame.zoom( 4 ).save( "./i/frame24x24_(4)@4x.png" )


composite = ImageComposite.new( 2, 2, width: 38+4, height: 36+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 38, 36 )
  punk.compose!( Image.new( 24,24, '#ffbf00' ), 7, 6 )  ## add non-trasparent / opaque background first
  punk.compose!( frame )
  punk.compose!( frameless, 7, 6 )

  punk.save( "./i/framedpunk_(4)-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk_(4)-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk_(4)-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk_(4)-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 38+4, 36+4 )
  punk_with_padding.compose!( punk, 2, 2)

  composite << punk_with_padding
end


composite.save( "./i/framedpunks_(4).png" )
composite.zoom(2).save( "./i/framedpunks_(4)@2.png" )
composite.zoom(4).save( "./i/framedpunks_(4)@4x.png" )
composite.zoom(8).save( "./i/framedpunks_(4)@8x.png" )





frame = Image.read( "./i/frame24x24_(2).png" ) ## "wood" frame in 32x32

frame.zoom( 4 ).save( "./i/frame24x24_(2)@4x.png" )


composite = ImageComposite.new( 2, 2, width: 32+4, height: 32+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 32, 32 )
  punk.compose!( Image.new( 24,24, '#ffbf00' ), 4, 4 )  ## add non-trasparent / opaque background first
  punk.compose!( frame )
  punk.compose!( frameless, 4, 4 )

  punk.save( "./i/framedpunk_(2)-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk_(2)-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk_(2)-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk_(2)-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 32+4, 32+4 )
  punk_with_padding.compose!( punk, 2, 2)

  composite << punk_with_padding
end


composite.save( "./i/framedpunks_(2).png" )
composite.zoom(2).save( "./i/framedpunks_(2)@2.png" )
composite.zoom(4).save( "./i/framedpunks_(2)@4x.png" )
composite.zoom(8).save( "./i/framedpunks_(2)@8x.png" )







frame = Image.read( "./i/frame24x24_(3).png" ) ## "jugenstil" frame in 34x32

frame.zoom( 4 ).save( "./i/frame24x24_(3)@4x.png" )


composite = ImageComposite.new( 2, 2, width: 34+4, height: 32+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 34, 32 )
  punk.compose!( Image.new( 24,24, '#52bbfe' ), 5, 4 )  ## add non-trasparent / opaque background first
  punk.compose!( frame )
  punk.compose!( frameless, 5, 4 )

  punk.save( "./i/framedpunk_(3)-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk_(3)-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk_(3)-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk_(3)-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 34+4, 32+4 )
  punk_with_padding.compose!( punk, 2, 2)

  composite << punk_with_padding
end


composite.save( "./i/framedpunks_(3).png" )
composite.zoom(2).save( "./i/framedpunks_(3)@2.png" )
composite.zoom(4).save( "./i/framedpunks_(3)@4x.png" )
composite.zoom(8).save( "./i/framedpunks_(3)@8x.png" )




puts "bye"