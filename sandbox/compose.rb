require 'pixelart'

####
# specs:  126x87  - inner rectangle
#        x/y offset - 39x8



frame = Image.read( 'i/frame-museum.png' )
punk  = Image.read( 'i/punk-24x24.png' )

punk.zoom(3).save( 'i/punk-24x24@3x.png' )
punk.zoom(4).save( 'i/punk-24x24@4x.png' )




composite = ImageComposite.new( 1, 3, width: frame.width,
                                      height: frame.height )


pic = Image.new( frame.width, frame.height )
pic.compose!( frame )
pic.compose!( punk.zoom( 3 ), 65, 11 )
pic.save( "i/museum-24px@3x.png")

composite << pic


pic = Image.new( frame.width, frame.height )
pic.compose!( frame )
pic.compose!( punk, 93, 39 )
pic.save( 'i/museum-24px.png')

composite << pic


pic = Image.new( frame.width, frame.height )
pic.compose!( frame )
pic.compose!( Image.new( 1, 1, '#000000'), 100, 53 )
pic.save( 'i/museum.png')

composite << pic


composite.save( "i/museum-triple.png" )


puts "bye"