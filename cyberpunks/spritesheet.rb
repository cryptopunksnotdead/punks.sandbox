####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'pixelart'


attributes = CsvHash.read( "./attributes.csv")
puts "  #{attributes.size} record(s)"  #=> ??


total = 1 + attributes.size

sheet = ImageComposite.new( 20, (total/20)+1, width:  32,
                                              height: 32 )


meta = []  ## output meta(data) records


####
#  add attributes
attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "./attributes/#{path}" )

  meta << [meta.size,
            rec['category'],
            rec['name'],
            rec['more_names'],
          ]
end


sheet.save( "./tmp/spritesheet.png" )
sheet.zoom(2).save( "./tmp/spritesheet@2x.png" )


headers = ['id', 'type', 'name', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"