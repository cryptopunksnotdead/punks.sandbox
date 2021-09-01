######################
#
#  create preview "strips" with 9 items for
#   the Awesome 24px page

$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



def gen_strip( path, offset: 0 )
  punks = Punks::Image::Composite.read( path )

  strip = ImageComposite.new( 9, 1 )

  (offset..offset+8).each do |id|
    strip << punks[id]
  end
  strip
end


strip = gen_strip( "../../awesome-24px/collection/coolcats.png" )
strip.save( "./tmp/coolcats-strip.png" )




strip = gen_strip( "../../awesome-24px/collection/intlpunks.png" )
strip.save( "./tmp/intlpunks-strip.png" )



strip = gen_strip( "../../awesome-24px/collection/avalanchepunks.png", offset: 13 )
strip.save( "./tmp/avalanchepunks-strip.png" )



strip = gen_strip( "../../programming-cryptopunks/i/dodge.png" )
strip.save( "./tmp/dodge-strip.png" )


strip = gen_strip( "../../programming-cryptopunks/i/punkrocks.png" )
strip.save( "./tmp/punkrocks-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/rocks.png" )
strip.save( "./tmp/rocks-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/tulips.png" )
strip.save( "./tmp/tulips-strip.png" )



strip = gen_strip( "../../programming-cryptopunks/punks.png" )
strip.save( "./tmp/punks-strip.png" )

strip = gen_strip( "../grayscale/i/punks_grayscale.png" )
strip.save( "./tmp/punks_grayscale-strip.png" )

strip = gen_strip( "../grayscale/i/punks_sepia.png" )
strip.save( "./tmp/punks_sepia-strip.png" )

strip = gen_strip( "../../programming-cryptopunks/i/phunks.png" )
strip.save( "./tmp/phunks-strip.png" )


strip = gen_strip( "../../programming-cryptopunks/i/aliens.png" )
strip.save( "./tmp/aliens-strip.png" )

strip = gen_strip( "../../programming-cryptopunks/i/apes.png" )
strip.save( "./tmp/apes-strip.png" )

strip = gen_strip( "../../programming-cryptopunks/i/zombies.png" )
strip.save( "./tmp/zombies-strip.png" )

strip = gen_strip( "../../programming-cryptopunks/i/blondies.png" )
strip.save( "./tmp/blondies-strip.png" )

strip = gen_strip( "../../programming-cryptopunks/i/mohawks.png" )
strip.save( "./tmp/mohawks-strip.png" )


strip = gen_strip( "../../programming-cryptopunks/i/frontpunks.png" )
strip.save( "./tmp/frontpunks-strip.png" )


strip = gen_strip( "../../programming-cryptopunks/i/morepunks.png" )
strip.save( "./tmp/morepunks-strip.png" )

strip = gen_strip( "../../programming-cryptopunks/i/expansionpunks.png" )
strip.save( "./tmp/expansionpunks-strip.png" )

strip = gen_strip( "../../programming-cryptopunks/i/alienclan.png" )
strip.save( "./tmp/alienclan-strip.png" )


strip = gen_strip( "../aliens/i/aliens-randomized.png" )
strip.save( "./tmp/aliens_blue-strip.png" )

strip = gen_strip( "../aliens/i/aliens_green.png" )
strip.save( "./tmp/aliens_green-strip.png" )

strip = gen_strip( "../aliens/i/aliens_red.png" )
strip.save( "./tmp/aliens_red-strip.png" )




strip = gen_strip( "../../../cryptocopycats/awesome-mooncatrescue-bubble/i/mooncatrescue.png" )
strip.save( "./tmp/mooncatrescue-strip.png" )




puts "bye"
