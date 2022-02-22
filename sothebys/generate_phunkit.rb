#####################
#  generate punk it! 104 phunks with your own skin tons and more; to run use:
#
#   $ ruby ./generate_phunkit.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



## read/parse punk attributes in comma-separated values (.csv) format

punks = CsvHash.read( './punkit.csv'  )
puts "  #{punks.size} punk(s)"     #=> 104 punk(s)



def make_lot( punks, types: )
  punkit = ImageComposite.new( 10, 11 )    # grid 10 x 11 (cols x rows)


  punks.each_with_index do |rec,i|
    ## first column is id (e.g. )
    ## second column is type and rest is accessories
    ##
    ## note: remove empty attributes
    ##  e.g.  ["Male 1", "Frown", "Goat", "Mohawk", ""] =>
    ##        ["Male 1", "Frown", "Goat", "Mohawk"]

    id         = rec.values[0]
    type_old   = rec.values[1]
    attributes = rec.values[2..-1].reject { |value| value.empty? }

    ##  male or female?  - replace old with new male or female type
    type_new  = type_old.index( 'Male' ) ? types[0] : types[1]

    puts "==> #{id} - #{type_old} => #{type_new}  #{attributes.inspect}"


    punk = Punks::Image.generate( *[type_new]+attributes )

    punkit << punk.mirror
  end
  punkit
end


### make a 3x2 composite (cols x rows) with 6 lots
phunks = ImageComposite.new( 3, 2, width: 24*10, height: 24*11 )

phunks << make_lot( punks, types: ['Male 1', 'Female 1'] )
phunks << make_lot( punks, types: ['Male 3', 'Female 3'] )
phunks << make_lot( punks, types: ['Zombie Male', 'Zombie Female'] )

phunks << make_lot( punks, types: ['Male Gold 1', 'Female Gold 1'] )
phunks << make_lot( punks, types: ['Male Pink', 'Female Pink'] )
phunks << make_lot( punks, types: ['Ghost Male', 'Ghost Female'] )



phunks.save( "./tmp/phunks-ii.png" )
phunks.zoom(4).save( "./tmp/phunks-ii@4x.png" )



puts "bye"
