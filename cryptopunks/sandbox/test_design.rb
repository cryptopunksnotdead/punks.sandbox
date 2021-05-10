###
#  to run use
#     ruby -I ./lib sandbox/test_design.rb


require 'cryptopunks'


puts "  #{DESIGNS_ORIGINAL.size} design(s) in original series:"
pp DESIGNS_ORIGINAL.keys

puts
puts "  #{DESIGNS_MORE.size} design(s) in more series:"
pp DESIGNS_MORE.keys


punk = Punks::Image.new( design: 'more/demon-male' )
punk.zoom(4).save( "./tmp/design-demon-male.png" )

punk = Punks::Image.new( design: 'more/vampire-male' )
punk.zoom(4).save( "./tmp/design-vampire-male.png" )

punk = Punks::Image.new( design: 'more/robot-female' )
punk.zoom(4).save( "./tmp/design-robot-female.png" )


punk = Punks::Image.new( design: 'more/alien-female' )
punk.zoom(4).save( "./tmp/design-alien-female.png" )

punk = Punks::Image.new( design: 'ape-male' )
punk.zoom(4).save( "./tmp/design-ape-female.png" )

punk = Punks::Image.new( design: 'zombie-male' )
punk.zoom(4).save( "./tmp/design-zombie-male.png" )



punk = Punks::Image.new( design: 'human-male' )
punk.zoom(4).save( "./tmp/design-human-male.png" )

punk = Punks::Image.new( design: 'human-male!dark' )
punk.zoom(4).save( "./tmp/design-human-male_dark.png" )

punk = Punks::Image.new( design: 'human-female!lighter' )
punk.zoom(4).save( "./tmp/design-human-female_lighter.png" )

puts "bye"

