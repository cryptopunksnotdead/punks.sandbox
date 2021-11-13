#####################
#  generate "zoomed" punks; to run use:
#
#   $ ruby ./generate.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



## read/parse punk attributes in comma-separated values (.csv) format

punks = Csv.parse( <<TXT )
Female 3, Wild Hair                              # 2
Female 1, Mohawk Dark                            # 532
Male 2,   Normal Beard Black, Hoodie             # 58
Male 1,   Normal Beard Black, Cap                # 30
Alien,    Bandana,            Regular Shades     # 635
Female 3, Hot Lipstick,       Crazy Hair         # 602
Male 3,   Muttonchops,        Earring,     Cap Forward, Big Shades   # 768
Female 4, Black Lipstick,     Wild Blonde, Cigarette     # 603
Female 1, Purple Lipstick,    Earring,     Messy Hair    # 757
TXT




composite     = ImageComposite.new( 3, 3 )  ## 3x3 grid (=9 punks)
composite_ii  = ImageComposite.new( 3, 3, width: 24*6+(24-1), height: 24*6+(24-1) )


punks.each_with_index do |attributes,i|
  punk = Punks::Image.generate( *attributes )

  name = "punk" + ('%02d' % i)

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )
  punk.zoom(6, spacing: 1).save( "./tmp/#{name}6x+1.png" )

  composite    << punk
  composite_ii << punk.zoom( 6, spacing: 1 )
end



composite.save( "./tmp/punks.png" )
composite.zoom(4).save( "./tmp/punks@4x.png" )

composite_ii.save( "./tmp/punks_(ii).png" )

puts "bye"
