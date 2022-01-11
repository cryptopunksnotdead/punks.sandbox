

## pull in meta (data records)
require_relative '../punksdata/punksdata'

colors = decode_colors( COLORS_ENCODED )

pp colors
puts " #{colors.size} color(s)"
#=>  120 color(s)


## pretty print colors / palette
puts "  #{colors.size} color(s):"     #=> 120 color(s)

colors.each_with_index do |color,i|
  print "color #{'%-3d' % i} - "
  print Color.format( color )
  print "\n"
end


###
## generate color palette
##  and color images

img = ImagePalette8bit.new( colors, size: 16 )
img.save( "./i/color-palette.png" )


colors.each_with_index do |color,i|

  ## note: note: starts with 0 - (color #0 - black, and so on)
  img = Image.new( 24, 24, color )
  img.save( "./i/color-#{'%03d' % i }.png")
end




puts "bye"
