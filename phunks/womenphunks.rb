###########
#   Phree the Phunks!
#
#  to run use:
#    ruby ./womenphunks.rb


require 'pixelart'


## 100x60 = 6000 punks (cols x rows); create an empty composite
phunks = ImageComposite.new( 100, 60 )


## read in right-facing punk composite
rootdir = "../../awesome-24px/collection"

print "==> loading right-facing image..."
punks = ImageComposite.read( "#{rootdir}/womenpunks.png" )
print "OK\n"


(0..5999).each do |i|
  punk  = punks[i]
  phunk = punk.mirror   ## mirror, that is, flip image vertically (right-facing to left-facing)

  ## phunk with background (use solid blue-ish color for now)
  img = Image.new( 24, 24, '#638596' )
  img.compose!( phunk )

  phunks << img
end


print "==> saving left-facing image..."
phunks.save( "./tmp/womenphunks.png" )
print "OK\n"


puts "bye"

