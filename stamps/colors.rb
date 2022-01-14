require 'pixelart'


punk = Image.read( "../../punks.readymade/politics/queen_elizabeth_ii_(3).png" )

colors = punk.pixels.uniq

puts "  #{colors.size} color(s)"
#=> 28 colors

colors = punk.grayscale.pixels.uniq

puts "  #{colors.size} color(s):"
#=> 12 colors
pp colors
colors.each do |color|
  puts Color.format( color )
end


puts
puts "color blueish - 638596"
puts Color.format( Color.parse( '#638596') )

puts "color amberish - FFBF00"
puts Color.format( Color.parse( '#FFBF00') )


punk.grayscale.zoom( 4 ).save( "./tmp/queen_eli@4x.png" )

puts "bye"


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

def gen_palette_darker( hex )
  ## from black to color
  color = Color.parse( hex )
  h,s,l = Color.to_hsl( color )

  pp h
  pp s
  pp l

  ldiff = l

  puts "  ldiff: #{ldiff}"

  colors = []
  256.times do |i|
     lnew = (ldiff*i / 256.0)
     puts "  #{i} - #{lnew}"
     colors << Color.from_hsl( h, s, lnew)
  end

  colors
end


colors = gen_palette_lighter( '#638596' )
## pp colors

img = ImagePalette8bit.new( colors, size: 16 )
img.save( "./tmp/color-palette-white.png" )


# img = ImagePalette8bit.new( Palette8bit::GRAYSCALE, size: 16 )
# img.save( "./tmp/color-palette-grayscale.png" )


punk_ii = punk.change_palette8bit( colors )
punk_ii.zoom(4).save( "./tmp/punk_(2)@4x.png")


colors = gen_palette_darker( '#638596' )
## pp colors

img = ImagePalette8bit.new( colors, size: 16 )
img.save( "./tmp/color-palette-black.png" )

punk_ii = punk.change_palette8bit( colors )
punk_ii.zoom(4).save( "./tmp/punk_(3)@4x.png")




__END__

color blueish
   #638596 / rgb( 99 133 150) - hsl(200°  20%  49%)
   200
   0.20481927710843373
   0.4882352941176471

color amberish
   #ffbf00 / rgb(255 191   0) - hsl( 45° 100%  50%)

