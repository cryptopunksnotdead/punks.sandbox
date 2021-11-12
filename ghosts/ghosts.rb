#####################
#  generate punks; to run use:
#
#   $ ruby ./ghosts.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


punks = Csv.parse( <<TXT )
 Ghost
 Ghost Female
 Ghost Female (U)
 Ghost, Wild Hair, Laser Eyes
 Ghost, Big Hair Silver
 Ghost Female, Silver Bob, Bow

 Ghost Female, Light Blue Buzzcut, Green Eye Shadow, Pink Lipstick, Gold Chain, Earring
 Ghost Female (U), Light Blue Buzzcut, Green Eye Shadow, Pink Lipstick, Gold Chain, Earring

 Ghost, Mohawk Dark, Regular Shades, Cigarette
 Ghost, Santa Hat, Clown Nose, Shadow Beard, Pipe

 Ghost Female, Silver Afro, 3D Glasses, Flowers
 Ghost Female (U), Silver Afro, 3D Glasses

 Ghost Female, Big Hair Light Green, Laser Eyes Gold, Black Lipstick, Silver Earring, Silver Chain
 Ghost Female, Pink Bob, Heart Shades, Purple Lipstick
 Ghost, Birthday Hat, Spots, Bubble Gum
 Ghost Female, Straight Hair Blonde, Royal Cocktail Hat, Hot Lipstick, Purple Eye Shadow, Earring
TXT


composite = ImageComposite.new( 4, 4 )   # 4x4 grid (=16 punks)


punks.each_with_index do |attributes,i|
  punk = Punks::Image.generate( *attributes )

  name = "ghost" + ('%02d' % i)

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )
  composite << punk
end



composite.save( "./tmp/ghosts.png" )
composite.zoom(4).save( "./tmp/ghosts@4x.png" )


puts "bye"
