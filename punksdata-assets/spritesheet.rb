#############################
#  generate a spritesheet
#

require 'pixelart'


require_relative '../punksdata/punksdata'



assets = ImageComposite.new( 10, 14+2 )   # use grid 10x14 = 140 attributes / tiles



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

zombie-female.png,  Zombie Female,    f
ape-female.png,     Ape Female,       f
alien-female.png,   Alien Female,     f

### more hair attributes
f/peakspike.png,   Peak Spike, f
f/purplehair.png,    Purple Hair, f
f/shavedhead.png,  Shaved Head,   f
f/vampirehair.png,  Vampire Hair, f

m/blondebob.png,     Blonde Bob, m
m/blondeshort.png,   Blonde Short, m
m/darkhair.png,      Dark Hair, m
m/halfshaved.png,    Half Shaved, m
m/orangeside.png,    Orange Side, m
m/pigtails.png,      Pigtails, m
m/pinkwithhat.png,   Pink With Hat, m
m/redmohawk.png,     Red Mohawk, m
m/straighthair.png,       Straight Hair, m
m/straighthairblonde.png, Straight Hair Blonde, m
m/straighthairdark.png,   Straight Hair Dark, m
m/wildblonde.png,         Wild Blonde, m
m/wildwhitehair.png,      Wild White Hair, m

TXT

pp more


more.each_with_index do |rec,i|

  path = rec[0]
  img = Image.read( "./more/#{path}" )

  assets << img

  ## auto-generate metadata record
  name = rec[1]
  names = [name]

  if i <= 2    ## all archetype (0..2) - 3 all-together
    gender, size =  ['f', 's']
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

