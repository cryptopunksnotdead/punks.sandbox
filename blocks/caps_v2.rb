###########
#  to run use:
#    ruby ./caps.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


def dump_colors( punk )
  punk.pixels.uniq.each_with_index do |color, i|
    print "[#{i}]  "
    print   Color.format( color )
    print "\n"
  end
end


hues = [270, 240, 210,
180, 150, 120,
 90, 60, 30,
  0, 330, 300]


[
  { name: 'cap', gender: 'm' },
  { name: 'cap', gender: 'f' },
].each do |attribute|
    name   = attribute[:name]
    gender = attribute[:gender]

    punk = Punks::Sheet.find_by( name: name, gender: gender )

    puts "==> #{name}:"
    dump_colors( punk )

    hues.each do |hue|
      color_map = {
        '#8119b7ff' => [hue,         0.76, 0.41],
        '#b261dcff' => [(hue+1)%360, 0.64 ,0.62],
      }

      new_punk = punk.change_colors( color_map )
      new_punk.save( "./tmp/#{name}/#{gender}/#{name}_#{hue}.png" )
      new_punk.zoom(4).save( "./tmp/#{name}/#{name}_#{hue}_(#{gender})@4x.png" )
    end
end



puts "bye"

__END__

cap_(m):
[0]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
[1]  #8119b7 / rgb(129  25 183) - hsl(279°  76%  41%)
[2]  #b261dc / rgb(178  97 220) - hsl(280°  64%  62%)

cap_(f):
[0]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
[1]  #8119b7 / rgb(129  25 183) - hsl(279°  76%  41%)
[2]  #b261dc / rgb(178  97 220) - hsl(280°  64%  62%)


