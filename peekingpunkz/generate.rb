###########
#   Phree Peeking Punkz!
#
#  to run use:
#    ruby ./generate.rb

$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'


## read in right-facing punk composite
print "==> loading right-facing image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"


## 10x10 = 100 punks (cols x rows); create an empty composite
##    punkz with background (use solid blue-ish color for now)
punkz = ImageComposite.new( 10, 10, background: '#638596' )

punks.each_with_index do |punk,i|
  break if i >= 100

  punkz << punk.rotate_counter_clockwise    # rotate left 90 degrees
end


print "==> saving peeking punkz image..."
punkz.save( "./tmp/punkz.png" )
punkz.zoom( 2 ).save( "./tmp/punkz@2x.png" )
punkz.zoom( 4 ).save( "./tmp/punkz@4x.png" )
print "OK\n"


puts "bye"

