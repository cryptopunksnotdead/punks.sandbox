###############################
# to run use:
#    $  ruby ./gold.rb



require 'cryptopunks'



def dump_colors( punk )
  hist = Hash.new(0)
  punk.pixels.each do |color|
    hist[ color ] +=1
  end

  hist.each do |color, count|
    print "#{count} pixels "
    print   Color.format( color )
    print "\n"
  end
end




GOLD          =  Color.from_hex( '#ffd700' )
GOLDENROD     =  Color.from_hex( '#daa520' )
DARKGOLDENROD =  Color.from_hex( '#b8860b' )

puts "gold:"
puts "  #{Color.format( GOLD )}"
puts "goldenrod:"
puts "  #{Color.format( GOLDENROD )}"
puts "darkgoldenrod:"
puts "  #{Color.format( DARKGOLDENROD )}"
puts


colors = {
  'gold_1' =>  GOLD,
  'gold_2' =>  GOLDENROD,
  'gold_3' =>  DARKGOLDENROD
}



base_m = Punks::Sheet.find_by( name: 'Skeleton' )
base_f = Punks::Sheet.find_by( name: 'Skeleton Female' )

base_m.zoom.save( "./tmp/skeleton-male.png" )
base_m.zoom( 8 ).save( "./tmp/skeleton-male@8x.png" )

base_f.zoom.save( "./tmp/skeleton-female.png" )
base_f.zoom( 8 ).save( "./tmp/skeleton-female@8x.png" )


dump_colors( base_m )

def derive_skeleton_color_map( color )
# 122 pixels #e0e0e0 / rgb(224 224 224) - hsl(  0°   0%  88%)           - 8-BIT GRAYSCALE #224

# 385 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
#  69 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK

  base = color

  color_map = {
    '#e0e0e0' =>  base,
  }

  color_map
end



colors.each do |name, color|
  color_map = derive_skeleton_color_map( color )
  punk_m = base_m.change_colors( color_map )

  punk_m.save( "./tmp/skeleton-male_#{name}.png" )
  punk_m.zoom(4).save( "./tmp/skeleton-male_#{name}@4x.png" )


  punk_f = base_f.change_colors( color_map )

  punk_f.save( "./tmp/skeleton-female_#{name}.png" )
  punk_f.zoom(4).save( "./tmp/skeleton-female_#{name}@4x.png" )
end



base_m = Punks::Sheet.find_by( name: 'Demon' )
base_f = Punks::Sheet.find_by( name: 'Demon Female' )

base_m.zoom.save( "./tmp/demon-male.png" )
base_m.zoom( 8 ).save( "./tmp/demon-male@8x.png" )

base_f.zoom.save( "./tmp/demon-female.png" )
base_f.zoom( 8 ).save( "./tmp/demon-female@8x.png" )


dump_colors( base_m )

def derive_demon_color_map( color )
# 134 pixels #850008 / rgb(133   0   8) - hsl(356° 100%  26%)  - base
#   2 pixels #630006 / rgb( 99   0   6) - hsl(356° 100%  19%)  - darker
#   4 pixels #390102 / rgb( 57   1   2) - hsl(359°  97%  11%)  - darkest
#
# 373 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
#  63 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK

base = color

hsl  = Color.to_hsl( color )
pp hsl

h, s, l = hsl
h = h % 360   # make always positive (might be -50 or such)
pp [h,s,l]

darker = Color.from_hsl(
  h,
  s,
  [0.0,l-0.08].max)

darkest = Color.from_hsl(
  (h+2)%360,
  [0.0,s-0.05].max,
  [0.0,l-0.15].max)


color_map = {
    '#850008' =>  base,
    '#630006' => darker,
    '#390102' => darkest,
}

color_map
end


colors.each do |name, color|
  color_map = derive_demon_color_map( color )
  punk_m = base_m.change_colors( color_map )

  punk_m.save( "./tmp/demon-male_#{name}.png" )
  punk_m.zoom(4).save( "./tmp/demon-male_#{name}@4x.png" )


  punk_f = base_f.change_colors( color_map )

  punk_f.save( "./tmp/demon-female_#{name}.png" )
  punk_f.zoom(4).save( "./tmp/demon-female_#{name}@4x.png" )
