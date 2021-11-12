#####################
#  generate 1bit (black & white) punks; to run use:
#
#   $ ruby ./generate.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'




punks = Csv.read( "./punks.csv" )
puts "  #{punks.size} record(s)"



composite = ImageComposite.new( 6, 6 )   # 6x6 grid (=36 punks)


punks.each_with_index do |attributes,i|
  punk = Punks::Image.generate( *attributes )

  name = "bitpunk" + ('%02d' % i)

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )
  composite << punk
end




composite.save( "./tmp/bitpunks.png" )
composite.zoom(4).save( "./tmp/bitpunks@4x.png" )


puts "bye"
