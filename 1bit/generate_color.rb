#####################
#  generate 1bit punks; to run use:
#
#   $ ruby ./generate_color.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



colors4 = [
 '#ff0000',   # red
 '#00ff00',   # green
 '#ffff00',   # yellow
 '#0000ff',   # blue
]

colors7 = [    ## seven rainbow-like
 '#ff0000',  # red
 '#ffa500',  # orange
 '#ffff00',  # yellow
 '#00ff00',  # green
 '#0000ff',  # blue
 '#9400d3',  # indigo-like
 '#ee82ee',  # violet-like
]


colors = colors7



punks = [
 ["Male 1-Bit",      "Eyes",   "Nose",         "Mouth"],
 ["Female 1-Bit",    "Eyes",   "Nose Small",   "Mouth" ],
 ## try adding some black only attributes
 ["Male 1-Bit",   "Small Shades", "Nose",         "Mouth", "Cap Forward", "Pipe" ],
 ["Female 1-Bit", "Small Shades", "Nose Small",   "Mouth", "Cap Forward", "Pipe" ],
 ["Male 1-Bit",   "Regular Shades", "Nose",       "Mouth", "Smile", "Top Hat" ],
 ["Female 1-Bit", "Regular Shades", "Nose Small", "Mouth", "Smile", "Top Hat" ],
 ["Male 1-Bit",   "Laser Eyes",    "Nose",        "Mouth", "Smile", "Earring", "Mohawk" ],
 ["Female 1-Bit", "Laser Eyes",    "Nose Small",  "Mouth", "Smile", "Earring", "Mohawk" ],
 ["Male 1-Bit",   "Eyes",          "Nose",        "Mouth", "Smile", "Black Afro" ],
 ["Female 1-Bit", "Eyes",          "Nose Small",  "Mouth", "Smile", "Big Hair Black" ],
 ["Male 1-Bit",   "Clown Eyes",    "Clown Nose",  "Mouth", "Smile", "Clown Hair Black" ],
 ["Female 1-Bit", "Heart Eyes",    "Nose Small",  "Mouth", "Smile" ],
 ## try zombie-like
 ["Male 1-Bit",   "Zombie Eyes",   "Nose",       "Zombie Mouth", "Spots", "Knitted Cap" ],
 ["Female 1-Bit", "Zombie Eyes",   "Nose Small", "Zombie Mouth", "Knitted Cap" ],
 ## try skeleton-like
 ["Male 1-Bit",   "Skeleton Eyes", "Nose",       "Skeleton Mouth" ],
 ["Female 1-Bit", "Skeleton Eyes", "Nose Small", "Skeleton Mouth" ],
 ["Male 1-Bit",   "Skeleton Eyes", "Nose",       "Skeleton Mouth", "Sun Hat", "Pipe" ],
 ["Female 1-Bit", "Skeleton Eyes", "Nose Small", "Skeleton Mouth", "Sun Hat", "Cigarette"],
 ## try scream-like
 ["Male 1-Bit",   "Scream Eyes",   "Scream Nose", "Scream Mouth" ],
 ["Female 1-Bit", "Scream Eyes",   "Nose Small",  "Scream Mouth" ],
 ## try ape-like
 ["Male 1-Bit",   "Ape Front", "Eyes",  "Ape Nose", "Ape Mouth" ],
 ["Female 1-Bit", "Ape Front", "Eyes",  "Ape Nose", "Mouth" ],
 ## try alien-like
 ["Alien Male 1-Bit",   "Alien Eyes", "Alien Nose", "Alien Mouth", "Bandana" ],
 ["Alien Female 1-Bit", "Alien Eyes", "Nose Up",    "Mouth" ],
 ["Alien Male 1-Bit",   "Headband", "Alien Eyes",  "Alien Nose", "Alien Mouth", "Smile Big" ],
 ["Alien Female 1-Bit", "Headband", "Alien Eyes", "Nose Up", "Mouth", "Smile", "Bubble Gum" ],
 ## try demon
 ["Demon Male 1-Bit",   "Heart Eyes",  "Nose",       "Mouth" ],
 ["Demon Female 1-Bit", "Heart Eyes",  "Nose Small", "Mouth", "Cigarette" ],
 ## try frankenstein
 ["Frankenstein Male 1-Bit",   "Frankenstein Front", "Frankenstein Eyes", "Nose",       "Frankenstein Mouth" ],
 ["Frankenstein Female 1-Bit", "Frankenstein Front", "Frankenstein Eyes", "Nose Small", "Frankenstein Mouth" ],
 ## try orc
 ["Orc Male 1-Bit",   "Orc Eyes", "Orc Nose", "Orc Mouth",       "Cap" ],
 ["Orc Female 1-Bit", "Orc Eyes", "Orc Nose", "Orc Mouth Small", "Cap" ],
 ## try robot
 ["Robot Male 1-Bit",   "Robot Eyes", "Robot Mouth" ],
 ["Robot Female 1-Bit", "Robot Eyes", "Robot Mouth" ],
 ## try vampire
 ["Vampire Male 1-Bit",   "Eyes", "Nose",       "Vampire Mouth",       "Wild Hair" ],
 ["Vampire Female 1-Bit", "Eyes", "Nose Small", "Vampire Mouth Small", "Wild Hair" ],
]



composite = ImageComposite.new( 6, 6 )


punks.each_with_index do |attributes,i|
  punk = Punks::Image.generate( *attributes )

  color = colors[ i%colors.size ]   ## cycle through colors

  color_map = {
    0         => color,
    '#ffffff' => color
  }
  punk = punk.change_colors( color_map )


  name = "bitpunk" + ('%02d' % i) + "(ii)"

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )
  composite << punk
end




composite.save( "./tmp/bitpunks(ii).png" )
composite.zoom(4).save( "./tmp/bitpunks(ii)@4x.png" )


puts "bye"
