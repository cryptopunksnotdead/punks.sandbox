############
#  generate images using the CryptoPunksData
#
#  to run use:
#    $ ruby ./asset_to_image.rb



require 'pixelart'


require_relative 'punksdata'        ## pull in colors & assets


hex = COLORS_ENCODED
colors = decode_colors( hex )



## asset #18 - Clown Nose
hex = '6726f0'
image = decode_image( hex, colors: colors )

image.save( "./i/018-clown_nose.png" )
image.zoom(4).save( "./i/018-clown_nosex4.png" )


## asset #21 - Regular Shades
hex = '25000835000a45000a46000d55000a56000765000a75000a76000d85000a860007'
image = decode_image( hex, colors: colors )

image.save( "./i/021-regular_shades.png" )
image.zoom(4).save( "./i/021-regular_shadesx4.png" )


## asset #1 - Male 1
hex = '26000c2700043301863401c33501c33601f03701c33801c33901c33a01c33b01c342000a4302804301704402104401e04503804501704601b44701f04801f04901f04a01f04b01f052000a5301f05401f05503205501d05604105601e05701f05801f05901b45a015a5b000362000a6301f06401f06501f06601f067015a6801f06901a56a015a7200027301b47401f07503a07501507604417601a07701f07801f07901f07a0116830002840003850003860003870003880003890003'
image = decode_image( hex, colors: colors )

image.save( "./i/001-male_1.png" )
image.zoom(4).save( "./i/001-male_1x4.png" )


## asset #22 - Knitted Cap
hex = '24000c332b80342c70342b80432bf0442c70442b80532bf0542c70542b80632bf0642c70642b80732bb0742c70742b80842c3c'
image = decode_image( hex, colors: colors )

image.save( "./i/022-knitted_cap.png" )
image.zoom(4).save( "./i/022-knitted_capx4.png" )


puts "bye"


