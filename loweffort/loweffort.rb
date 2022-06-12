###########
#   Phree the "Low Effort" Phunks!
#
#  to run use:
#    ruby ./loweffort.rb


require 'pixelart'


## read in right-facing punk composite
print "==> loading right-facing image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"


phunks = ImageComposite.new( 10, 10,
                               width: 96,  #4x = 24x4
                               height: 96,
                               background: '#638596' )

punks.each_with_index do |punk,i|

  punk.save( "./tmp/punk#{i}.png" )
  punk.zoom( 4 ).save( "./tmp/punk#{i}@4x.png" )

  ## avoid do you wanto to overwrite (y/n) question
  ##    with unique timestamp ("unix epoch")
  epoch = Time.now.to_i


  cmd = "ffmpeg -i ./tmp/punk#{i}.png -filter_complex hqx=4 ./tmp/punk#{i}.#{epoch}@hq4x.png"
  puts "==> running >#{cmd}<..."

  system( cmd )

  phunks <<  Image.read( "./tmp/punk#{i}.#{epoch}@hq4x.png" ).mirror

  break  if i >= 99
end


print "==> saving left-facing image..."
phunks.save( "./tmp/loweffortpunks.png" )
print "OK\n"


puts "bye"

