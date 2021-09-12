require 'pixelart'


require_relative 'punksdata'        ## pull in colors


hex = COLORS_ENCODED
colors = decode_colors( hex )


## pretty print colors / palette
puts "  #{colors.size} color(s):"    #=> 120 color(s)

colors.each_with_index do |color,i|
  print "color #{'%-3d' % i} - "
  print Color.format( color )
  print "\n"
end

puts "bye"

