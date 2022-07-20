######
#  generate united nations of the world punks
#   $ ruby ./world.rb

require 'punks'
require 'backgrounds'

flags = %w[
  australia
  japan
  south_korea
  china
  taiwan
  india

  iran
  israel
  saudi_arabia
  egypt
  nigeria
  south_africa
  pirate
  rainbow
]


series = [
  ['Female 3', 'Wild Blonde', 'Big Shades', 'Smile', 'Mole'],
  ['Ape', 'Bandana', 'Bubble Gum'],
  [],
]

punks = ImageComposite.new( 7, 2*series.size )



series.each do |attributes|
  flags.each do |name|
    flag = Image.read( "./#{name}.png" )

    if attributes.empty?
      punks << flag
    else
      punk = Punk::Image.generate( *attributes )
      punks << punk.background( flag )
    end
  end
end

punks.save( "./tmp/world_flags.png" )
punks.zoom(4).save( "./tmp/world_flags@4x.png" )



puts "bye"