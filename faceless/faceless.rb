require 'cryptopunks'





HUMAN1          = Image.read( "./i/attributes/human1.png" )
HUMAN2          = Image.read( "./i/attributes/human2.png" )
HUMAN3          = Image.read( "./i/attributes/human3.png" )
HUMAN1_ROUND    = Image.read( "./i/attributes/human1_round.png" )
HUMAN2_ROUND    = Image.read( "./i/attributes/human2_round.png" )
HUMAN3_ROUND    = Image.read( "./i/attributes/human3_round.png" )

EYES            = Image.read( "./i/attributes/eyes.png" )
EYEBROWS        = Image.read( "./i/attributes/eyebrows.png" )

NOSE            = Image.read( "./i/attributes/nose.png" )
NOSE_SMALL      = Image.read( "./i/attributes/nose_small.png" )

MOUTH           = Image.read( "./i/attributes/mouth.png" )
MOUTH1          = Image.read( "./i/attributes/mouth1.png" )
MOUTH2          = Image.read( "./i/attributes/mouth2.png" )
MOUTH3          = Image.read( "./i/attributes/mouth3.png" )


### classic attributes
EYESHADOW_GREEN = Image.read( "./i/attributes/eyeshadow_green.png" )
BLONDEBOB       = Image.read( "./i/attributes/blondebob.png" )

SMILE           = Image.read( "./i/attributes/smile.png" )
SMILE1          = Image.read( "./i/attributes/smile1.png" )
MOHAWK          = Image.read( "./i/attributes/mohawk.png" )

WILDHAIR        = Image.read( "./i/attributes/wildhair.png" )
WILDHAIR_II     = Image.read( "./i/attributes/wildhair_ii.png" )

NERDGLASSES     = Image.read( "./i/attributes/nerdglasses.png" )
PIPE            = Image.read( "./i/attributes/pipe.png" )
BIGSHADES       = Image.read( "./i/attributes/bigshades.png" )
EARRING         = Image.read( "./i/attributes/earring.png" )
GOAT            = Image.read( "./i/attributes/goat.png" )



############################
## try punk(ette) #0
punk = Image.new( 24, 24 )
punk.compose!( HUMAN2_ROUND )
punk.save( "./i/faceless0a1.png" )
punk.zoom(4).save( "./i/faceless0a1@4x.png" )

punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH2 )
punk.save( "./i/faceless0a2.png" )
punk.zoom(4).save( "./i/faceless0a2@4x.png" )


## add eyeshadow_green and blondebobe (+2px left/+2px top)
punk.compose!( EYESHADOW_GREEN )
punk.compose!( BLONDEBOB )
punk.save( "./i/faceless0.png" )
punk.zoom(4).save( "./i/faceless0@4x.png" )


#############
## try punk #1
punk = Image.new( 24, 24 )
punk.compose!( HUMAN1 )
punk.save( "./i/faceless1a1.png" )
punk.zoom(4).save( "./i/faceless1a1@4x.png" )

punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.save( "./i/faceless1a2.png" )
punk.zoom(4).save( "./i/faceless1a2@4x.png" )

## add smile and mohawk
punk.compose!( SMILE )
punk.compose!( MOHAWK )
punk.save( "./i/faceless1.png" )
punk.zoom(4).save( "./i/faceless1@4x.png" )


## try "female" style  - w/ nose (small) and face (round)
punk = Image.new( 24, 24 )
punk.compose!( HUMAN1_ROUND )
punk.save( "./i/faceless1b1.png" )
punk.zoom(4).save( "./i/faceless1b1@4x.png" )

punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH1 )
punk.save( "./i/faceless1b2.png" )
punk.zoom(4).save( "./i/faceless1b2@4x.png" )


punk.compose!( SMILE1 )
punk.compose!( MOHAWK )
punk.save( "./i/faceless1b.png" )
punk.zoom(4).save( "./i/faceless1b@4x.png" )



#############################
## try punk(ette) #2
punk = Image.new( 24, 24 )
punk.compose!( HUMAN3_ROUND )
punk.save( "./i/faceless2a1.png" )
punk.zoom(4).save( "./i/faceless2a1@4x.png" )

punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH3 )
punk.save( "./i/faceless2a2.png" )
punk.zoom(4).save( "./i/faceless2a2@4x.png" )

## add wildhair (+2px left/+2px top)
punk.compose!( WILDHAIR_II )
punk.save( "./i/faceless2.png" )
punk.zoom(4).save( "./i/faceless2@4x.png" )


# try "male" style
punk = Image.new( 24, 24 )
punk.compose!( HUMAN3 )
punk.save( "./i/faceless2b1.png" )
punk.zoom(4).save( "./i/faceless2b1@4x.png" )

punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.save( "./i/faceless2b2.png" )
punk.zoom(4).save( "./i/faceless2b2@4x.png" )

punk.compose!( WILDHAIR )
punk.save( "./i/faceless2b.png" )
punk.zoom(4).save( "./i/faceless2b@4x.png" )


##############
## try punk #3
punk = Image.new( 24, 24 )
punk.compose!( HUMAN1 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.compose!( WILDHAIR )
punk.compose!( NERDGLASSES )
punk.compose!( PIPE )
punk.save( "./i/faceless3.png" )
punk.zoom(4).save( "./i/faceless3@4x.png" )


# try "female" style
punk = Image.new( 24, 24 )
punk.compose!( HUMAN1_ROUND )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH1 )
punk.compose!( WILDHAIR_II )
punk.compose!( NERDGLASSES )
punk.compose!( PIPE )

punk.save( "./i/faceless3a.png" )
punk.zoom(4).save( "./i/faceless3a@4x.png" )


##########################
## try punk #4
punk = Image.new( 24, 24 )
punk.compose!( HUMAN2 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.compose!( WILDHAIR )
punk.compose!( BIGSHADES )
punk.compose!( EARRING )
punk.compose!( GOAT)
punk.save( "./i/faceless4.png" )
punk.zoom(4).save( "./i/faceless4@4x.png" )

# try "female" style
punk = Image.new( 24, 24 )
punk.compose!( HUMAN2_ROUND )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH2 )
punk.compose!( WILDHAIR_II )
punk.compose!( BIGSHADES )
punk.compose!( EARRING )

punk.save( "./i/faceless4a.png" )
punk.zoom(4).save( "./i/faceless4a@4x.png" )





puts "bye"