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


dump_colors( base_m )


base_m.zoom.save( "./tmp/skeleton_male.png" )
base_m.zoom( 8 ).save( "./tmp/skeleton_male@8x.png" )

base_f.zoom.save( "./tmp/skeleton_female.png" )
base_f.zoom( 8 ).save( "./tmp/skeleton_female@8x.png" )


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


composite = ImageComposite.new( 6, 3 )

colors.each do |name, color|
  color_map = derive_skeleton_color_map( color )
  punk_m = base_m.change_colors( color_map )

  composite << punk_m

  punk_m.save( "./tmp/skeleton_male_#{name}.png" )
  punk_m.zoom(4).save( "./tmp/skeleton_male_#{name}@4x.png" )


  punk_f = base_f.change_colors( color_map )

  composite << punk_f

  punk_f.save( "./tmp/skeleton_female_#{name}.png" )
  punk_f.zoom(4).save( "./tmp/skeleton_female_#{name}@4x.png" )


  punk = Image.new( 24, 24 )
  punk.compose!( punk_m )
  punk.compose!( Punks::Sheet.find_by( name: 'Big Hair Blonde', gender: 'm' ))
  composite << punk

  punk = Image.new( 24, 24 )
  punk.compose!( punk_f )
  punk.compose!( Punks::Sheet.find_by( name: 'Blonde Bob', gender: 'f' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Flowers', gender: 'f' ))
  composite << punk


  punk = Image.new( 24, 24 )
  punk.compose!( punk_m )
  punk.compose!( Punks::Sheet.find_by( name: 'Sun Hat', gender: 'm' ))
  punk.compose!( Punks::Sheet.find_by( name: '3D Glasses', gender: 'm' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'm' ))
  composite << punk

  punk = Image.new( 24, 24 )
  punk.compose!( punk_f )
  punk.compose!( Punks::Sheet.find_by( name: 'Sun Hat', gender: 'f' ))
  punk.compose!( Punks::Sheet.find_by( name: '3D Glasses', gender: 'f' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'f' ))
  composite << punk
end


composite.save( "./tmp/skeletons.png" )
composite.zoom(2).save( "./tmp/skeletons@2x.png" )
composite.zoom(4).save( "./tmp/skeletons@4x.png" )








__END__

base_m = Punks::Sheet.find_by( name: 'Demon' )
base_f = Punks::Sheet.find_by( name: 'Demon Female' )


dump_colors( base_m )


base_m.zoom.save( "./tmp/demon_male.png" )
base_m.zoom( 8 ).save( "./tmp/demon_male@8x.png" )

base_f.zoom.save( "./tmp/demon_female.png" )
base_f.zoom( 8 ).save( "./tmp/demon_female@8x.png" )


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


composite = ImageComposite.new( 6, 3 )

colors.each do |name, color|
  color_map = derive_demon_color_map( color )
  punk_m = base_m.change_colors( color_map )

  composite << punk_m

  punk_m.save( "./tmp/demon_male_#{name}.png" )
  punk_m.zoom(4).save( "./tmp/demon_male_#{name}@4x.png" )


  punk_f = base_f.change_colors( color_map )

  composite << punk_f

  punk_f.save( "./tmp/demon_female_#{name}.png" )
  punk_f.zoom(4).save( "./tmp/demon_female_#{name}@4x.png" )


  punk = Image.new( 24, 24 )
  punk.compose!( punk_m )
  punk.compose!( Punks::Sheet.find_by( name: 'Heart Shades', gender: 'm' ))
  composite << punk

  punk = Image.new( 24, 24 )
  punk.compose!( punk_f )
  punk.compose!( Punks::Sheet.find_by( name: 'Heart Shades', gender: 'f' ))
  composite << punk


  punk = Image.new( 24, 24 )
  punk.compose!( punk_m )
  punk.compose!( Punks::Sheet.find_by( name: 'Sombrero', gender: 'm' ))
  punk.compose!( Punks::Sheet.find_by( name: '3D Glasses', gender: 'm' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'm' ))
  composite << punk

  punk = Image.new( 24, 24 )
  punk.compose!( punk_f )
  punk.compose!( Punks::Sheet.find_by( name: 'Sombrero', gender: 'f' ))
  punk.compose!( Punks::Sheet.find_by( name: '3D Glasses', gender: 'f' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'f' ))
  composite << punk
end


composite.save( "./tmp/demons.png" )
composite.zoom(2).save( "./tmp/demons@2x.png" )
composite.zoom(4).save( "./tmp/demons@4x.png" )







__END__




base_m = Punks::Sheet.find_by( name: 'Alien' )
base_f = Punks::Sheet.find_by( name: 'Alien Female' )


dump_colors( base_m )


base_m.zoom.save( "./tmp/alien_male.png" )
base_m.zoom( 8 ).save( "./tmp/alien_male@8x.png" )

base_f.zoom.save( "./tmp/alien_female.png" )
base_f.zoom( 8 ).save( "./tmp/alien_female@8x.png" )


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


composite = ImageComposite.new( 6, 3 )

colors.each do |name, color|
  color_map = derive_alien_color_map( color )
  punk_m = base_m.change_colors( color_map )

  composite << punk_m

  punk_m.save( "./tmp/alien_male_#{name}.png" )
  punk_m.zoom(4).save( "./tmp/alien_male_#{name}@4x.png" )


  punk_f = base_f.change_colors( color_map )

  composite << punk_f

  punk_f.save( "./tmp/alien_female_#{name}.png" )
  punk_f.zoom(4).save( "./tmp/alien_female_#{name}@4x.png" )


  punk = Image.new( 24, 24 )
  punk.compose!( punk_m )
  punk.compose!( Punks::Sheet.find_by( name: 'Birthday Hat', gender: 'm' ))
  composite << punk

  punk = Image.new( 24, 24 )
  punk.compose!( punk_f )
  punk.compose!( Punks::Sheet.find_by( name: 'Flowers', gender: 'f' ))
  composite << punk


  punk = Image.new( 24, 24 )
  punk.compose!( punk_m )
  punk.compose!( Punks::Sheet.find_by( name: 'Cap Forward', gender: 'm' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Small Shades', gender: 'm' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'm' ))
  composite << punk

  punk = Image.new( 24, 24 )
  punk.compose!( punk_f )
  punk.compose!( Punks::Sheet.find_by( name: 'Cap Forward', gender: 'f' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Small Shades', gender: 'f' ))
  punk.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'f' ))
  composite << punk
end


composite.save( "./tmp/aliens.png" )
composite.zoom(2).save( "./tmp/aliens@2x.png" )
composite.zoom(4).save( "./tmp/aliens@4x.png" )









__END__


base_m = Punks::Sheet.find_by( name: 'Zombie' )
base_f = Punks::Sheet.find_by( name: 'Zombie Female' )


dump_colors( base_m )


base_m.zoom.save( "./tmp/zombie_male.png" )
base_m.zoom( 8 ).save( "./tmp/zombie_male@8x.png" )

base_f.zoom.save( "./tmp/zombie_female.png" )
base_f.zoom( 8 ).save( "./tmp/zombie_female@8x.png" )


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


composite = ImageComposite.new( 6, 3 )

colors.each do |name, color|
  color_map = derive_zombie_color_map( color )
  zombie_m = base_m.change_colors( color_map )

  composite << zombie_m

  zombie_m.save( "./tmp/zombie_male_#{name}.png" )
  zombie_m.zoom(4).save( "./tmp/zombie_male_#{name}@4x.png" )


  zombie_f = base_f.change_colors( color_map )

  composite << zombie_f

  zombie_f.save( "./tmp/zombie_female_#{name}.png" )
  zombie_f.zoom(4).save( "./tmp/zombie_female_#{name}@4x.png" )


  zombie = Image.new( 24, 24 )
  zombie.compose!( zombie_m )
  zombie.compose!( Punks::Sheet.find_by( name: 'Crazy Hair', gender: 'm' ))
  composite << zombie

  zombie = Image.new( 24, 24 )
  zombie.compose!( zombie_f )
  zombie.compose!( Punks::Sheet.find_by( name: 'Crazy Hair', gender: 'f' ))
  composite << zombie


  zombie = Image.new( 24, 24 )
  zombie.compose!( zombie_m )
  zombie.compose!( Punks::Sheet.find_by( name: 'Wild Hair', gender: 'm' ))
  zombie.compose!( Punks::Sheet.find_by( name: '3D Glasses', gender: 'm' ))
  zombie.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'm' ))
  composite << zombie

  zombie = Image.new( 24, 24 )
  zombie.compose!( zombie_f )
  zombie.compose!( Punks::Sheet.find_by( name: 'Wild Hair', gender: 'f' ))
  zombie.compose!( Punks::Sheet.find_by( name: '3D Glasses', gender: 'f' ))
  zombie.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'f' ))
  composite << zombie