end




base_m = Punks::Sheet.find_by( name: 'Alien' )
base_f = Punks::Sheet.find_by( name: 'Alien Female' )

base_m.zoom.save( "./tmp/alien-male.png" )
base_m.zoom( 8 ).save( "./tmp/alien-male@8x.png" )

base_f.zoom.save( "./tmp/alien-female.png" )
base_f.zoom( 8 ).save( "./tmp/alien-female@8x.png" )


dump_colors( base_m )

def derive_alien_color_map( color )

# 2 pixels #f1ffff / rgb(241 255 255) - hsl(180° 100%  97%)  - lighter
# 125 pixels #c8fbfb / rgb(200 251 251) - hsl(180°  86%  88%)   - base (use as base)
#  6 pixels #9be0e0 / rgb(155 224 224) - hsl(180°  53%  74%)   - darker
#  2 pixels #75bdbd / rgb(117 189 189) - hsl(180°  35%  60%)  - darkest

base = color

hsl  = Color.to_hsl( color )
pp hsl

h, s, l = hsl
h = h % 360   # make always positive (might be -50 or such)
pp [h,s,l]

## todo/check - check "formula" used in skintones script for humans!!!
lighter = Color.from_hsl(
   (h+1)%360,   # todo/check: make lighter by -1 on hue? or +1????
   [1.0,s+0.10].min,
   [1.0,l+0.25].min)


darker = Color.from_hsl(
  h,
  [0.0,s-0.05].max,
  [0.0,l-0.10].max)

darkest = Color.from_hsl(
  h,
  [0.0,s-0.10].max,
  [0.0,l-0.20].max)


color_map = {
    '#c8fbfb' =>  base,
    '#f1ffff' => lighter,
    '#9be0e0' => darker,
    '#75bdbd' => darkest,
}

color_map
end


colors.each do |name, color|
  color_map = derive_alien_color_map( color )
  punk_m = base_m.change_colors( color_map )

  punk_m.save( "./tmp/alien-male_#{name}.png" )
  punk_m.zoom(4).save( "./tmp/alien-male_#{name}@4x.png" )


  punk_f = base_f.change_colors( color_map )

  punk_f.save( "./tmp/alien-female_#{name}.png" )
  punk_f.zoom(4).save( "./tmp/alien-female_#{name}@4x.png" )
end





base_m = Punks::Sheet.find_by( name: 'Zombie' )
base_f = Punks::Sheet.find_by( name: 'Zombie Female' )


base_m.zoom.save( "./tmp/zombie-male.png" )
base_m.zoom( 8 ).save( "./tmp/zombie-male@8x.png" )

base_f.zoom.save( "./tmp/zombie-female.png" )
base_f.zoom( 8 ).save( "./tmp/zombie-female@8x.png" )


dump_colors( base_m )

def derive_zombie_color_map( color )

#    2 pixels #9bbc88 / rgb(155 188 136) - hsl( 98°  28%  64%)  - lighter
#  125 pixels #7da269 / rgb(125 162 105) - hsl( 99°  23%  52%) - base  (use as base)
#    7 pixels #5e7253 / rgb( 94 114  83) - hsl( 99°  16%  39%)  - darker

  base = color

  hsl  = Color.to_hsl( color )
  pp hsl

  h, s, l = hsl
  h = h % 360   # make always positive (might be -50 or such)
  pp [h,s,l]

  darker = Color.from_hsl(
    h,
    [0.0,s-0.05].max,
    [0.0,l-0.12].max)

  ## todo/check - check "formula" used in skintones script for humans!!!
  lighter = Color.from_hsl(
     (h+1)%360,   # todo/check: make lighter by -1 on hue? or +1????
     [1.0,s+0.10].min,
     [1.0,l+0.25].min)


  color_map = {
      '#7da269' =>  base,
      '#5e7253' => darker,
      '#9bbc88' => lighter
  }

  color_map
end


