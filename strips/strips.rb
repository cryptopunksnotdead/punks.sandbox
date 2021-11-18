######################
#
#  create preview "strips" with 9 items for
#   the Awesome 24px page

$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



def gen_strip( path, offset: 0,
                     width: 24, height: 24 )
  punks = Punks::Image::Composite.read( path,
                                        width: width, height: height )

  strip = ImageComposite.new( 9, 1,
                              width: width, height: height )

  (offset..offset+8).each do |id|
    strip << punks[id]
  end
  strip
end


strip = gen_strip( "../../awesome-24px/collection/punkettes.png" )
strip.save( "./tmp/punkettes-strip.png" )


strip = gen_strip( "../../awesome-24px/collection/goldenpunks.png" )
strip.save( "./tmp/goldenpunks-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/halloweenpunks.png" )
strip.save( "./tmp/halloweenpunks-strip.png" )






strip = gen_strip( "../../awesome-24px/collection/pudgypenguins.png" )
strip.save( "./tmp/pudgypenguins-strip.png" )


strip = gen_strip( "../../awesome-24px/collection/apepunks.png" )
strip.save( "./tmp/apepunks-strip.png" )




strip = gen_strip( "../../awesome-24px/collection/coolcats_dragons.png" )
strip.save( "./tmp/coolcats_dragons-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/coolcats_frogs.png" )
strip.save( "./tmp/coolcats_frogs-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/coolcats_mohawks.png" )
strip.save( "./tmp/coolcats_mohawks-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/coolcats_ninjas.png" )
strip.save( "./tmp/coolcats_ninjas-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/coolcats_pirates.png" )
strip.save( "./tmp/coolcats_pirates-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/coolcats_tvheads.png" )
strip.save( "./tmp/coolcats_tvheads-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/coolcats_unicorns.png" )
strip.save( "./tmp/coolcats_unicorns-strip.png" )



strip = gen_strip( "../../awesome-24px/collection/boredapes_au.png", width: 28, height: 28 )
strip.save( "./tmp/boredapes_au-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/boredapes_red.png", width: 28, height: 28 )
strip.save( "./tmp/boredapes_red-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/boredapes_blue.png", width: 28, height: 28 )
strip.save( "./tmp/boredapes_blue-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/boredapes_acid.png", width: 28, height: 28 )
strip.save( "./tmp/boredapes_acid-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/boredapes_stars_and_stripes.png", width: 28, height: 28 )
strip.save( "./tmp/boredapes_stars_and_strips-strip.png" )

strip = gen_strip( "../../awesome-24px/collection/boredapes_neon_glow.png", width: 28, height: 28 )
strip.save( "./tmp/boredapes_neon_glow-strip.png" )




strip = gen_strip( "../../awesome-24px/collection/boredapes.png", width: 28, height: 28 )
strip.save( "./tmp/boredapes-strip.png" )


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
