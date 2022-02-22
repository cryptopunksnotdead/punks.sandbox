#####################
#  generate punk it! 104 punks; to run use:
#
#   $ ruby ./generate_punkit.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



## read/parse punk attributes in comma-separated values (.csv) format

punks = CsvHash.read( './punkit.csv'  )
puts "  #{punks.size} punk(s)"     #=> 104 punk(s)



punkit = ImageComposite.new( 10, 11 )    # grid 10 x 11 (cols x rows)


punks.each_with_index do |rec,i|
  ## first column is id (e.g. )
  ## second column is type and rest is accessories
  ##
  ## note: remove empty attributes
  ##  e.g.  ["Male 1", "Frown", "Goat", "Mohawk", ""] =>
  ##        ["Male 1", "Frown", "Goat", "Mohawk"]

  id         = rec.values[0]
  attributes = rec.values[1..-1].reject { |value| value.empty? }


  puts "==> #{id} - #{attributes.inspect}"

  punk = Punks::Image.generate( *attributes )

  punkit << punk
end



punkit.save( "./tmp/sothebys-punkit-ii.png" )
punkit.zoom(4).save( "./tmp/sothebys-punkit-ii@4x.png" )


puts "bye"
