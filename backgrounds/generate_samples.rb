###############################
# to run use:
#    $  ruby ./generate_samples.rb


require 'cryptopunks'


base = Punks::Image.generate( "female 3", "wild blonde", "mole", "purple lipstick", "blue eye shadow" ).mirror


base.save( "./tmp/base-24x24.png" )
base.zoom(10).save( "./tmp/base-24x24@10x.png" )


backgrounds = [
  # 1st row
   'backenza',
   'colorful',
   'midnight',
   'purple',
   'snowy',
 # 2nd row
   'swamp',
   'matrix1',
   'matrix2',
   'matrix3',
   'flag_ukraine',
 # 3rd row
   'flag_rainbow',
   'rainbow1',
   'rainbow2',
   'rainbow3',
   'rainbow4',
 ]


punks = ImageComposite.new( 5, 3 )    ## grid 5x3 (cols x rows) = 15


backgrounds.each do |name|
  background = Image.read( "./#{name}-24x24.png" )

  punk = Image.new( 24, 24 )
  punk.compose!( background )
  punk.compose!( base )

  punks << punk
end

punks.save( "./tmp/punk-backgrounds.png" )
punks.zoom(4).save( "./tmp/punk-backgrounds@4x.png" )


puts "bye"
