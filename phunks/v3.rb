###########
#   (Cryto)punks V3
#
#  to run use:
#    ruby ./v3.rb


require 'pixelart'


## read in right-facing punk composite
print "==> loading right-facing punk image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"


###
#  generate a first hundred punks preview composite

punks_v3 = ImageComposite.new( 10, 10, background: '#60a4f7' )

punks.each_with_index do |punk,i|
  punks_v3 << punk

  ## stop (break) after first hundred
  #   (note: count is zero-based that is, starting with 0 to 99)
  break if i >= 99
end


punks_v3.save( "./tmp/punks3.png" )
punks_v3.zoom(4).save( "./tmp/punks3@4x.png" )



print "==> loading right-facing more punk image..."
morepunks = ImageComposite.read( "../../awesome-24px/collection/morepunks.png" )
print "OK\n"


###
#  generate a first hundred punks preview composite
morepunks_v3 = ImageComposite.new( 10, 10, background: '#60a4f7' )

morepunks.each_with_index do |punk,i|
  morepunks_v3 << punk

  ## stop (break) after first hundred
  #   (note: count is zero-based that is, starting with 0 to 99)
  break if i >= 99
end


morepunks_v3.save( "./tmp/morepunks3.png" )
morepunks_v3.zoom(4).save( "./tmp/morepunks3@4x.png" )




puts "bye"

