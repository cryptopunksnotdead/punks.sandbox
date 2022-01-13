require 'pixelart'


composite = ImageComposite.new( 5, 4, width: 34, height: 34 )


stamps = [
  ['stamp-26x26',      26],
  ['stamp-25x25_(2)',  25],
  ['stamp-25x25_(3)',  25],
  ['stamp-25x25_(4)',  25],
  ['stamp-24x24_(5)',  24],
]


def add_stamps( composite, stamps,
                color1, color2=color1 )   ## note: color2 (defaults to color1)
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

    composite << img
 end
end


add_stamps( composite, stamps, '#ffffff', '#638596' )   # white + blue-ish
add_stamps( composite, stamps, '#638596'  )

add_stamps( composite, stamps, '#ffffff', '#ffbf00' )   # white + blue-ish
add_stamps( composite, stamps, '#ffbf00'  )




composite.save( "./tmp/stamps.png" )
composite.zoom( 4 ).save( "./tmp/stamps@4x.png" )

puts "bye"

