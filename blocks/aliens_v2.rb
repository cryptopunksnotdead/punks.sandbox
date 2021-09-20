###########
#  to run use:
#    ruby ./aliens_v2.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



def dump_colors( punk )
  punk.pixels.uniq.each_with_index do |color, i|
    print "[#{i}]  "
    print   Color.format( color )
    print "\n"
  end
end


names = [
  'alien-male',
  'alien-ape-male',
  'alien-female',
]

hues = [270, 240, 210,
180, 150, 120,
 90, 60, 30,
  0, 330, 300]


names.each do |name|
  punk = Image.read( "./i/#{name}.png" )

  puts "#{name}:"
  dump_colors( punk )

  hues.each do |hue|
    saturation_up   =  0.13
    lightness_down  =  0.30  ## note: is sub(tracted)
    color_map = {
        '#f1ffffff' => [hue, 1.0, 0.97-lightness_down],
        '#c8fbfbff' => [hue, 0.86+saturation_up, 0.88-lightness_down],
        '#75bdbdff' => [hue, 0.35+saturation_up, 0.60-lightness_down],
        '#9be0e0ff' => [hue, 0.53+saturation_up, 0.74-lightness_down],
    }

    new_punk = punk.change_colors( color_map )
    new_punk.save( "./tmp/#{name}_#{hue}.png")
    # new_punk.zoom(4).save( "./tmp/#{name}_#{hue}@4x.png")
  end
end


puts "bye"



__END__

alien-male.png colors:
[0]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
[1]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
[2]  #c8fbfb / rgb(200 251 251) - hsl(180°  86%  88%)
[3]  #f1ffff / rgb(241 255 255) - hsl(180° 100%  97%)
[4]  #75bdbd / rgb(117 189 189) - hsl(180°  35%  60%)
[5]  #9be0e0 / rgb(155 224 224) - hsl(180°  53%  74%)

alien-ape-male.png:
[0]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
[1]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
[2]  #c8fbfb / rgb(200 251 251) - hsl(180°  86%  88%)
[3]  #f1ffff / rgb(241 255 255) - hsl(180° 100%  97%)
[4]  #75bdbd / rgb(117 189 189) - hsl(180°  35%  60%)
[5]  #9be0e0 / rgb(155 224 224) - hsl(180°  53%  74%)

alien-female.png:
[0]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
[1]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
[2]  #c8fbfb / rgb(200 251 251) - hsl(180°  86%  88%)
[3]  #f1ffff / rgb(241 255 255) - hsl(180° 100%  97%)
[4]  #75bdbd / rgb(117 189 189) - hsl(180°  35%  60%)
[5]  #9be0e0 / rgb(155 224 224) - hsl(180°  53%  74%)
