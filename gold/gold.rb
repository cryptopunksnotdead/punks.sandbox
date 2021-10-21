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




base_m = Punks::Sheet.find_by( name: 'Ape' )
base_f = Punks::Sheet.find_by( name: 'Ape Female' )


dump_colors( base_m )

puts "gold:"

GOLD =  Color.from_hex( '#ffd700' )  # gold

puts "  #{Color.format( GOLD )}"
puts


base_m.zoom.save( "./tmp/ape_male.png" )
base_m.zoom( 8 ).save( "./tmp/ape_male@8x.png" )

base_f.zoom.save( "./tmp/ape_female.png" )
base_f.zoom( 8 ).save( "./tmp/ape_female@8x.png" )


composite = ImageComposite.new( 2, 3 )


darkest = GOLD

hsl  = Color.to_hsl( GOLD )
pp hsl

h, s, l = hsl
h = h % 360   # make always positive (might be -50 or such)
pp [h,s,l]


light = Color.from_hsl(
               (h+1)%360,
               s,
               [1.0,l+0.10].min)

darker = Color.from_hsl(
               (h+1)%360,
               [0.0,s-0.10].max,
               [0.0,l-0.10].max)

lighter = Color.from_hsl(
               (h+1)%360,
               s,
               [1.0,l+0.25].min)

color_map = {
  '#352410' =>  darkest,  # darkest (base!!)
  '#856f56'  => light,     # light
 '#6a563f' => darker,    # darker
 '#a98c6b' => lighter   # lighter
}


ape_m = base_m.change_colors( color_map )

composite << ape_m

ape_m.save( "./tmp/ape_male_gold.png" )
ape_m.zoom(4).save( "./tmp/ape_male_gold@4x.png" )


ape_f = base_f.change_colors( color_map )

composite << ape_f

ape_f.save( "./tmp/ape_female_gold.png" )
ape_f.zoom(4).save( "./tmp/ape_female_gold@4x.png" )



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



composite.save( "./tmp/apes.png" )
composite.zoom(2).save( "./tmp/apes@2x.png" )
composite.zoom(4).save( "./tmp/apes@4x.png" )




puts "bye"


__END__

gold:
           #ffd700 / rgb(255 215   0) - hsl( 51° 100%  50%)

base:
63 pixels #856f56 / rgb(133 111  86) - hsl( 32°  21%  43%)   # light
56 pixels #352410 / rgb( 53  36  16) - hsl( 32°  54%  14%)   # darkest (base!!)
4 pixels #6a563f / rgb(106  86  63) - hsl( 32°  25%  33%)    # darker
2 pixels #a98c6b / rgb(169 140 107) - hsl( 32°  26%  54%)    # lighter

385 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
66 pixels #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
