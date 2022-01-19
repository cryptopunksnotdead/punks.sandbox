#####################
#  generate fast food punks; to run use:
#
#   $ ruby ./fastfood.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



## read/parse punk attributes in comma-separated values (.csv) format

punks = Csv.parse( <<TXT )
  Alien,         Cap M Red
  Alien,         Cap M Red Flipped, Regular Shades
  Alien Female,  Cap M Red
  Alien Female,  Cap M Red Flipped, Regular Shades

  Alien,         Cap M Black,          VR
  Alien,         Cap M Gray Flipped,   VR
  Alien Female,  Cap M White,          VR
  Alien Female,  Cap M Red Flipped,    VR

  Male 2,          Cap M Black, Regular Shades
  Male 3,          Cap M Gray Flipped, Horned Rim Glasses
  Female 2,        Cap M White, Regular Shades
  Female 3,        Cap M Red Flipped, Horned Rim Glasses

  Male Gold,         Cap Kentucky,         Bubble Gum
  Male Gold 2,         Cap Subway Flipped,    3D Glasses
  Female Gold,       Cap Wendy's,           Bubble Gum
  Female Gold 2,       Cap Baskin-Robbins Flipped,  3D Glasses

  Alien Red,         Cap Burger King
  Alien Green,         Cap White Castle Flipped
  Alien Female Red,  Cap Dunkin' Donuts ,           Big Shades
  Alien Female Green,  Cap Pizza Hut,   Big Shades
TXT


composite = ImageComposite.new( 4, 5 )


punks.each_with_index do |attributes,i|
  punk = Punks::Image.generate( *attributes )

  name = "fastfood" + ('%02d' % i)

  punk.zoom(4).save( "./tmp/#{name}@4x.png" )
  composite << punk
end



composite.save( "./tmp/fastfood.png" )
composite.zoom(4).save( "./tmp/fastfood@4x.png" )


puts "bye"
