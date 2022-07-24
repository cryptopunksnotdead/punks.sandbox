require 'pixelart'


APE_MALE    = Image.read( './ape-male.png' )
APE_FEMALE  = Image.read( './ape-female.png' )

APE_MALE_V0   = Image.read( './ape-male_v0.png' )
APE_FEMALE_V0 = Image.read( './ape-female_v0.png' )


GOLD  =   0xffc926ff
WHITE =   0xffffffff

apes = ImageComposite.new( 4, 2, background: '#638596' )


apes << APE_MALE_V0
apes << APE_MALE

punk = Image.new( 24, 24 )
punk.compose!( APE_MALE )
## white teeth
punk[10,18] = WHITE
punk[11,18] = WHITE
punk[12,18] = WHITE
punk[13,18] = WHITE
punk[14,18] = WHITE
apes << punk

punk = Image.new( 24, 24 )
punk.compose!( APE_MALE )
## white teeth
punk[10,18] = GOLD
punk[11,18] = GOLD
punk[12,18] = GOLD
punk[13,18] = GOLD
punk[14,18] = GOLD
apes << punk


apes << APE_FEMALE_V0
apes << APE_FEMALE

punk = Image.new( 24, 24 )
punk.compose!( APE_FEMALE )
## white teeth
punk[11,18] = WHITE
punk[12,18] = WHITE
punk[13,18] = WHITE
apes << punk

punk = Image.new( 24, 24 )
punk.compose!( APE_FEMALE )
## white teeth
punk[11,18] = GOLD
punk[12,18] = GOLD
punk[13,18] = GOLD
apes << punk


apes.save( "./tmp/apes.png" )
apes.zoom(8).save( "./tmp/apes@8x.png" )

puts "bye"