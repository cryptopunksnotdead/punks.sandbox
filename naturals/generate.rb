#####################
#  generate "natural" punks; to run use:
#
#   $ ruby ./generate.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



## read/parse punk attributes in comma-separated values (.csv) format

punks = Csv.parse( <<TXT )
Female 1, Mohawk Dark
Female 1, Purple Lipstick,    Earring,     Messy Hair
Female 1, Purple Lipstick, Headband
Female 1, Purple Lipstick, Blonde Short
Female 1, Hot Lipstick, Bandana, Horned Rim Glasses

Female 2, Hot Lipstick,    Frumpy Hair, Green Eye Shadow
Female 2, Earring, Half Shaved, Purple Eye Shadow
Female 2, Spots, Orange Side, Blue Eye Shadow

Female 3, Hot Lipstick,       Crazy Hair
Female 3, Wild Hair
Female 3, Blonde Bob, Flowers
Female 3, Black Lipstick,  Pink With Hat
Female 3, Black Lipstick, Straight Hair, Royal Cocktail Hat, Green Eye Shadow, Earring

Female 4, Black Lipstick,     Wild Blonde, Cigarette
Female 4, Wild Hair,       Eye Patch
TXT




composite     = ImageComposite.new( 6, 5 )  ## 6x5 grid (=30 punks)


punks.each_with_index do |attributes,i|
  punk = Punks::Image.generate( *attributes )

  name = "punk" + ('%02d' % i)

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )

  composite    << punk

  ## auto-add (N) for Natural to archetype
  attributes_natural = ["#{attributes[0]} (N)"] + attributes[1..-1]
  punk = Punks::Image.generate( *attributes_natural )

  punk.zoom(4).save( "./tmp/#{name}(ii)@4x.png" )

  composite    << punk
end



composite.save( "./tmp/punks.png" )
composite.zoom(4).save( "./tmp/punks@4x.png" )


puts "bye"
