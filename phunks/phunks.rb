###########
#   Phree the Phunks!
#
#  to run use:
#    ruby ./phunks.rb


require 'cryptopunks'


## 100x100 = 10 000 punks (cols x rows); create an empty composite
phunks = Punks::Image::Composite.new( 100, 100 )


## read in right-facing punk composite
rootdir = "../../awesome-24px/collection"

print "==> loading right-facing image..."
punks = Punks::Image::Composite.read( "#{rootdir}/punks.png" )
print "OK\n"


(0..9999).each do |i|
  punk = punks[i]
  punk = punk.mirror   ## mirror, that is, flip image horizontally (right-facing to left-facing)

  phunks << punk
end


print "==> saving left-facing image..."
phunks.save( "./tmp/phunks.png" )
print "OK\n"


puts "bye"

