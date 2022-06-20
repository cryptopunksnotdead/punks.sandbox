require 'pixelart'


bear = Image.read( './candybear-24x24.png')


YELLOW = '#ffff00'
RED    = '#ff0000'
GREEN  = '#00ff00'
BLUE   = '#0000ff'

bears = ImageComposite.new( 2, 2, background: [RED, GREEN, YELLOW, BLUE] )

bears << bear
bears << bear
bears << bear
bears << bear


bears.save( "./tmp/candybears.png" )
bears.zoom(4).save( "./tmp/candybears@4x.png" )
bears.zoom(8).save( "./tmp/candybears@8x.png" )


puts "bye"