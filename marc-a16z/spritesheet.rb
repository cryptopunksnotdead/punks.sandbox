####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'spritesheet'


sheet = Spritesheet.pack( "./attributes.csv",
                          dir: "attributes",
                          width: 24,
                          height: 24 )

sheet.image.save( "./tmp/spritesheet/marcs-24x24.png" )
sheet.image.zoom(2).save( "./tmp/spritesheet/marcs-24x24@2x.png" )

sheet.export( "./tmp/spritesheet/marcs-24x24.csv" )

puts "bye"
