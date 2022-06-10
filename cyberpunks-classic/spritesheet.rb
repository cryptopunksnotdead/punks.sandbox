####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'spritesheet'


sheet = Spritesheet.pack( "./attributes.csv",
                          dir: "./attributes",
                          width: 32,
                          height: 32 )

sheet.image.save( "./tmp/spritesheet.png" )
sheet.image.zoom(2).save( "./tmp/spritesheet@2x.png" )

sheet.export( "./tmp/spritesheet.csv" )


puts "bye"

