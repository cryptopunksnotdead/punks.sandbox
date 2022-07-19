$LOAD_PATH.unshift( "../../pixelart/backgrounds/lib" )

require 'pixelart'
require 'backgrounds'


####
#  try 11 base marc archetypes + 21 marc 1/1s

names = %w[
  marc/marc_2
  marc/marc_1
  marc/marc_4
  marc/marc_3
  marc/zombie
  marc/ape
  marc/alien
  marc/bot
  marc/gold
  marc/madlad
  marc/devil

  marc_1-1/marc_1
  marc_1-1/marc_3
  marc_1-1/marc_4
  marc_1-1/marc_5
  marc_1-1/marc_6
  marc_1-1/chad
  marc_1-1/cline
  marc_1-1/marcdonalds
  marc_1-1/marc_2
  marc_1-1/marc_7

  marc_1-1/zombie
  marc_1-1/ape
  marc_1-1/alien
  marc_1-1/bot
  marc_1-1/claudia_bot
  marc_1-1/gold
  marc_1-1/claudia_gold
  marc_1-1/madlad_marc
  marc_1-1/devil
  marc_1-1/deal_with_it_devil
  marc_1-1/pauly_devil

]

puts " #{names.size} marc(s)"


marcs = ImageComposite.new( 8, 4 )

names.each do |name|
  marc = Image.read( "./attributes/#{name}.png" )
  marcs << marc.background( 'usa' )
end

marcs.save( "./tmp/american_marcs.png" )
marcs.zoom(4).save( "./tmp/american_marcs@4x.png" )


puts "bye"