colors.each do |name, color|
  color_map = derive_zombie_color_map( color )
  zombie_m = base_m.change_colors( color_map )

  zombie_m.save( "./tmp/zombie-male_#{name}.png" )
  zombie_m.zoom(4).save( "./tmp/zombie-male_#{name}@4x.png" )


  zombie_f = base_f.change_colors( color_map )

  zombie_f.save( "./tmp/zombie-female_#{name}.png" )
  zombie_f.zoom(4).save( "./tmp/zombie-female_#{name}@4x.png" )
end






base_m = Punks::Sheet.find_by( name: 'Ape' )
base_f = Punks::Sheet.find_by( name: 'Ape Female' )

base_m.zoom.save( "./tmp/ape-male.png" )
base_m.zoom( 8 ).save( "./tmp/ape-male@8x.png" )

base_f.zoom.save( "./tmp/ape-female.png" )
base_f.zoom( 8 ).save( "./tmp/ape-female@8x.png" )


dump_colors( base_m )



def derive_ape_color_map( color )
  darkest = color

  hsl  = Color.to_hsl( color )
  pp hsl

  h, s, l = hsl
  h = h % 360   # make always positive (might be -50 or such)
  pp [h,s,l]

  darker = Color.from_hsl(
    h,
    s,
    [1.0,l+0.05].min)

  light = Color.from_hsl(
     (h+1)%360,
     [1.0,s+0.10].min,
     [1.0,l+0.20].min)

  lighter = Color.from_hsl(
    (h+1)%360,
    [1.0,s+0.20].min,
    [1.0,l+0.35].min)

  color_map = {
      '#352410' =>  darkest,  # darkest  - 56 pixels (base!!)
      '#6a563f' => darker,    # darker   -  4 pixels
      '#856f56' => light,     # light    - 63 pixels
      '#a98c6b' => lighter    # lighter
  }

  color_map
end




colors.each do |name, color|
   color_map = derive_ape_color_map( color )
   ape_m = base_m.change_colors( color_map )

   ape_m.save( "./tmp/ape-male_#{name}.png" )
   ape_m.zoom(4).save( "./tmp/ape-male_#{name}@4x.png" )


   ape_f = base_f.change_colors( color_map )

   ape_f.save( "./tmp/ape-female_#{name}.png" )
   ape_f.zoom(4).save( "./tmp/ape-female_#{name}@4x.png" )
end


puts "bye"



__END__

gold:
           #ffd700 / rgb(255 215   0) - hsl( 51° 100%  50%)
goldenrod:
           #daa520 / rgb(218 165  32) - hsl( 43°  74%  49%)
darkgoldenrod:
           #b8860b / rgb(184 134  11) - hsl( 43°  89%  38%)

ape base:
  2 pixels #a98c6b / rgb(169 140 107) - hsl( 32°  26%  54%)   # lighter
 63 pixels #856f56 / rgb(133 111  86) - hsl( 32°  21%  43%)   # light

  4 pixels #6a563f / rgb(106  86  63) - hsl( 32°  25%  33%)   # darker
 56 pixels #352410 / rgb( 53  36  16) - hsl( 32°  54%  14%)   # darkest  (use as base!!)

385 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
 66 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK


 zombie base:
 2 pixels #9bbc88 / rgb(155 188 136) - hsl( 98°  28%  64%)  - lighter
 125 pixels #7da269 / rgb(125 162 105) - hsl( 99°  23%  52%) - base  (use as base)
  7 pixels #5e7253 / rgb( 94 114  83) - hsl( 99°  16%  39%)  - darker
  2 pixels #ff0000 / rgb(255   0   0) - hsl(  0° 100%  50%)    - red eyes

385 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
 55 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK


  alien base:
  2 pixels #f1ffff / rgb(241 255 255) - hsl(180° 100%  97%)  - lighter
125 pixels #c8fbfb / rgb(200 251 251) - hsl(180°  86%  88%)   - base (use as base)
  6 pixels #9be0e0 / rgb(155 224 224) - hsl(180°  53%  74%)   - darker
  2 pixels #75bdbd / rgb(117 189 189) - hsl(180°  35%  60%)  - darkest

383 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
  58 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
