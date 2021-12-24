###############################
# to run use:
#    $  ruby christmas/christ.rb


require 'pixelart'



christ = [
     Image.read( '../punks.readymade/religion/jesus_christ.png' ),
     Image.read( '../punks.readymade/religion/jesus_christ_(2).png' ),
     Image.read( '../punks.readymade/religion/jesus_christ_(3).png' ),
     Image.read( '../punks.readymade/religion/jesus_christ_(4).png' ),
]


composite = ImageComposite.new( 2, 2 )
composite << christ[0]
composite << christ[1]
composite << christ[2]
composite << christ[3]


composite.save( "./tmp/christ.png" )
composite.zoom( 4 ).save( "./tmp/christ@4x.png" )
composite.zoom( 8 ).save( "./tmp/christ@8x.png" )


puts "bye"
