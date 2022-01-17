###########
#  to run use:
#    ruby ./generate_10000.rb


require 'pixelart'

## read in punk composite
print "==> loading punks image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"


punks_vol2 = ImageComposite.new( 100, 100 )

##
## try nine background colors
##    of https://rarity.tools/fast-food-punks

RED       = '#F54245'    #   0.5% ->   50
ORANGE    = '#E25925'    #   1.0% ->  100
GOLD      = '#E39226'    #   1.6% ->  160
YELLOW    = '#FDD424'    #   2.0% ->  200
CYAN      = '#82DCDC'    #   2.5% ->  250
GREEN     = '#28B07E'    #   3.3% ->  330
PURPLE    = '#8E6FB5'    #   5.5% ->  550
BROWN     = '#925552'    #   9.0% ->  900
GRAY      = '#648596'    #  74.6% -> 7460

pp 7460+900+550+330+250+200+160+100+50
#=> 10000

punks.each_with_index do |punk,i|
  background =   case i
                  when 0..49      then  RED
                  when 50..149    then  ORANGE
                  when 150..309   then  GOLD
                  when 310..509   then  YELLOW
                  when 510..759   then  CYAN
                  when 760..1089  then  GREEN
                  when 1090..1639 then  PURPLE
                  when 1640..2539 then  BROWN
                  else                  GRAY
                  end

  img = Image.new( 24, 24, background )
  img.compose!( punk )

  punks_vol2 << img
end

print "==> saving punks volume 2 image..."
punks_vol2.save( "./tmp/punks_vol2.png" )
print "OK\n"


###
#  pass 2 - (random) shuffle punks
#               use seed for deterministic / repeatable (pseudo-random) shuffle
indexes = (0..9999).to_a
puts "  #{indexes.size} punk(s)"   #=> 10000 punk(s)

srand( 4142 )
indexes = indexes.shuffle


# print "==>  loading punk image..."
# punks_vol2 = ImageComposite.read( "./tmp/punks_vol2.png" )
# print "OK\n"

punks_vol2_shuffle = ImageComposite.new( 100, 100 )


indexes.each do |index|
  punks_vol2_shuffle <<  punks_vol2[ index ]
end

punks_vol2_shuffle.save( "./tmp/punks_vol2_shuffle.png" )


puts "  for reference the (random) shuffled ids:"
puts indexes.inspect



puts "bye"