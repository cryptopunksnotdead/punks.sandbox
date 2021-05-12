$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


rootdir = "../../programming-cryptopunks/i"

## 25x40 = 1000 punks (cols x rows); create an empty composite
morepunks = Punks::Image::Composite.new( 25, 40 )

## read in 10 packs of 100 each
(1..10).each do |series|
  punks = Punks::Image::Composite.read( "#{rootdir}/more-punks-#{series}.png" )

  ## for testing save first punk in series
  punk = punks[0]
  punk.zoom(4).save( "./tmp/morepunk-#{10000+(100*(series-1))}.png" )

  ## add 100 more to morepunks composite
  (0..99).each do |num|
    morepunks << punks[num]
  end
end


morepunks.save( "./tmp/morepunks.png" )


puts "bye"

