#########################
#  glory to ukraine! fuck (vladimir) putin! stop the war!
#

require 'pixelart'


## make ukraine flag (background image 24x24)

UKRAINE_BLUE   = '#0057b7'   # rgb( 0, 87, 183 )
UKRAINE_YELLOW = '#ffdd00'   # rgb( 255, 221, 0)


flag = Image.new( 24, 24 )
flag.compose!( Image.new( 24, 12, UKRAINE_BLUE ) )
flag.compose!( Image.new( 24, 12, UKRAINE_YELLOW ), 0, 12 )

flag.save( './tmp/flag.png' )
flag.zoom(4).save( './tmp/flag@4x.png' )





## read in right-facing punk composite
print "==> loading right-facing image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"


## lets do a 10x10 grid with a 100 punks preview
ukraine_punks = ImageComposite.new( 10, 10 )

punks.each_with_index do |base,i|
  punk = Image.new( 24, 24 )
  punk.compose!( flag )
  punk.compose!( base )

  ukraine_punks << punk.mirror     # mirror, that is, flip image vertically (right-facing to left-facing)

  break if i >= 99
end


print "==> saving left-facing image..."
ukraine_punks.save( "./tmp/glorytoukrainepunks.png" )
ukraine_punks.zoom(3).save( "./tmp/glorytoukrainepunks@3x.png" )
print "OK\n"


puts "bye"



