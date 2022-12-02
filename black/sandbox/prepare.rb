require 'pixelart'


steps = Image.calc_sample_steps( 240, 24 )

img = Image.read( "./tmp/punk1.png")
img = img.pixelate( steps )
img.save( "./i/punk1.png" )

img = Image.read( "./tmp/punk2.png")
img = img.pixelate( steps )
img.save( "./i/punk2.png" )


puts "bye"

