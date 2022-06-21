

require 'pixelart'


tulip = Image.read( './i/tulip24x24.png' )


####
#  analyze tulip colors in use
#
pp tulip.pixels.count         # total pixels - 24×24
#=>  576
pp tulip.pixels.uniq.count    # total colors - unique colored pixels
#=>  5

pp tulip.pixels.uniq
#=> [0, 2566966527, 3429289215, 1644193279, 968314111]

tulip.pixels.uniq.each_with_index do |color, i|
  hex = Color.to_hex( color )   # rgba in hex (string format)
  hsl = Color.to_hsl( color )
  print "[#{i}]  "
  print hex
  print "  "
  print   hsl.inspect
  print "\n"
end

# color in use:
# - tranparent  [0]  #00000000
#
# - lighter    [1]  #cc66ccff  [300, 0.50, 0.60]
# - color      [2]  #9900ccff  [285, 1.0, 0.4]
# - darker     [3]  #620065ff  [298, 1.0, 0.2]
#
# - green [4]  #39b74cff  [129, 0.5, 0.47]




############################
#  generate tulips  with different color schemes

hues = [
 270, 280, 300, 320, 330, 350,
 0, 30, 40, 60
].reverse



tulips = ImageComposite.new( hues.size, 3,
                              width: 38+4,
                              height: 38+4 )

puts " #{hues.size*3} tulip(s)"
puts


FRAME = Image.read( "../frame/i/frame_black24x24.png" )

def make_framed( tulip )
  framed = Image.new( 38, 38 )
  framed.compose!( FRAME )
  framed.compose!( Image.new( 24,24, '#638596' ), 7, 7 )  ## add non-trasparent / opaque background first
  framed.compose!( tulip, 7, 7 )

  ## add 4px (2p on each side transparent padding/border)
  framed_with_padding = Image.new( 38+4, 38+4 )
  framed_with_padding.compose!( framed, 2, 2)
  framed_with_padding
end

hues.each do |hue|
    color_map = {
      '#cc66ccff' => [hue, 0.9, 0.8],    # lighter
      '#9900ccff' => [hue, 1.0, 0.5],
      '#620065ff' => [hue, 1.0, 0.35 ],   # darker
     }

     new_tulip = tulip.change_colors( color_map )
     new_tulip.save( "./tmp/tulip_#{hue}.png")
     new_tulip.zoom( 3 ).save( "./tmp/tulip_#{hue}@x3.png")

     tulips << make_framed( new_tulip )
end



base = tulip
tulip = Image.new( 24, 24, '#638596' )
tulip.compose!( base )


hues.each do |hue|
  color_map = {
    '#cc66ccff' => [hue,  1.0, 0.5],    # darker
    '#9900ccff' => [hue,   1.0, 0.35 ],
    '#620065ff' => [hue, 0.9, 0.8],      # lighter
   }

   new_tulip = tulip.change_colors( color_map )
   new_tulip.save( "./tmp/tulip_#{hue}-ii.png")
   new_tulip.zoom( 3 ).save( "./tmp/tulip_#{hue}-ii@x3.png")

   tulips << make_framed( new_tulip )
end


hues.each do |hue|
  color_map = {
    '#cc66ccff' => '#FFE6E6',
    '#9900ccff' => [hue,  1.0, 0.5 ],
    '#620065ff' => [hue, 1.0, 0.35], # darker
   }

   new_tulip = tulip.change_colors( color_map )
   new_tulip.save( "./tmp/tulip_#{hue}-iii.png")
   new_tulip.zoom( 3 ).save( "./tmp/tulip_#{hue}-iii@x3.png")

   tulips << make_framed( new_tulip )
end




tulips.save( "./tmp/tulips.png" )
tulips.zoom(2).save( "./tmp/tulips@2x.png" )
tulips.zoom(4).save( "./tmp/tulips@4x.png" )



puts "bye"



