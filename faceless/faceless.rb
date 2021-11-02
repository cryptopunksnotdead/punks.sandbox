$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


MALE1          = Image.read( "./i/attributes/human-male_darker.png" )
MALE2          = Image.read( "./i/attributes/human-male_dark.png" )
MALE3          = Image.read( "./i/attributes/human-male_light.png" )
FEMALE1        = Image.read( "./i/attributes/human-female_darker.png" )
FEMALE2        = Image.read( "./i/attributes/human-female_dark.png" )
FEMALE3        = Image.read( "./i/attributes/human-female_light.png" )

EYES            = Image.read( "./i/attributes/eyes.png" )
EYEBROWS        = Image.read( "./i/attributes/eyebrows.png" )

NOSE            = Image.read( "./i/attributes/nose.png" )
NOSE_SMALL      = Image.read( "./i/attributes/nose_small.png" )

MOUTH           = Image.read( "./i/attributes/mouth.png" )
MOUTH1          = Image.read( "./i/attributes/mouth_darker.png" )
MOUTH2          = Image.read( "./i/attributes/mouth_dark.png" )
MOUTH3          = Image.read( "./i/attributes/mouth_light.png" )

SMILE1          = Image.read( "./i/attributes/smile_darker.png" )



## note: need to "stretch" by 2px female hair-dos/styles
EYESHADOW_GREEN = Punks::Sheet.find_by( name: "Green Eye Shadow", gender: 'f', size: 'l' )

BLONDEBOB       = Punks::Sheet.find_by( name: "Blonde Bob", gender: 'f', size: 'l'  )
WILDHAIR_II     = Punks::Sheet.find_by( name: "Wild Hair",  gender: 'f', size: 'l' )


### classic (male) attributes
MOHAWK          = Punks::Sheet.find_by( name: 'Mohawk', gender: 'm' )
WILDHAIR        = Punks::Sheet.find_by( name: 'Wild Hair', gender: 'm' )
NERDGLASSES     = Punks::Sheet.find_by( name: 'Nerd Glasses', gender: 'm' )
BIGSHADES       = Punks::Sheet.find_by( name: 'Big Shades', gender: 'm' )
EARRING         = Punks::Sheet.find_by( name: 'Earring', gender: 'm' )
GOAT            = Punks::Sheet.find_by( name: 'Goat', gender: 'm' )
PIPE            = Punks::Sheet.find_by( name: 'Pipe', gender: 'm' )
SMILE           = Punks::Sheet.find_by( name: 'Smile', gender: 'm' )



############################
## try punk(ette) #0
punk = Image.new( 24, 24 )
punk.compose!( FEMALE2 )
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
punk.compose!( MALE1 )
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


## try male on female design
punk = Image.new( 24, 24 )
punk.compose!( FEMALE1 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.compose!( SMILE )
punk.compose!( MOHAWK )
punk.zoom(4).save( "./i/faceless1(ii)@4x.png" )



## try "female" style  - w/ nose (small) and face (round)
punk = Image.new( 24, 24 )
punk.compose!( FEMALE1 )
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


## try female on male design
punk = Image.new( 24, 24 )
punk.compose!( MALE1 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH1 )
punk.compose!( SMILE1 )
punk.compose!( MOHAWK )
punk.zoom(4).save( "./i/faceless1b(ii)@4x.png" )




#############################
## try punk(ette) #2
punk = Image.new( 24, 24 )
punk.compose!( FEMALE3 )
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


## try female on male design
punk = Image.new( 24, 24 )
punk.compose!( MALE3 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH3 )
punk.compose!( WILDHAIR_II )
punk.zoom(4).save( "./i/faceless2(ii)@4x.png" )



# try "male" style
punk = Image.new( 24, 24 )
punk.compose!( MALE3 )
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

## try male on female
punk = Image.new( 24, 24 )
punk.compose!( FEMALE3 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.compose!( WILDHAIR )
punk.zoom(4).save( "./i/faceless2b(ii)@4x.png" )



##############
## try punk #3
punk = Image.new( 24, 24 )
punk.compose!( MALE1 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.compose!( WILDHAIR )
punk.compose!( NERDGLASSES )
punk.compose!( PIPE )
punk.save( "./i/faceless3.png" )
punk.zoom(4).save( "./i/faceless3@4x.png" )

## try male on female
punk = Image.new( 24, 24 )
punk.compose!( FEMALE1 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.compose!( WILDHAIR )
punk.compose!( NERDGLASSES )
punk.compose!( PIPE )
punk.zoom(4).save( "./i/faceless3(ii)@4x.png" )


# try "female" style
punk = Image.new( 24, 24 )
punk.compose!( FEMALE1 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH1 )
punk.compose!( WILDHAIR_II )
punk.compose!( NERDGLASSES )
punk.compose!( PIPE )

punk.save( "./i/faceless3a.png" )
punk.zoom(4).save( "./i/faceless3a@4x.png" )

## try female on male design
punk = Image.new( 24, 24 )
punk.compose!( MALE1 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH1 )
punk.compose!( WILDHAIR_II )
punk.compose!( NERDGLASSES )
punk.compose!( PIPE )
punk.zoom(4).save( "./i/faceless3a(ii)@4x.png" )




##########################
## try punk #4
punk = Image.new( 24, 24 )
punk.compose!( MALE2 )
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

## try male on female design
punk = Image.new( 24, 24 )
punk.compose!( FEMALE2 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE )
punk.compose!( MOUTH )
punk.compose!( WILDHAIR )
punk.compose!( BIGSHADES )
punk.compose!( EARRING )
punk.compose!( GOAT)
punk.zoom(4).save( "./i/faceless4(ii)@4x.png" )



# try "female" style
punk = Image.new( 24, 24 )
punk.compose!( FEMALE2 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH2 )
punk.compose!( WILDHAIR_II )
punk.compose!( BIGSHADES )
punk.compose!( EARRING )

punk.save( "./i/faceless4a.png" )
punk.zoom(4).save( "./i/faceless4a@4x.png" )

## try female on male design
punk = Image.new( 24, 24 )
punk.compose!( MALE2 )
punk.compose!( EYES )
punk.compose!( EYEBROWS )
punk.compose!( NOSE_SMALL )
punk.compose!( MOUTH2 )
punk.compose!( WILDHAIR_II )
punk.compose!( BIGSHADES )
punk.compose!( EARRING )
punk.zoom(4).save( "./i/faceless4a(ii)@4x.png" )


puts "bye"