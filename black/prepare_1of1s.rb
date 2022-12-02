require 'pixelart'


names = %w[
  punk1
  punk2
]


def dump_colors( img )
  colors = img.pixels.uniq
  puts " #{colors.size} color(s):"
  colors.each_with_index do |color,i|
    print "#{i+1}: "
    print Color.format( color )
    print "\n"
  end
end

names.each do |name|
  puts
  puts "==> #{name}:"

  img = Image.read( "./i/#{name}.png")

  img.zoom(2).save( "./i/#{name}@2x.png" )
  img.zoom(4).save( "./i/#{name}@4x.png" )
  img.zoom(6).save( "./i/#{name}@6x.png" )

  dump_colors( img )
end


puts "bye"