require 'pixelart'


colors = %w[
  black
  purple
  blue
  green
  red
  pink
  orange
  yellow
  white
]



cats = ImageComposite.new( 3, 3, width: 32,
                                 height: 32)

colors.each do |color|
  cat = Image.read( "./32x32/luckycat-#{color}.png" )
  cats << cat
end

cats.save( "./tmp/luckycats.png" )
cats.zoom(4).save( "./tmp/luckycats@4x.png")
cats.zoom(8).save( "./tmp/luckycats@8x.png")


############
#  generate a transparent version for the artbase.server


cats = ImageComposite.new( 3, 3, width: 32,
                                 height: 32)

## note: use reverse and start off with white (and end with black)
colors.reverse.each do |color|
  cat = Image.read( "./32x32/luckycat-#{color}-ii.png" )
  cats << cat
end

cats.save( "./tmp/luckycats-32x32.png" )
cats.zoom(4).save( "./tmp/luckycats-32x32@4x.png")


puts "bye"