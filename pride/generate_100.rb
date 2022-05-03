###########
#   Phree the Phunks - Pride P(h)unks with Pride / Rainbow Flag Background
#
#  to run use:
#    ruby ./generate_100.rb


require 'pixelart'


## read in right-facing punk composite
print "==> loading right-facing image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"


## 10x10 = 100 punks (cols x rows); create an empty composite
phunks = ImageComposite.new( 10, 10 )

punks.each_with_index do |punk,i|
  break if i >= 100

  phunks << punk.pride.mirror   ## mirror, that is, flip image vertically (right-facing to left-facing)
end


print "==> saving left-facing image..."
phunks.save( "./tmp/pridephunks.png" )
phunks.zoom(4).save( "./tmp/pridephunks@4x.png" )
print "OK\n"


puts "bye"

