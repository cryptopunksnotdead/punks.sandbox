###############################
# to run use:
#    $  ruby readymade/matrix.rb


require 'pixelart'



matrix = [
  Image.read( '../punks.readymade/cinema_I_fictional_characters/agent_smith.png' ),
  Image.read( '../punks.readymade/cinema_I_fictional_characters/morpheus.png' ),
  Image.read( '../punks.readymade/cinema_I_fictional_characters/neo.png' ),
  Image.read( '../punks.readymade/cinema_I_fictional_characters/trinity.png' ),

  Image.read( '../punks.readymade/cinema_I_fictional_characters/agent_smith_(2).png' ),
  Image.read( '../punks.readymade/cinema_I_fictional_characters/morpheus_(2).png' ),
  Image.read( '../punks.readymade/cinema_I_fictional_characters/neo_(2).png' ),
  Image.read( '../punks.readymade/cinema_I_fictional_characters/trinity_(2).png' ),
]


composite = ImageComposite.new( 4, 2 )
matrix.each do |punk|
    img = Image.new( 24, 24, '#48B94D' )
    img.compose!( punk )
    composite << img
end


composite.save( "./tmp/matrix.png" )
composite.zoom( 4 ).save( "./tmp/matrix@4x.png" )
composite.zoom( 8 ).save( "./tmp/matrix@8x.png" )

