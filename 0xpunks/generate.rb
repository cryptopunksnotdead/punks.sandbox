require 'punks'



specs = Csv.parse( <<TXT )
  Alien Female, Bandana, 3D Glasses, Earring
  Zombie, Normal Beard, Hoodie, Classic Shades, Earring, Cigarette
  Ape Female, Fedora, Gold Chain, Earring

  Male 3, Vampire Hair, VR, Choker, Cigarette, Frown, Earring
  Zombie Female, Purple Hair, Hot Lipstick
  Female 4, Pilot Helmet, Gold Chain

  Male 1, Hoodie, Small Shades, Silver Chain
  Zombie Female, Mohawk, Eye Mask
  Female 3, Rosy Cheeks,  Cowboy Hat
TXT

# background colors in hex (red/green/blue - r/g/b)
AMBER = '#ffbf00'

punks = ImageComposite.new( 3, 3, background: AMBER )


##
##  hack: add choker (m)  "by hand" for now
##            will get included in built-in spritesheet in the next update(s)
patch = {
  'choker' => Image.read( "../../punks.blocks/basic/m/choker2.png")
}

specs.each do |attributes|
   punk = Punk::Image.generate( *attributes, patch: patch )
   punks << punk
end


punks.save( "./tmp/0xpunks_top.png")
punks.zoom(4).save( "./tmp/0xpunks_top@4x.png")
punks.zoom(8).save( "./tmp/0xpunks_top@8x.png")

puts "bye"
