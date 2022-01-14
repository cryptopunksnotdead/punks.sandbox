###########
#   Phree the Phunks!
#
#  to run use:
#    ruby ./expansionphunks.rb


require 'pixelart'


## read in right-facing punk composite
print "==> loading right-facing image..."
punks = ImageComposite.read( "../../awesome-24px/collection/expansionpunks.png" )
print "OK\n"


## 100x100 = 10000 punks (cols x rows); create an empty composite
##    phunk with background (use solid blue-ish color for now)

phunks = ImageComposite.new( 100, 100, background: '#638596' )

punks.each do |punk|
  phunks << punk.mirror   ## mirror, that is, flip image vertically (right-facing to left-facing)
end


print "==> saving left-facing image..."
phunks.save( "./tmp/expansionphunks.png" )
print "OK\n"


puts "bye"
