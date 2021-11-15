#####################
#  generate "natural" punks; to run use:
#
#   $ ruby ./generate_tops.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



## read/parse punk attributes in comma-separated values (.csv) format


tops = Csv.parse( <<TXT )
Alien,  Headband
Alien,  Cap Forward, Pipe
Ape,    Gold Chain,  Knitted Cap
Zombie, Wild Hair
Zombie, Chinstrap,   Earring,    Crazy Hair
Ape,    Knitted Cap
Zombie, Mohawk Thin
Zombie, Shadow Beard, Mohawk Dark
Zombie, Chinstrap,    Earring,    Crazy Hair
TXT


composite  = ImageComposite.new( 6, 3 )  ## 6x3 grid (=18 punks)


tops.each_with_index do |attributes,i|
  name = "top" + ('%02d' % i)

  punk = Punks::Image.generate( *attributes )

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )

  composite << punk

  punk = Punks::Image.generate( *attributes, style: 'natural' )

  punk.zoom(4).save( "./tmp/#{name}(ii)@4x.png" )

  composite << punk

  punk = Punks::Image.generate( *attributes, style: 'natural_v2' )

  punk.zoom(4).save( "./tmp/#{name}(iii)@4x.png" )
end



composite.save( "./tmp/tops.png" )
composite.zoom(4).save( "./tmp/tops@4x.png" )


puts "bye"
