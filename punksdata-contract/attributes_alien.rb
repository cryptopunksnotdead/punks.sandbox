
require_relative './punksdata'


punks = CryptoPunksData.new      # start up the "offline" contract


###
# write out meta data for all (9) alien punks
puts
puts "aliens:"
(0..9999).each do |id|
  values = punks.punk_attributes( id ).split( /[ ]*,[ ]*/ )

  if ['Alien'].include?( values[0] )
    print values.join(', ')
    print "," * (6-values.size)
    print "\n"
  end
end

puts "bye"


