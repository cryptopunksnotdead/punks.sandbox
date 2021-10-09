####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'pixelart'
require 'csvreader'



archetypes = CsvHash.read( "./archetypes.csv")
puts "  #{archetypes.size} record(s)"   #=> 64 records

attributes = CsvHash.read( "./attributes.csv")
puts "  #{attributes.size} record(s)"  #=> 133


total = archetypes.size + attributes.size

sheet = ImageComposite.new( 25, (total/25)+1 )


meta = []  ## output meta(data) records


####
#  add archetypes first


archetypes.each do |rec|
  path = rec['path']
  sheet << Image.read( "../../punks.blocks/#{path}" )


  meta << [meta.size,
           rec['name'],
           rec['gender'],
             "Archetype - #{rec['type']}",
           rec['more_names'],
          ]
end


####
#  add attributes


attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "../../punks.blocks/#{path}" )

  meta << [meta.size,
            rec['name'],
            rec['gender'],
            "Attribute",     ## add type e.g. Hair, Hat, Glasses, etc later - why? why not?
            rec['more_names'],
          ]
end



sheet.save( "./tmp/spritesheet.png" )
sheet.zoom(4).save( "./tmp/spritesheet@4x.png" )


headers = ['id', 'name', 'gender', 'type', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"