###########################
#  generate 100x100 skintone composite images
#      1 pixel per punk in the classic 100 by 100 grid
#
#  to run use:
#    $ ruby skintone_composites.rb


require 'cryptopunks'


print "==> loading image..."
punks = Punks::Image::Composite.read( '../../programming-cryptopunks/punks.png' )
print "OK\n"



def calc_color_usage( punk )
  ##  calculate color histogram / usage by pixel
  usage = Hash.new(0)
  punk.pixels.each do |pixel|
    usage[ pixel ] += 1
  end
  usage
end

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
      when HUMAN_LIGHTER_BASE1   then return 'Lighter'
      when HUMAN_LIGHT_BASE1     then return 'Light'
      when HUMAN_DARK_BASE1      then return 'Dark'
      when HUMAN_DARKER_BASE1    then return 'Darker'
      end
    end
    '???'  # no skin tone basecolor found - possible?
end






### now try all male/female punks

## load csv dataset for meta data
recs = Punks::Dataset.read( '../../punks.attributes/original/*.csv' )

puts "  #{recs.size} punk metadata record(s)"
#=> 10000 punk metadata record(s)




ALIEN_COLOR  = Color.from_hex( '#c8fbfb' )     # color 4 - BASE 1
APE_COLOR    = Color.from_hex( '#352410' )     # color 2 - BASE 3  (DARKEST) use darkest for now - not color 4 (#856f56)- BASE 1
ZOMBIE_COLOR = Color.from_hex( '#7da269' )     # color 3 - BASE 1

HUMAN_LIGHTER_COLOR = Color.from_hex( '#ead9d9ff' )   # rgb(234 217 217) - hsl(  0°  29%  88%)
HUMAN_LIGHT_COLOR   = Color.from_hex( '#dbb180ff' )   # rgb(219 177 128) - hsl( 32°  56%  68%)
HUMAN_DARK_COLOR    = Color.from_hex( '#ae8b61ff' )   # rgb(174 139  97) - hsl( 33°  32%  53%)
HUMAN_DARKER_COLOR  = Color.from_hex( '#713f1dff' )   # rgb(113  63  29) - hsl( 24°  59%  28%)



####################
## version 1 - all 10 000 (incl. humans)

img = Image.new( 100, 100 )    ## new (empty) image 100x100 pixel


recs.each_with_index do |meta,i|
  print "."

  y,x =  i.divmod( 100 )   ## get x/y coords in 100x100 pixel matrix

  img[x,y] = case meta.type.name
             when 'Alien'  then ALIEN_COLOR
             when 'Ape'    then APE_COLOR
             when 'Zombie' then ZOMBIE_COLOR
             else  punk = punks[i]   ## get punk image from composite
                   skintone = find_skintone( calc_color_usage( punk ))
                   case skintone
                   when 'Lighter' then HUMAN_LIGHTER_COLOR
                   when 'Light'   then HUMAN_LIGHT_COLOR
                   when 'Dark'    then HUMAN_DARK_COLOR
                   when 'Darker'  then HUMAN_DARKER_COLOR
                   else   raise ArgumentError, "unexpected human skintone >#{skintone}<; sorry"
                   end
             end
end

img.save( "i/skintones.png" )
img.zoom(4).save( "i/skintones4x.png" )
img.zoom(8).save( "i/skintones8x.png" )



#########################
# version 2 - rarities only (alien, ape, zombie)

img = Image.new( 100, 100 )    ## new (empty) image 100x100 pixel


recs.each_with_index do |meta,i|
  print "."

  y,x =  i.divmod( 100 )   ## get x/y coords in 100x100 pixel matrix

  img[x,y] = case meta.type.name
             when 'Alien'  then ALIEN_COLOR
             when 'Ape'    then APE_COLOR
             when 'Zombie' then ZOMBIE_COLOR
             else    Color::WHITE
             end
end

img.save( "i/skintones-rarities.png" )
img.zoom(4).save( "i/skintones-rarities4x.png" )
img.zoom(8).save( "i/skintones-rarities8x.png" )



puts "bye"