end


composite.save( "./tmp/zombies.png" )
composite.zoom(2).save( "./tmp/zombies@2x.png" )
composite.zoom(4).save( "./tmp/zombies@4x.png" )






__END__


base_m = Punks::Sheet.find_by( name: 'Ape' )
base_f = Punks::Sheet.find_by( name: 'Ape Female' )


dump_colors( base_m )


base_m.zoom.save( "./tmp/ape_male.png" )
base_m.zoom( 8 ).save( "./tmp/ape_male@8x.png" )

base_f.zoom.save( "./tmp/ape_female.png" )
base_f.zoom( 8 ).save( "./tmp/ape_female@8x.png" )


composite = ImageComposite.new( 6, 3 )



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

   composite << ape_m

   ape_m.save( "./tmp/ape_male_#{name}.png" )
   ape_m.zoom(4).save( "./tmp/ape_male_#{name}@4x.png" )


   ape_f = base_f.change_colors( color_map )

   composite << ape_f

   ape_f.save( "./tmp/ape_female_#{name}.png" )
   ape_f.zoom(4).save( "./tmp/ape_female_#{name}@4x.png" )


   ape = Image.new( 24, 24 )
   ape.compose!( ape_m )
   ape.compose!( Punks::Sheet.find_by( name: 'Knitted Cap', gender: 'm' ))
   composite << ape

   ape = Image.new( 24, 24 )
   ape.compose!( ape_f )
   ape.compose!( Punks::Sheet.find_by( name: 'Knitted Cap', gender: 'f' ))
   composite << ape


   ape = Image.new( 24, 24 )
   ape.compose!( ape_m )
   ape.compose!( Punks::Sheet.find_by( name: 'Cap Forward', gender: 'm' ))
   ape.compose!( Punks::Sheet.find_by( name: '3D Glasses', gender: 'm' ))
   ape.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'm' ))
   composite << ape

   ape = Image.new( 24, 24 )
   ape.compose!( ape_f )
   ape.compose!( Punks::Sheet.find_by( name: 'Cap Forward', gender: 'f' ))
   ape.compose!( Punks::Sheet.find_by( name: '3D Glasses', gender: 'f' ))
   ape.compose!( Punks::Sheet.find_by( name: 'Pipe', gender: 'f' ))
   composite << ape
end


composite.save( "./tmp/apes.png" )
composite.zoom(2).save( "./tmp/apes@2x.png" )
composite.zoom(4).save( "./tmp/apes@4x.png" )




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
