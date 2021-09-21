
require_relative './punksdata'


punks = CryptoPunksData.new      # start up the "offline" contract


###
# write out meta data

buf = String.new('')
buf << "type, attribute1, attribute2, attribute3, attribute4, attribute5, attribute6, attribute7\n"

(0..9999).each do |id|
  values = punks.punk_attributes( id ).split( /[ ]*,[ ]*/ )

  buf << values.join(', ')
  buf << "," * (8-values.size)
  buf << "\n"

  print "."   if id % 100
end
print "\n"


File.open( './tmp/punks.csv', 'w:utf-8') { |f| f.write( buf ) }


puts "bye"


