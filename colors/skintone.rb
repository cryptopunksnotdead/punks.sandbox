require 'cryptopunks'


print "==> loading image..."
punks = Punks::Image::Composite.read( './punks.png' )
print "OK\n"


# puts "    #{punks.width}x#{punks.height}"


## note:  add alpha channel (255/ff) to color to make rgba
HUMAN_LIGHTER_BASE1 = 0xead9d9ff   # rgb(234 217 217) - hsl(  0°  29%  88%)
HUMAN_LIGHT_BASE1   = 0xdbb180ff   # rgb(219 177 128) - hsl( 32°  56%  68%)
HUMAN_DARK_BASE1    = 0xae8b61ff   # rgb(174 139  97) - hsl( 33°  32%  53%)
HUMAN_DARKER_BASE1  = 0x713f1dff   # rgb(113  63  29) - hsl( 24°  59%  28%)


def find_skintone( usage )
  ## todo/check: maybe sort by count first
  ##   if more than one color match possible (than higher pixel count wins)
   usage.each do |color, _|
      case color
      when HUMAN_LIGHTER_BASE1   then return 'LIGHTER'
      when HUMAN_LIGHT_BASE1     then return 'LIGHT'
      when HUMAN_DARK_BASE1      then return 'DARK'
      when HUMAN_DARKER_BASE1    then return 'DARKER'
      end
    end
    '???'  # no skin tone basecolor found - possible?
end


def calc_color_usage( punk )
  ##  calculate color histogram / usage by pixel
  usage = Hash.new(0)
  punk.pixels.each do |pixel|
    usage[ pixel ] += 1
  end
  usage
end


## example
  ##  calculate color histogram / usage by pixel
##    for punk #870

punk = punks[870]

usage = calc_color_usage( punk )
pp usage
#=> {0=>408,
#    4294348543=>57,
#    3685843199=>76,
#    2792238335=>4,
#    255=>26,
#    3533529343=>2,
#    1896878335=>3}

usage.each do |color, count|
  print "#{count}  - "
  print Color.format( color )
  print "\n"
end
#=> 408  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
# 57  - #fff68e / rgb(255 246 142) - hsl( 55° 100%  78%)
# 76  - #dbb180 / rgb(219 177 128) - hsl( 32°  56%  68%)
# 4  - #a66e2c / rgb(166 110  44) - hsl( 32°  58%  41%)
# 26  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
# 2  - #d29d60 / rgb(210 157  96) - hsl( 32°  56%  60%)
# 3  - #711010 / rgb(113  16  16) - hsl(  0°  75%  25%)

skintone = find_skintone( usage )
p skintone
#=> "LIGHT"


## try punk #1
skintone = find_skintone( calc_color_usage( punks[1] ))
p skintone
#=> "DARK"




### now try all male/female punks

## load csv dataset for meta data
recs = Punks::Dataset.read( './punks/*.csv' )

puts "  #{recs.size} punk metadata record(s)"
#=> 10000 punk metadata record(s)


counter = {}
recs.each_with_index do |meta,i|
  print "."

  ## skip if not male/female
  next if ['Alien', 'Zombie', 'Ape'].include?( meta.type.name )

   punk = punks[i]   ## get punk image from composite

   skintone = find_skintone( calc_color_usage( punk ))
   print skintone
   print " "

   stat = counter[skintone] ||= { count: 0,
                                  by_type: Hash.new(0) }
   stat[ :count ] += 1
   stat[ :by_type ][ meta.type.name ] += 1
end
print "\n"

#=> .DARK .DARK .LIGHT .DARK .DARK .DARK .DARK .DARK .DARK .DARK .DARK
#   .DARK .DARK .LIGHT .DARK .LIGHTER .DARK .LIGHT .DARK .DARK .LIGHT
#   .LIGHT .DARK .LIGHT .LIGHT .DARK .DARK .LIGHT .DARK .DARK .DARK
#   .DARK .LIGHT .LIGHT .LIGHT .DARK .DARK .DARK .LIGHT .LIGHT .LIGHT
#   ...

pp counter
#=> {"DARK"=>{:count=>3031, :by_type=>{"Female"=>1174, "Male"=>1857}},
#    "DARKER"=>{:count=>2824, :by_type=>{"Male"=>1723, "Female"=>1101}},
#    "LIGHT"=>{:count=>3006, :by_type=>{"Female"=>1145, "Male"=>1861}},
#    "LIGHTER"=>{:count=>1018, :by_type=>{"Male"=>598, "Female"=>420}}}


puts "bye"
