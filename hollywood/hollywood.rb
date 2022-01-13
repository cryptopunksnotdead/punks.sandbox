require 'pixelart'



film35mm = Image.read( "./i/film35mm-26x24.png" )



strip = ImageComposite.new( 3, 1,
                            width: film35mm.width,
                            height: film35mm.height )


[
  'audrey_hepburn_(3)',
  'marilyn_monroe_(4)',
  'mary_j_blige',
].each do |name|
   puts "   reading #{name}..."
   punk = Image.read( "../../punks.readymade/cinema_I_actors/#{name}.png" )
   puts "  #{punk.width}x#{punk.height}"

   img = Image.new( film35mm.width, film35mm.height )
   img.compose!( film35mm )
   img.compose!( Image.new( 26, 24, '#638596' ), 1, 5 )  ## use solid blue-ish background
   img.compose!( punk, 2, 5 )

   strip << img
end


strip.save( "./tmp/filmstrip.png" )
strip.zoom( 4 ).save( "./tmp/filmstrip@4x.png" )
strip.zoom( 8 ).save( "./tmp/filmstrip@8x.png" )


puts "bye"