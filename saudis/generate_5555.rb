require 'punks'


specs = CsvHash.read( "./saudis.csv" )
puts "  #{specs.size} record(s)"


saudis = ImageComposite.new( 100, 56 )   ## use a 100x56 grid (5600 max.)


specs.each do |spec|
  # note: spec is a key/value hash table
  #         cut-off first column (that is, ID e.g. ID=0, ID=1, etc.)
  attributes = spec.values[1..-1]
  pp attributes

  saudi = Saudi::Image.generate( *attributes )
  saudis << saudi
end


saudis.save( "./tmp/saudis-24x24.png" )

puts "bye"
