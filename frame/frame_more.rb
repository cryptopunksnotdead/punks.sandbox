$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


frame = Image.read( "./i/frame24x24_(8).png" ) ## frame in 38x38

frame.zoom( 4 ).save( "./i/frame24x24_(8)@4x.png" )


composite = ImageComposite.new( 2, 2, width: 38+4, height: 38+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 38, 38 )
  punk.compose!( Image.new( 24,24, '#638596' ), 7, 7 )  ## add non-trasparent / opaque background first
  punk.compose!( frame )
  punk.compose!( frameless, 7, 7 )

  punk.save( "./i/framedpunk_(8)-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk_(8)-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk_(8)-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk_(8)-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 38+4, 38+4 )
  punk_with_padding.compose!( punk, 2, 2 )

  composite << punk_with_padding
end


composite.save( "./i/framedpunks_(8).png" )
composite.zoom(2).save( "./i/framedpunks_(8)@2.png" )
composite.zoom(4).save( "./i/framedpunks_(8)@4x.png" )
composite.zoom(8).save( "./i/framedpunks_(8)@8x.png" )





frame = Image.read( "./i/frame24x24_(7).png" ) ## frame in 30x29

frame.zoom( 4 ).save( "./i/frame24x24_(7)@4x.png" )


composite = ImageComposite.new( 2, 2, width: 30+4, height: 29+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 30, 29 )
  punk.compose!( frame )
  punk.compose!( frameless.change_palette8bit( Palette8bit::SEPIA ), 3, 3 )

  punk.save( "./i/framedpunk_(7)-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk_(7)-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk_(7)-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk_(7)-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 30+4, 29+4 )
  punk_with_padding.compose!( punk, 2, 2 )

  composite << punk_with_padding
end


composite.save( "./i/framedpunks_(7).png" )
composite.zoom(2).save( "./i/framedpunks_(7)@2.png" )
composite.zoom(4).save( "./i/framedpunks_(7)@4x.png" )
composite.zoom(8).save( "./i/framedpunks_(7)@8x.png" )





frame = Image.read( "./i/frame24x24_(6).png" ) ## frame in 34x34

frame.zoom( 4 ).save( "./i/frame24x24_(6)@4x.png" )


composite = ImageComposite.new( 2, 2, width: 34+4, height: 34+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 34, 34 )
  punk.compose!( Image.new( 24,24, '#ffbf00' ), 5, 5 )  ## add non-trasparent / opaque background first
  punk.compose!( frame )
  punk.compose!( frameless, 5, 5 )

  punk.save( "./i/framedpunk_(6)-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk_(6)-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk_(6)-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk_(6)-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 34+4, 34+4 )
  punk_with_padding.compose!( punk, 2, 2 )

  composite << punk_with_padding
end


composite.save( "./i/framedpunks_(6).png" )
composite.zoom(2).save( "./i/framedpunks_(6)@2.png" )
composite.zoom(4).save( "./i/framedpunks_(6)@4x.png" )
composite.zoom(8).save( "./i/framedpunks_(6)@8x.png" )




frame = Image.read( "./i/frame24x24_(5).png" ) ## frame in 35x32

frame.zoom( 4 ).save( "./i/frame24x24_(5)@4x.png" )


composite = ImageComposite.new( 2, 2, width: 35+4, height: 32+4 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 35, 32 )
  punk.compose!( Image.new( 24,24, '#ffbf00' ), 5, 4 )  ## add non-trasparent / opaque background first
  punk.compose!( frame )
  punk.compose!( frameless, 5, 4 )

  punk.save( "./i/framedpunk_(5)-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk_(5)-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk_(5)-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk_(5)-#{id}@8x.png" )

  ## add 4px (2p on each side transparent padding/border)
  punk_with_padding = Image.new( 35+4, 32+4 )
  punk_with_padding.compose!( punk, 2, 2 )

  composite << punk_with_padding
end


composite.save( "./i/framedpunks_(5).png" )
composite.zoom(2).save( "./i/framedpunks_(5)@2.png" )
composite.zoom(4).save( "./i/framedpunks_(5)@4x.png" )
composite.zoom(8).save( "./i/framedpunks_(5)@8x.png" )





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