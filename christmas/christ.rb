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



def make_composite( images )
     width  = images[0].width
     height = images[0].height
     composite = ImageComposite.new( 2, 2, width:  width,
                                           height: height )
     images.each do |image|
       composite << image
     end
     composite
end


#######
# try 1-bit black & white (pencil drawing) sketch / outline edition

christ_1bit = [christ[0].sketch( 4, line: 2 ),
               christ[1].sketch( 4, line: 2 ),
               christ[2].sketch( 4, line: 2 ),
               christ[3].sketch( 4, line: 2 ),
             ]

composite = make_composite( christ_1bit )

composite.save( "./tmp/christ-1bit.png" )
composite.zoom( 2 ).save( "./tmp/christ-1bit@2x.png" )
composite.zoom( 4 ).save( "./tmp/christ-1bit@4x.png" )

######
# try blue edtion

christ_blue = [ christ[0].change_palette8bit( Palette8bit::BLUE ),
                christ[1].change_palette8bit( Palette8bit::BLUE ),
                christ[2].change_palette8bit( Palette8bit::BLUE ),
                christ[3].change_palette8bit( Palette8bit::BLUE ),
              ]

composite = make_composite( christ_blue )

composite.save( "./tmp/christ-blue.png" )
composite.zoom( 4 ).save( "./tmp/christ-blue@4x.png" )
composite.zoom( 8 ).save( "./tmp/christ-blue@8x.png" )
composite.zoom( 8, spacing: 1 ).save( "./tmp/christ-blue@8x(1).png" )


########################
# try led light edition

christ_led =  [christ[0].change_colors( { 0xff => 0x242124ff } ).led( 8, spacing: 2 ),
               christ[1].change_colors( { 0xff => 0x242124ff } ).led( 8, spacing: 2 ),
               christ[2].change_colors( { 0xff => 0x242124ff } ).led( 8, spacing: 2 ),
               christ[3].change_colors( { 0xff => 0x242124ff } ).led( 8, spacing: 2 ),
              ]

composite = make_composite( christ_led )

composite.save( "./tmp/christ-led.png" )
composite.zoom( 2 ).save( "./tmp/christ-led@2x.png" )


##################################
# try spots drawing edition

christ_spots = [christ[0].spots( 5, spacing: 5, center: [-1,1], radius: [3,6] ),
                christ[1].spots( 5, spacing: 5, center: [-1,1], radius: [3,6] ),
                christ[2].spots( 5, spacing: 5, center: [-1,1], radius: [3,6] ),
                christ[3].spots( 5, spacing: 5, center: [-1,1], radius: [3,6] ),
             ]

composite = make_composite( christ_spots )

composite.save( "./tmp/christ-spots.png" )
composite.zoom( 2 ).save( "./tmp/christ-spots@2x.png" )



puts "bye"
