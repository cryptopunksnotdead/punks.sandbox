#####################
#  generate demon punks; to run use:
#
#   $ ruby ./generate.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



## read/parse punk attributes in comma-separated values (.csv) format

punks = Csv.parse( <<TXT )
  Demon
  Demon Female
  Demon Female (U)
  Demon, Big Hair Orange, Demon Horns
  Demon Female, Big Hair Orange, Demon Horns, Red Lipstick, Earring
  Demon Female (U), Big Hair Orange, Demon Horns, Red Lipstick, Earring

  Demon Female, Orange Side, Demon Horns, Big Shades, Pink Lipstick, Earring
  Demon, Crazy Hair, Demon Horns, Bubble Gum
  Demon Female, Pink Bob, Demon Horns, Silver Earring, Choker, Cigarette

  Demon, Purple Hair, Demon Horns, Spots, 3D Glasses
  Demon Female, Periwinkle Afro, Demon Horns, Gold Chain, Purple Lipstick, Earring
  Demon Female (U), Periwinkle Afro, Demon Horns, Gold Chain, Purple Lipstick, Earring

  Demon, Big Hair Light Blue, Demon Horns, Heart Shades
  Demon Female, Light Blue Bob, Demon Horns, Heart Shades

  Demon, Vampire Hair, Demon Horns, Spots, Smile, Pipe
TXT




composite = ImageComposite.new( 3, 5 )  ## 3x5 grid (=15 punks)



punks.each_with_index do |attributes,i|
  punk = Punks::Image.generate( *attributes )

  name = "demon" + ('%02d' % i)

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )
  composite << punk
end



composite.save( "./tmp/demons.png" )
composite.zoom(4).save( "./tmp/demons@4x.png" )


puts "bye"
