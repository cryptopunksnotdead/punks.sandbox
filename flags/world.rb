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
  [],
  ['Female 3', 'Wild Blonde', 'Big Shades', 'Smile', 'Mole'],
  ['Ape', 'Bandana', 'Bubble Gum', 'Earring'],
]

punks = ImageComposite.new( 7, 2*series.size )



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

punks.save( "./tmp/world_flags_v2.png" )
punks.zoom(4).save( "./tmp/world_flags_v2@4x.png" )



flags = %w[
   amsterdam
   venice
]


series = [
  [],
  ['Female 3', 'Wild Blonde', '3D Glasses', 'Smile', 'Mole', "Gold Chain"],
  ['Alien', 'Birthday Hat', 'Bubble Gum', 'Earring'],
]


punks = ImageComposite.new( 1*series.size, 2  )


flags.each do |name|
    flag = Image.read( "./#{name}.png" )
    series.each do |attributes|

    if attributes.empty?
      punks << flag
    else
      punk = Punk::Image.generate( *attributes )
      punk = punk.mirror ##  if attributes[1] == 'Wild Blonde'
      punks << punk.background( flag )
    end
  end
end

punks.save( "./tmp/historic_flags.png" )
punks.zoom(8).save( "./tmp/historic_flags@8x.png" )



puts "bye"