require 'pixelart'


def gen_palette( hex )
  ## from black to color
  color = Color.parse( hex )
  h,s,l = Color.to_hsl( color )

  pp h
  pp s
  pp l

  darker = 0.25    ## cut-off colors starting from black
  lighter = 0.05   ## cut-off colors starting from white

  ldiff = (1.0 - darker - lighter)

  puts "  ldiff: #{ldiff}"

  colors = []
  256.times do |i|
     lnew = darker+(ldiff*i / 256.0)
     puts "  #{i} - #{lnew}"
     colors << Color.from_hsl( h, s, lnew)
  end

  colors
end


puts "colors:"
puts Color.format( Color.parse(  '#536140' ))
#=>  #536140 / rgb( 83  97  64) - hsl( 85°  20%  32%)


palette = gen_palette( '#536140' )




frame = Image.read( "./dollar.png" )
puts "   #{frame.width}x#{frame.height}"



composite = ImageComposite.new( 3, 4, width: frame.width+4,
                                      height: frame.height+4,
                                      background: '#000000' )


ids = [561, 2890, 3100, 4992, 7252, 7804, 8219, 8857, 8888, 9052, 10180, 10190]


ids.each do |id|
  punk  = Image.read( "./i/punk-#{id}.png" )

  dollar = Image.new( frame.width, frame.height )
  dollar.compose!( frame )
  dollar.compose!( punk, 16, 0 )
  dollar.save( "./tmp/dollar-#{id}.png" )
  dollar.zoom(4).save( "./tmp/dollar-#{id}@4x.png" )

  dollar = Image.new( frame.width, frame.height )
  dollar.compose!( frame )
  dollar.compose!( punk.change_palette8bit( palette ), 16, 0 )
  dollar.save( "./tmp/dollar-#{id}_(2).png" )
  dollar.zoom(4).save( "./tmp/dollar-#{id}_(2)@4x.png" )

  tile = Image.new( frame.width+4, frame.height+4 )
  tile.compose!( dollar, 2, 2 )  ## add 2/2 padding
  composite << tile
end


composite.save( "./tmp/dollars.png" )
composite.zoom(4).save( "./tmp/dollars@4x.png" )


puts "bye"
