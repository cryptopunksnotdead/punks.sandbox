###########
#   Pride Punks with Pride / Rainbow Backgrounds  ("Pridepunks (2018) Style")
#
#  to run use:
#    ruby ./generate_100_ii.rb


require 'pixelart'


## read in right-facing punk composite
print "==> loading right-facing image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"



rainbow1 = Image.read( "./i/rainbow1-24x24.png" )
rainbow2 = Image.read( "./i/rainbow2-24x24.png" )
rainbow3 = Image.read( "./i/rainbow3-24x24.png" )
rainbow4 = Image.read( "./i/rainbow4-24x24.png" )


## use the  pattern (reapeating every 10 punks) by pridepunks (2018)
backgrounds = [
  rainbow1,
  rainbow2,
  rainbow3,
  rainbow1,
  rainbow2,
  rainbow3,
  rainbow4,
  rainbow1,
  rainbow2,
  rainbow1,
]


## 10x10 = 100 punks (cols x rows) - plus extra heading row; create an empty composite
composite = ImageComposite.new( 10, 11 )

##  first-row - add backgrounds only (no punks)
backgrounds.each do |background|
  composite << background
end


punks.each_with_index do |base,i|
  break if i >= 100

  background = backgrounds[i % 10]
  punk = Image.new( 24, 24 )
  punk.compose!( background )
  punk.compose!( base )

  composite << punk
end


print "==> saving pride punk image..."
composite.save( "./tmp/pridepunks-ii.png" )
composite.zoom(4).save( "./tmp/pridepunks-ii@4x.png" )
print "OK\n"


puts "bye"

