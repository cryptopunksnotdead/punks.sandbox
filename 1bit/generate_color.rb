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


punks = Csv.read( "./punks.csv" )
puts "  #{punks.size} record(s)"



composite = ImageComposite.new( 6, 6 )    # 6x6 grid (=36 punks)


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
