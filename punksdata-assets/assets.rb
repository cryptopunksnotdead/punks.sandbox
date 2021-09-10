##################################
#  generate all 133 assets as 24x24 images (archetypes 'n' attributes)
#
# to run use:
#     $ ruby ./assets.rb



require 'pixelart'

require_relative 'punksdata'



hex = COLORS_ENCODED
colors = decode_colors( hex )



ASSETS_ENCODED.each do |rec|
  num  = rec[0]
  name = rec[1]
  hex  = rec[2]

  img = decode_image( hex, colors: colors )

  ## slugify name e.g.
  ##   Male 1          => male_1
  ##   Clown Nose      => clown_nose
  ##   Regular Shades  => regular_shades
  slug = name.downcase.gsub( ' ', '_' )

  img.save( "i/#{'%03d' % num}-#{slug}.png" )
  img.zoom(4).save( "i/#{'%03d' % num}-#{slug}x4.png" )
end




#########################
## Bonus: check for duplicate name usage
assets_by_name = {}

ASSETS_ENCODED.each do |rec|
  num  = rec[0]
  name = rec[1]
  hex  = rec[2]

  stat = assets_by_name[ name ] ||= []
  stat << num
end

# pretty print duplicate names
assets_by_name.each do |name, nums|
   next if nums.size == 1

   puts "#{'%-18s' % name}  =>  #{nums.inspect}"
end


puts "bye"



__END__

Rosy Cheeks         =>  [12, 128]
Clown Hair Green    =>  [14, 104]
Mohawk Dark         =>  [15, 130]
Clown Nose          =>  [18, 109]
Cigarette           =>  [19, 115]
Nerd Glasses        =>  [20, 89]
Regular Shades      =>  [21, 82]
Knitted Cap         =>  [22, 113]
Mole                =>  [27, 85]
Classic Shades      =>  [31, 102]
Vape                =>  [32, 120]
Silver Chain        =>  [33, 133]
Big Shades          =>  [35, 124]
Mohawk Thin         =>  [36, 117]
Cap                 =>  [38, 105]
Clown Eyes Green    =>  [39, 114]
Medical Mask        =>  [41, 106]
VR                  =>  [43, 119]
Eye Patch           =>  [44, 100]
Wild Hair           =>  [45, 96]
Bandana             =>  [47, 107]
Frumpy Hair         =>  [49, 88]
Crazy Hair          =>  [50, 81]
Spots               =>  [55, 87]
Earring             =>  [61, 125]
Horned Rim Glasses  =>  [62, 132]
Headband            =>  [63, 110]
Pipe                =>  [64, 95]
Messy Hair          =>  [65, 93]
Gold Chain          =>  [68, 118]
Stringy Hair        =>  [70, 98]
Eye Mask            =>  [71, 103]
3D Glasses          =>  [72, 84]
Clown Eyes Blue     =>  [73, 94]
Mohawk              =>  [74, 123]

