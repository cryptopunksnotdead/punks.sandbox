require 'punks'



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



# background colors in hex (red/green/blue - r/g/b)
GRAYISH = '#638596'

punks = ImageComposite.new( 3, 3, background: GRAYISH )


specs.each do |attributes|
   punk = Punk::Image.generate( *attributes )
   punks << punk
end


punks.save( "./tmp/punks_topseller.png")
punks.zoom(4).save( "./tmp/punks_topseller@4x.png")
punks.zoom(8).save( "./tmp/punks_topseller@8x.png")

puts "bye"
