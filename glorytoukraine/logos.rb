#########################
#  glory to ukraine! fuck (vladimir) putin! stop the war!
#
#   change black/white logo to brackground with ukraine flag

require 'pixelart'



logo = Image.read( './i/punksnotdead.png' )


###
#  step 1:  make white & white-ish background transparent
#  step 2:  make black & black-ish foreground all black
#  step 3:  add ukraine flag background


logo_ukraine = logo.transparent( fuzzy: true ).silhouette.ukraine
logo_ukraine.save( './i/punksnotdead-saveukraine.png' )



###
#  try a variant with white foreground color
logo_ukraine = logo.transparent( fuzzy: true ).silhouette( '#ffffff' ).ukraine
logo_ukraine.save( './i/punksnotdead-saveukraine-ii.png' )


###
#  try a "two-color" variant with blue background and yellow foreground

## ukraine flag colors
UKRAINE_BLUE   = '#0057b7'   # rgb( 0, 87, 183 )
UKRAINE_YELLOW = '#ffdd00'   # rgb( 255, 221, 0)



# logo_ukraine = logo.transparent( fuzzy: true ).
#                    silhouette( UKRAINE_YELLOW ).
#                     background( UKRAINE_BLUE )       -- check why background not available???

logo_ukraine = Image.new( logo.width, logo.height, UKRAINE_BLUE )
logo_ukraine.compose!( logo.transparent( fuzzy: true ).
                            silhouette( UKRAINE_YELLOW ))

logo_ukraine.save( './i/punksnotdead-saveukraine-iii.png' )


logo_ukraine = Image.new( logo.width, logo.height, UKRAINE_YELLOW )
logo_ukraine.compose!( logo.transparent( fuzzy: true ).
                            silhouette( UKRAINE_BLUE ))

logo_ukraine.save( './i/punksnotdead-saveukraine-iiii.png' )



#####
#  try The World Factbook logo
#
#  note: to place text better on flag background
#             cut-off top 15px

logo_uncut = Image.read( './i/theworldfactbook.png' )

logo = Image.new( logo_uncut.width, logo_uncut.height )
logo.compose!( logo_uncut.crop( 0, 15, logo_uncut.width, logo_uncut.height-15 ) )

logo_ukraine = logo.transparent.silhouette.ukraine
logo_ukraine.save( './i/theworldfactbook-saveukraine.png' )


## try two-color variant
logo_ukraine = Image.new( logo.width, logo.height, UKRAINE_BLUE )
logo_ukraine.compose!( logo.transparent.
                            silhouette( UKRAINE_YELLOW ))

logo_ukraine.save( './i/theworldfactbook-saveukraine-ii.png' )


#####
#  try Open Blockchains logo

logo = Image.read( './i/openblockchains.png' )

logo_ukraine = logo.transparent.silhouette.ukraine
logo_ukraine.save( './i/openblockchains-saveukraine.png' )


## try two-color variant
logo_ukraine = Image.new( logo.width, logo.height, UKRAINE_BLUE )
logo_ukraine.compose!( logo.transparent.
                            silhouette( UKRAINE_YELLOW ))

logo_ukraine.save( './i/openblockchains-saveukraine-ii.png' )



puts "bye"

