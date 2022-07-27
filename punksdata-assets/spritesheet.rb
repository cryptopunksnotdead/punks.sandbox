#############################
#  generate a spritesheet
#

require 'pixelart'


require_relative '../punksdata/punksdata'



assets = ImageComposite.new( 10, 14 )   # use grid 10x14 = 140 attributes / tiles



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

