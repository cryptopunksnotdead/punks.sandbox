$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


#########
##
#  todo/fix:
##   change basehair image color
##    from black to gray!!!
##    why? let's us use black as a "pass-throug" color
##       as used in same base images - use/change - why? why not?
##
## todo/fix:  use a red pixel color or such
##                 for pixels that will always stay black
##                  and NOT get recolored
##                  e.g. recheck in vampire? and others?



def dump_colors( img )
  img.pixels.uniq.each_with_index do |color, i|
    print "[#{i}]  "
    print   Color.format( color )
    print "\n"
  end
end




hair = Image.read( "./f/frumpy.png" )
puts "f/frumpy:"
dump_colors ( hair )


colors = {
  'black'  => '000000',
  'brown'     => '431904',

  'darkred'   => '6B0004',
  'orange'    => 'D22B0A',
  'red'        => 'F6000B',
  'pink'       => 'FC4C50',

  'purple'    => '6B006D',
  'blue'      => '0000FF',
  'periwinkle' => '5248FF',
  'lightblue'  => '57C0FF',
  'lightgreen' => '5BFFC1',
  'green'     => '157004',
  'teal'      => '146E6D',

  'blonde' => 'FFFF54',
  'silver' => 'E0E0E0',
  'white'  => 'FFFFFF',
}.reduce( {} ) do |h, (name, color_hex)|
      h[ name ] = Color.from_hex( color_hex )
      h
end



colors.each do |name, color|
  puts "  #{name}  - #{Color.format( color )}"
end



def colorize( glob, colors: )

files = Dir.glob( glob )
files.each do |file|
  basedir  = File.basename( File.dirname( file ))  ## e.g. f or m or such expected
  basename = File.basename( file, File.extname( file ))

  basehair = Image.read( file )

  colors.each do |name, color|
    puts "==> #{name} - #{Color.format( color )}:"

    h,s,l = Color.to_hsl( color, include_alpha: false )
    h = h % 360    ## make sure h(ue) is always positive!!!
    puts "    #{[h,s,l].inspect}"

    hair = basehair.change_colors( {
             '000000ff' => color,
             '2a2a2aff' => Color.from_hsl( h, [1.0, s].min, [1.0, l+0.16].min ),
          })
    hair.save( "./tmp/#{basedir}/#{name}/#{basename}.png" )
    hair.zoom(4).save( "./tmp/4x/#{basename}_(#{basedir})_#{name}@4x.png" )
  end
end
end


colorize( './f/*.png', colors: colors )
colorize( './m/*.png', colors: colors )




styles = {
 'Afro'        => %w[m f],
 'Big'         => %w[m f],
 'Bob'         => %w[f],
 'Buzz Cut'    => %w[m f],
 'Clown'       => %w[m f],
 'Crazy'       => %w[m f],
 'Faux Hawk'   => %w[m],
 'Frumpy'      => %w[m f],
 'Half Shaved' => %w[f],

 'Heart'      => %w[f],
 'Long'       => %w[m],
 'Long Curly' => %w[f],
 'Messy'      => %w[m f],
 'Mohawk'     => %w[m f],
 'Peak Spike' => %w[m],
 'Pigtails'   => %w[f],
 'Pixie'      => %w[f],
 'Short'      => %w[m f],
 'Side'       => %w[f],
 'Straight 1' => %w[f],
 'Straight 2' => %w[f],

 'Stringy'      => %w[m f],
 "Widow's Peak" => %w[m],
 'Wild 1'       => %w[m f],  ## was Wild Blonde in basic
 'Wild 2'       => %w[f],    ## was Wild Hair in basic
 'Wild 3'       => %w[f],    ## was Wild White Hair in basic

 'Style 1'      => %w[m f],  ## was Purple Hair in basic
 'Style 2'      => %w[f],    ## was Blonde Bob in basic
 'Style 3'      => %w[f],    ## was Dark Hair in basic
}


styles.each do |name, variants|

  slug = name.downcase.gsub( /[ '-]/, '' ).strip

  print "#{name} "
  print "(#{variants.join('/')}) "
  variants.each do |variant|
    print " ![](hair/#{variant}/black/#{slug}.png)"
  end
  print "\n\n"

  variants.each do |variant|
    colors.each do |color_name, _|
      next if color_name == 'black'
      puts "  ![](hair/#{variant}/#{color_name}/#{slug}.png)"
    end
    puts "  <br>"
  end
  puts "\n\n"
end



puts "bye"

__END__


f/frumpy:
[0]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
[1]  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
[2]  #2a2a2a / rgb( 42  42  42) - hsl(  0°   0%  16%)           - 8-BIT GRAYSCALE #42



blonde      - #ffff54 / rgb(255 255  84) - hsl( 60° 100%  66%)
orange      - #d22b0a / rgb(210  43  10) - hsl( 10°  91%  43%)
brown       - #431904 / rgb( 67  25   4) - hsl( 20°  89%  14%)
lightblue   - #57c0ff / rgb( 87 192 255) - hsl(203° 100%  67%)
pink        - #fc4c50 / rgb(252  76  80) - hsl(359°  97%  64%)
lightgreen  - #5bffc1 / rgb( 91 255 193) - hsl(157° 100%  68%)
red         - #f6000b / rgb(246   0  11) - hsl(357° 100%  48%)
periwinkle  - #5248ff / rgb( 82  72 255) - hsl(243° 100%  64%)
purple      - #6b006d / rgb(107   0 109) - hsl(299° 100%  21%)
blue        - #0000ff / rgb(  0   0 255) - hsl(240° 100%  50%)
darkred     - #6b0004 / rgb(107   0   4) - hsl(358° 100%  21%)
green       - #157004 / rgb( 21 112   4) - hsl(111°  93%  23%)
teal        - #146e6d / rgb( 20 110 109) - hsl(179°  69%  25%)
silver      - #e0e0e0 / rgb(224 224 224) - hsl(  0°   0%  88%)           - 8-BIT GRAYSCALE #224
black       - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
white       - #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE
