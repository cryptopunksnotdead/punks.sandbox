##################################
#  generate readme page
#
# to run use:
#     $ ruby ./page.rb



require 'pixelart'

require_relative 'punksdata'


header = <<TXT
#  Inside the CryptoPunksData Contract - All 133 Assets (Archetypes 'n' Attributes) in the 24x24px Format For Easy (Re)Use "Off-Chain"

How does it work? See [**Inside the CryptoPunksData Contract - Decoding the On-Chain Assets 'n' Color Palette »**](../punksdata)
TXT







buf = <<TXT
| 24x24     | No   | Name |
|-----------|------|------|
TXT

ASSETS_ENCODED.each do |rec|
  num  = rec[0]
  name = rec[1]

  ## slugify name e.g.
  ##   Male 1          => male_1
  ##   Clown Nose      => clown_nose
  ##   Regular Shades  => regular_shades
  slug = name.downcase.gsub( ' ', '_' )

  buf << "| ![](i/#{'%03d' % num}-#{slug}.png) |  #{num} | #{name} |"
end


buf << "\n\n4x\n\n"

ASSETS_ENCODED.each do |rec|
  num  = rec[0]
  name = rec[1]

  slug = name.downcase.gsub( ' ', '_' )

  buf <<   %Q{#{num} }
  buf <<   %Q{![](i/#{'%03d' % num}-#{slug}x4.png "#{name}")\n}
end


footer =<<TXT

Note:  Many attributes have two variants (male / female):


- Rosy Cheeks         =>  [12, 128]
- Clown Hair Green    =>  [14, 104]  ![](i/014_clown_hair_green.png) / ![](i/104_clown_hair_green.png)
- Mohawk Dark         =>  [15, 130]
- Clown Nose          =>  [18, 109]
- Cigarette           =>  [19, 115]
- Nerd Glasses        =>  [20, 89]
- Regular Shades      =>  [21, 82]
- Knitted Cap         =>  [22, 113]
- Mole                =>  [27, 85]
- Classic Shades      =>  [31, 102]
- Vape                =>  [32, 120]
- Silver Chain        =>  [33, 133]
- Big Shades          =>  [35, 124]
- Mohawk Thin         =>  [36, 117]
- Cap                 =>  [38, 105]
- Clown Eyes Green    =>  [39, 114]
- Medical Mask        =>  [41, 106]
- VR                  =>  [43, 119]
- Eye Patch           =>  [44, 100]
- Wild Hair           =>  [45, 96]
- Bandana             =>  [47, 107]
- Frumpy Hair         =>  [49, 88]
- Crazy Hair          =>  [50, 81]
- Spots               =>  [55, 87]
- Earring             =>  [61, 125]
- Horned Rim Glasses  =>  [62, 132]
- Headband            =>  [63, 110]
- Pipe                =>  [64, 95]
- Messy Hair          =>  [65, 93]
- Gold Chain          =>  [68, 118]
- Stringy Hair        =>  [70, 98]
- Eye Mask            =>  [71, 103]
- 3D Glasses          =>  [72, 84]
- Clown Eyes Blue     =>  [73, 94]
- Mohawk              =>  [74, 123]



## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.

TXT



File.open( './README.md', 'w:utf-8') do |f|
    f.write( header)
    f.write( "\n\n")
    f.write( buf )
    f.write( "\n\n")
    f.write( footer )
end

puts "bye"
