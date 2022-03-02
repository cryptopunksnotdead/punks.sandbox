require 'pixelart'



## ukraine flag colors

UKRAINE_BLUE   = '#0057b7'   # rgb( 0, 87, 183 )
UKRAINE_YELLOW = '#ffdd00'   # rgb( 255, 221, 0)


## read in right-facing punk composite
print "==> loading right-facing image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"



## lets do a 3x2 grid with a 6 silhouette punks
ukraine_punks = ImageComposite.new( 3, 2 )

punks.each_with_index do |base,i|
   background,
   foreground   =  (i % 2 == 0) ? [UKRAINE_BLUE, UKRAINE_YELLOW] : [UKRAINE_YELLOW, UKRAINE_BLUE]

   punk = Image.new( 24, 24, background )
   punk.compose!( base.silhouette( foreground ) )

   ukraine_punks << punk.mirror     # mirror, that is, flip image vertically (right-facing to left-facing)

   break if i >= 5
end


print "==> saving left-facing image..."
ukraine_punks.save( "./tmp/glorytoukrainepunks-silhouette.png" )
ukraine_punks.zoom(4).save( "./tmp/glorytoukrainepunks-silhouette@4x.png" )
ukraine_punks.zoom(8).save( "./tmp/glorytoukrainepunks-silhouette@8x.png" )
print "OK\n"


puts "bye"
