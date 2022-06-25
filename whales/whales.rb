require 'pixelart'
require 'backgrounds'


whale   = Image.read( "./whale-24x24.png")

whales_i = ImageComposite.new( 2, 2 )

whales_i << whale.background( 'white' )
whales_i << whale.background( '#638596' ).mirror
whales_i << whale.background( 'pride' )
whales_i << whale.background( 'ukraine' )


whales_i.save( "./tmp/whales_vol1.png" )
whales_i.zoom(2).save( "./tmp/whales_vol1@2x.png" )
whales_i.zoom(8).save( "./tmp/whales_vol1@8x.png" )



YELLOW = '#ffff00'
GREEN  = '#00ff00'
RED    = '#ff0000'
BLUE   = '#0000ff'

WHALE2X = Image.read( "./whale-24x24@2x.png")

TOPHAT   = Image.read( "./attributes/tophat-48x48.png" )
BEANIE   = Image.read( "./attributes/beanie-48x48.png" )
HEADBAND = Image.read( "./attributes/headband-48x48.png" )
CAP      = Image.read( "./attributes/cap-48x48.png" )


def gen_whale2x( *attributes )
   whale = Image.new( 48, 48 )
   whale.compose!( WHALE2X )
   attributes.each do |attribute|
     whale.compose!( attribute )
   end
   whale
end



whales_ii = ImageComposite.new( 2, 2,
                                  width:  48,
                                  height: 48,
                                  background: [YELLOW, GREEN, RED, BLUE] )

whales_ii << gen_whale2x( CAP )
whales_ii << gen_whale2x( HEADBAND )
whales_ii << gen_whale2x( TOPHAT )
whales_ii << gen_whale2x( BEANIE )

whales_ii.save( "./tmp/whales_vol2.png" )
whales_ii.zoom(4).save( "./tmp/whales_vol2@4x.png" )



composite = ImageComposite.new( 2, 1, width: 96,
                                      height: 96)
composite << whales_i.zoom(2)
composite << whales_ii

composite.save( "./tmp/whales.png" )
composite.zoom(3).save( "./tmp/whalesg@3x.png" )


puts "bye"

