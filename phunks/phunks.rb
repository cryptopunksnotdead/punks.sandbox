###########
#   Phree the Phunks!
#
#  to run use:
#    ruby ./phunks.rb


require 'pixelart'


## read in right-facing punk composite
print "==> loading right-facing image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"


## 100x100 = 10 000 punks (cols x rows); create an empty composite
phunks = ImageComposite.new( 100, 100 )

(0..9999).each do |i|
  punk = punks[i]
  phunk = punk.mirror   ## mirror, that is, flip image vertically (right-facing to left-facing)

  ## phunk with background (use solid blue-ish color for now)
  img = Image.new( 24, 24, '#638596' )
  img.compose!( phunk )

  phunks << img
end


print "==> saving left-facing image..."
phunks.save( "./tmp/phunks.png" )
print "OK\n"


puts "bye"

