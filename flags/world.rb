######
#  generate united nations of the world punks
#   $ ruby ./world.rb

require 'punks'
require 'backgrounds'


flags = %w[
  europe
  austria
  germany
  france
  great_britain
  greece
  italy
  spain
  sweden
  ukraine
  usa
  rainbow
]


series = [
  ['Female 3', 'Wild Blonde', 'Big Shades', 'Smile', 'Mole'],
  ['Ape', 'Bandana', 'Bubble Gum'],
]

punks = ImageComposite.new( 4, 3*series.size )



series.each do |attributes|
  flags.each do |name|
   flag = Image.read( "./#{name}.png" )

    punk = Punk::Image.generate( *attributes )
    punks << punk.background( flag )
  end
end

punks.save( "./tmp/flags.png" )
punks.zoom(4).save( "./tmp/flags@4x.png" )



puts "bye"