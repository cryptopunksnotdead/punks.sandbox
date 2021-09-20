
require_relative './punksdata'


punks = CryptoPunksData.new      # start up the "offline" contract


###
# write out meta data for first one hundred punks
puts
puts "first 100:"
(0..99).each do |id|
  values = punks.punk_attributes( id ).split( /[ ]*,[ ]*/ )

  print values.join(', ')
  print "," * (6-values.size)
  print "\n"
end

puts "bye"


