######
#  generate europeans
#   $ ruby ./europeans.rb

require 'punks'
require 'backgrounds'


flags = %w[
  europe

  austria
  czechia
  germany
  hungary
  liechtenstein
  poland
  slovakia
  slovenia
  switzerland

  belgium
  france
  luxembourg
  netherlands

  denmark
  finland
  estonia
  iceland
  latvia
  lithuania
  norway
  sweden

  great_britain
  england
  ireland
  scotland
  wales


  albania
  croatia
  north_macedonia
  romania
  bulgaria
  georgia
  ukraine


  spain
  portugal

  italy
  vatican_city
  malta
  greece
  cyprus
  turkey
]



puts "  #{flags.size} flag(s)"
#=> 43 flags(s)
#  to make it a round 42 remove  russia for now


series = [
  [],
  ['Female 3', 'Wild Blonde', 'Big Shades', 'Smile', 'Mole'],
  ['Ape', 'Bandana', 'Bubble Gum'],
]

punks = ImageComposite.new( 14, 3*series.size )



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

punks.save( "./tmp/european_flags_v2.png" )
punks.zoom(2).save( "./tmp/european_flags_v2@2x.png" )
punks.zoom(4).save( "./tmp/european_flags_v2@4x.png" )



puts "bye"