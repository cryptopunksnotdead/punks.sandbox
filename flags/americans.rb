######
#  generate americans
#   $ ruby ./americans.rb

require 'punks'
require 'backgrounds'



flags = %w[
  usa

  canada
  mexico

  cuba
  jamaica

  guatemala
  costa_rica
  honduras
  panama

  argentina
  brazil
  colombia
  chile
  bolivia
  ecuador
  peru
  uruguay
  venezuela
]



puts "  #{flags.size} flag(s)"
#=> 18 flags(s)

series = [
  [],
  ['Female 3', 'Wild Blonde', 'Big Shades', 'Smile', 'Mole'],
  ['Ape', 'Bandana', 'Bubble Gum'],
]

punks = ImageComposite.new( 3*series.size, 6 )



flags.each do |name|
  series.each do |attributes|
   flag = Image.read( "./#{name}.png" )

   if attributes.empty?
      punks << flag
   else
     punk = Punk::Image.generate( *attributes )
     punks << punk.background( flag )
   end
  end
end

punks.save( "./tmp/american_flags.png" )
punks.zoom(2).save( "./tmp/american_flags@2x.png" )
punks.zoom(4).save( "./tmp/american_flags@4x.png" )



puts "bye"