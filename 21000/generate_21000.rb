###################################################
#  21 000 Punks - The Punk Maxi Club Edition



##
## todo/add upstream:
##   use ImageComposite.new( 100, 210, background:  '#638596' )
##
##  add new add_composite method or such - why? why not?


require 'pixelart'


club = ImageComposite.new( 100, 210 )   ## 100x210 (cols x rows) = 21000

print "==> [1/3] loading punk image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"

(0..9999).each do |i|
  ## punk with background (use solid blue-ish color for now)
  img = Image.new( 24, 24, '#638596' )
  img.compose!( punks[i] )

  club << img
end

print "==> [2/3] loading punk image..."
punks = ImageComposite.read( "../../awesome-24px/collection/expansionpunks.png" )
print "OK\n"

(0..9999).each do |i|
  ## punk with background (use solid blue-ish color for now)
  img = Image.new( 24, 24, '#638596' )
  img.compose!( punks[i] )

  club << img
end


print "==> [3/3] loading punk image..."
punks = ImageComposite.read( "../../awesome-24px/collection/morepunks.png" )
print "OK\n"

(0..999).each do |i|
  ## punk with background (use solid blue-ish color for now)
  img = Image.new( 24, 24, '#638596' )
  img.compose!( punks[i] )

  club << img
end


club.save( "./tmp/punks.png" )

###
#  pass 2 - (random) shuffle punks
#               use seed for deterministic / repeatable (pseudo-random) shuffle

indexes = (0..20999).to_a
puts "  #{indexes.size} punk(s)"   #=> 21000 punk(s)

srand( 4142 )
indexes = indexes.shuffle



# print "==>  loading punk image..."
# club = ImageComposite.read( "./tmp/punks.png" )
# print "OK\n"

club_shuffle = ImageComposite.new( 100, 210 )


indexes.each do |index|
  club_shuffle <<  club[ index ]
end

club_shuffle.save( "./tmp/punks-shuffle.png" )


puts "  for reference the (random) shuffled ids:"
puts indexes.inspect



puts "bye"