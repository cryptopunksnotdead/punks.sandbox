#############################
#  generate a spritesheet
#

require 'pixelart'


require_relative '../punksdata/punksdata'



assets = ImageComposite.new( 10, 14+4 )   # use grid 10x14 = 140 attributes / tiles



hex = COLORS_ENCODED
colors = decode_colors( hex )


meta = []  ## output meta(data) records


## add archetype attributes
ASSETS_ENCODED.each_with_index do |rec,i|
  hex  = rec[:hex]
  img = decode_image( hex, colors: colors )

  assets << img

  ## auto-generate metadata record
  name = rec[:name]
  names = [name]

  if i <= 10   ## all archetype (0..10) - 11 all-together
    gender, size = name.downcase.index('female') ? ['f', 's'] : ['m', 'l']
    category = 'Archetype'
  else
    qualifier = rec[:qualifier]
    gender, size = qualifier == 'f' ? ['f', 's'] : ['m', 'l']
    category = '?'    ## to be done later
  end

  meta << [meta.size,
           name,
           gender,
           size,
           category,
           names[1..-1].join( ' | '),
          ]
end


##
## add more attributs

more = Csv.parse( <<TXT )
### more archetypes

bot.png,            Bot,  m
zombie-female.png,  Zombie Female,    f
ape-female.png,     Ape Female,       f
alien-female.png,   Alien Female,     f
bot-female.png,     Bot Female,       f


### more hair attributes
m/blonde_bob.png,     Blonde Bob, m
m/blonde_short.png,   Blonde Short, m
m/dark_hair.png,      Dark Hair, m
m/half_shaved.png,    Half Shaved, m
m/orange_side.png,    Orange Side, m
m/pigtails.png,      Pigtails, m
m/pink_with_hat.png,   Pink With Hat, m
m/red_mohawk.png,     Red Mohawk, m
m/straight_hair.png,       Straight Hair, m
m/straight_hair_blonde.png, Straight Hair Blonde, m
m/straight_hair_dark.png,   Straight Hair Dark, m
m/wild_blonde.png,         Wild Blonde, m
m/wild_white_hair.png,      Wild White Hair, m

## more eyewear attributes
m/welding_goggles.png,  Welding Goggles,  m

## more headwear attributes
m/pilot_helmet.png,  Pilot Helmet, m
m/tassle_hat.png,   Tassle Hat, m
m/tiara.png,         Tiara, m

## more attributs
m/choker.png,      Choker,  m

## bot attributes
m/bot_antenna.png,    Bot Antenna, m


## more female attributes
f/peak_spike.png,   Peak Spike, f
f/purple_hair.png,    Purple Hair, f
f/shaved_head.png,  Shaved Head,   f
f/vampire_hair.png,  Vampire Hair, f

f/small_shades.png,     Small Shades, f

f/cowboy_hat.png,  Cowboy Hat, f
f/fedora.png,      Fedora, f
f/hoodie.png,      Hoodie, f
f/beanie.png,      Beanie, f
f/top_hat.png,     Top Hat, f
f/do-rag.png,       Do-rag, f
f/police_cap.png,   Police Cap, f
f/cap_forward.png,   Cap Forward, f

f/bot_antenna.png,    Bot Antenna, f
TXT


pp more


more.each_with_index do |rec,i|

  path = rec[0]
  img = Image.read( "./more/#{path}" )

  assets << img

  ## auto-generate metadata record
  name = rec[1]
  names = [name]

  if i <= 4    ## all archetype (0..4) - 5 all-together
    qualifier = rec[2]
    gender, size = qualifier == 'f' ? ['f', 's'] : ['m', 'l']
    category = 'Archetype'
  else
    qualifier = rec[2]
    gender, size = qualifier == 'f' ? ['f', 's'] : ['m', 'l']
    category = '?'    ## to be done later
  end

  meta << [meta.size,
           name,
           gender,
           size,
           category,
           names[1..-1].join( ' | '),
          ]
end



assets.save( "tmp/spritesheet/punks_2017-24x24.png" )
assets.zoom(2).save( "tmp/spritesheet/punks_2017-24x24@2x.png" )



headers = ['id', 'name', 'gender', 'size', 'type', 'more_names']
File.open( "./tmp/spritesheet/punks_2017-24x24.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end


puts "  #{ASSETS_ENCODED.size} asset(s)"
#=> 133 asset(s)

puts "bye"

