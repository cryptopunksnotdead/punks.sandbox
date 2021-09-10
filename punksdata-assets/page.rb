##################################
#  generate readme page
#
# to run use:
#     $ ruby ./page.rb



require 'pixelart'

require_relative 'punksdata'


header = <<TXT

![](i/archetypes-strip3x.png)


# Inside the CryptoPunksData Contract - All 133 Assets (11 Archetypes 'n' 122 Attributes) in the 24x24px Format For Easy (Re)Use "Off-Chain"

How does it work? See [**Inside the CryptoPunksData Contract - Decoding the On-Chain Assets 'n' Color Palette »**](../punksdata)
TXT



buf = String.new('')

ASSETS_ENCODED.each do |rec|
  num  = rec[0]
  name = rec[1]

  ## slugify name e.g.
  ##   Male 1          => male_1
  ##   Clown Nose      => clown_nose
  ##   Regular Shades  => regular_shades
  slug = name.downcase.gsub( ' ', '_' )

  buf << "#{num} "
  buf << %Q{![](i/#{'%03d' % num}-#{slug}.png "#{name}")\n}
end




buf += <<TXT

In a Table

| No   |  24x24  | Name |
|------|---------|------|
TXT

ASSETS_ENCODED.each do |rec|
  num  = rec[0]
  name = rec[1]

  ## slugify name e.g.
  ##   Male 1          => male_1
  ##   Clown Nose      => clown_nose
  ##   Regular Shades  => regular_shades
  slug = name.downcase.gsub( ' ', '_' )

  buf << "| #{num} | ![](i/#{'%03d' % num}-#{slug}.png) |  #{name} |\n"
end


buf << "\n\n4x\n\n"

ASSETS_ENCODED.each do |rec|
  num  = rec[0]
  name = rec[1]

  slug = name.downcase.gsub( ' ', '_' )

  buf <<   "#{num} "
  buf <<   %Q{![](i/#{'%03d' % num}-#{slug}x4.png "#{name}")\n}
end


footer =<<TXT

Note:  Many attributes have two variants (male / female) - sometimes with a different
design and somtimes only with a different offset / placement:


- Rosy Cheeks         =>  [12, 128]
- Clown Hair Green    =>  [14, 104]  ![](i/014-clown_hair_green.png) / ![](i/104-clown_hair_green.png)
- Mohawk Dark         =>  [15, 130]  ![](i/015-mohawk_dark.png) / ![](i/130-mohawk_dark.png)
- Clown Nose          =>  [18, 109]  ![](i/018-clown_nose.png) / ![](i/109-clown_nose.png)
- Cigarette           =>  [19, 115]  ![](i/019-cigarette.png) / ![](i/115-cigarette.png)
- Nerd Glasses        =>  [20, 89]   ![](i/020-nerd_glasses.png) / ![](i/115-cigarette.png)
- Regular Shades      =>  [21, 82]   ![](i/021-regular_shades.png) / ![](i/082-regular_shades.png)
- Knitted Cap         =>  [22, 113]  ![](i/022-knitted_cap.png) / ![](i/113-knitted_cap.png)
- Mole                =>  [27, 85]
- Classic Shades      =>  [31, 102]  ![](i/031-classic_shades.png) / ![](i/102-classic_shades.png)
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
- Crazy Hair          =>  [50, 81]   ![](i/050-crazy_hair.png) / ![](i/081-crazy_hair.png)
- Spots               =>  [55, 87]
- Earring             =>  [61, 125]
- Horned Rim Glasses  =>  [62, 132]
- Headband            =>  [63, 110]  ![](i/063-headband.png) / ![](i/110-headband.png)
- Pipe                =>  [64, 95]   ![](i/064-pipe.png) / ![](i/095-pipe.png)
- Messy Hair          =>  [65, 93]   ![](i/065-messy_hair.png) / ![](i/093-messy_hair.png)
- Gold Chain          =>  [68, 118]
- Stringy Hair        =>  [70, 98]
- Eye Mask            =>  [71, 103]
- 3D Glasses          =>  [72, 84]   ![](i/072-3d_glasses.png) / ![](i/084-3d_glasses.png)
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
