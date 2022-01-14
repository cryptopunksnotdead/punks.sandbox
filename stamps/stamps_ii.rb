require 'pixelart'


composite = ImageComposite.new( 5, 6, width: 34, height: 34 )


stamps = [
  ['stamp-26x26',      26, [1,1]],
  ['stamp-25x25_(2)',  25, [1,0]],
  ['stamp-25x25_(3)',  25, [1,0]],
  ['stamp-25x25_(4)',  25, [1,0]],
  ['stamp-24x24_(5)',  24, [0,0]],
]


def add_stamps( composite, stamps,
                color1, color2=color1,
                punk:
              )   ## note: color2 (defaults to color1)
  color_map = {
    '#ffffff' => 0,           # white to transparent (0)
    '#000000' => color1,      # black to <color1> e.g. white
  }

  stamps.each do |rec|
    stamp = Image.read( "./i/#{rec[0]}.png" )

    stamp = stamp.change_colors( color_map )

    img = Image.new( 34, 34, '#000000' )
    img.compose!( stamp, 2, 2)
    img.compose!( Image.new( rec[1], rec[1], color2 ), 2+2, 2+2 )
    img.compose!( punk,  2+2+rec[2][0], 2+2+rec[2][1] )

    composite << img
 end
end


def gen_palette_lighter( hex )
  ## going to white
  color = Color.parse( hex )
  h,s,l = Color.to_hsl( color )

  pp h
  pp s
  pp l

  ldiff = 1.0-(l+0.10)

  puts "  ldiff: #{ldiff}"

  colors = []
  256.times do |i|
     lnew = (l+0.10)+(ldiff*i / 256.0)
     puts "  #{i} - #{lnew}"
     colors << Color.from_hsl( h, s, lnew)
  end

  colors
end

def gen_palette( hex )
  ## from black to color
  color = Color.parse( hex )
  h,s,l = Color.to_hsl( color )

  pp h
  pp s
  pp l

  darker = 0.3    ## cut-off colors starting from black
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


def gen_palette_darker( hex )
  ## from black to color
  color = Color.parse( hex )
  h,s,l = Color.to_hsl( color )

  pp h
  pp s
  pp l

  ldiff = l-0.10

  puts "  ldiff: #{ldiff}"

  colors = []
  256.times do |i|
     lnew = (ldiff*i / 256.0)
     puts "  #{i} - #{lnew}"
     colors << Color.from_hsl( h, s, lnew)
  end

  colors
end



name = 'queen_elizabeth_ii_(3)'
# name = 'queen_nefertiti'
punk = Image.read( "../../punks.readymade/politics/#{name}.png" )


palette_lighter = gen_palette_lighter( '#638596' )
palette_med     = gen_palette( '#638596' )
palette_darker  = gen_palette_darker( '#638596' )


add_stamps( composite, stamps, '#ffffff', '#638596',  # white + blue-ish
             punk:   punk.change_palette8bit( palette_lighter )
          )
add_stamps( composite, stamps, '#638596',
             punk:   punk.change_palette8bit( palette_med )
          )


palette_lighter = gen_palette_lighter( '#ffbf00' )
palette_med     = gen_palette( '#ffbf00' )
palette_darker  = gen_palette_darker( '#ffbf00' )

add_stamps( composite, stamps, '#ffffff', '#ffbf00',   # white + blue-ish
              punk:   punk.change_palette8bit( palette_lighter )
          )
add_stamps( composite, stamps, '#ffbf00',
             punk:   punk.change_palette8bit( palette_med )
          )


palette_lighter = gen_palette_lighter( '#ff0000' )
palette_med     = gen_palette( '#ff0000' )
palette_darker  = gen_palette_darker( '#ff0000' )

add_stamps( composite, stamps, '#ffffff', '#ff0000',   # white + red
              punk:   punk.change_palette8bit( palette_lighter )
          )
add_stamps( composite, stamps, '#ff0000',
             punk:   punk.change_palette8bit( palette_med )
          )



composite.save( "./tmp/stamps_(2).png" )
composite.zoom( 4 ).save( "./tmp/stamps_(2)@4x.png" )

puts "bye"

