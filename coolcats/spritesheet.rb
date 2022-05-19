####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'pixelart'
require 'csvreader'



attributes = CsvHash.read( "./attributes.csv")
puts "  #{attributes.size} record(s)"  #=> ??


total = 1 + attributes.size

sheet = ImageComposite.new( 10, (total/10)+1 )


meta = []  ## output meta(data) records


####
#  add archetypes first

sheet << Image.read( "./attributes/base.png" )
meta << [meta.size,
         'Base',                       ## name
         'Archetype - Cool Cat',       ## type
         '',                           ## more names
        ]


####
#  add attributes
attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "./attributes/#{path}" )

  meta << [meta.size,
            rec['name'],
            "Attribute - #{rec['category']}",     ## add type e.g. Hair, Hat, Glasses, etc later - why? why not?
            rec['more_names'],
          ]
end



sheet.save( "./tmp/spritesheet.png" )
sheet.zoom(2).save( "./tmp/spritesheet@2x.png" )
sheet.zoom(4).save( "./tmp/spritesheet@4x.png" )


headers = ['id', 'name', 'type', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"