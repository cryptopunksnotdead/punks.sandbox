require 'punks'


# background colors in hex (red/green/blue - r/g/b)
GRAYISH = '#638596'



## week of June 20th 2022
##   see https://www.nft-stats.com/collection/cryptopunks

specs = Csv.parse( <<TXT )
  Male 3, Beanie
  Male 3, Earring, Hoodie, 3D Glasses, Cigarette
  Male 2, Normal Beard, Hoodie, Eye Patch

  Female 1, Bandana, Nerd Glasses, Clown Nose
  Male 2, Hoodie, Vape
  Male 4, Hoodie, Horned Rim Glasses

  Male 1, Hoodie, Cigarette
  Male 3, Hoodie, Clown Eyes Green
  Female 3, Earring, Wild White Hair, Regular Shades, Black Lipstick
TXT




punks = ImageComposite.new( 3, 3, background: GRAYISH )


specs.each do |attributes|
   punk = Punk::Image.generate( *attributes )
   punks << punk
end


punks.save( "./tmp/punks_topseller.png")
punks.zoom(4).save( "./tmp/punks_topseller@4x.png")
punks.zoom(8).save( "./tmp/punks_topseller@8x.png")



## punk sales in the month of June & July 2022 in the all-time top sellers charts
##   see https://cryptopunks.app/cryptopunks/topsales


punks = ImageComposite.new( 4, 2, background: GRAYISH )

specs = Csv.parse( <<TXT )
# No. 4464  2500Ξ ($2.62M) - Jul 12, 2022
Ape,          Do-rag, Eye Mask,   Vape
Ape Female,   Do-rag, Eye Mask,   Vape
# No. 8531  825Ξ ($867.08K) - Jun 22, 2022
Zombie,        Stringy Hair, Regular Shades, Goat
Zombie Female, Stringy Hair, Regular Shades
# No. 2964  444Ξ ($439.18K) - Jun 18, 2022
Male 3,   Beanie
Female 3, Beanie
# No. 7971  398.95Ξ ($442.49K) - Jun 29, 2022
Female 2, Wild Hair, Mole,  Big Shades, Earring, Black Lipstick, Cigarette
Male 2,   Wild Hair, Mole,  Big Shades, Earring, Cigarette
TXT


specs.each do |attributes|
  punk = Punk::Image.generate( *attributes )
  punks << punk
end

punks.save( "./tmp/punks_topseller_vol2.png")
punks.zoom(4).save( "./tmp/punks_topseller_vol2@4x.png")
punks.zoom(8).save( "./tmp/punks_topseller_vol2@8x.png")


puts "bye"
