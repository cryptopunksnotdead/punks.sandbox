#####
#  test out some attributes on punks

require 'punks'


def make_composite( punks, cols: 10, background: nil )
  total = punks.size
  rows =  total / cols
  rows += 1    if total % cols != 0

  puts "  total: #{total},  #{cols}x#{rows} (cols x rows)"

  composite = ImageComposite.new( cols, rows, width: 24,
                                              height: 24,
                                              background: background )

  punks.each do |punk|
     composite << punk
  end
  composite
end



attributes_m = %w[
  m/blonde_short
  m/wild_blonde
  m/half_shaved
  m/orange_side
  m/wild_white_hair
  m/pilot_helmet
  m/tassle_hat
  m/tiara
  m/welding_goggles
  m/choker
  m/gas_mask
  m/piercing
]

attributes_f = %w[
  f/blonde_short
  f/wild_blonde
  f/straight_hair_blonde
  f/clown_hair_green
  f/dark_hair
  f/half_shaved
  f/peak_spike
  f/vampire_hair
  f/orange_side
  f/purple_hair
  f/wild_white_hair
  f/do-rag
  f/gas_mask
  f/piercing
]



def make_punks( attributes, base: )
  punks = []
  base_punk = Punk::Sheet.find_by( name: base )
  attributes.each do |path|
    attribute = Image.read( "#{path}.png" )

    punk = Image.new( 24, 24 )
    punk.compose!( base_punk )
    punk.compose!( attribute )
    punks << punk
  end
  punks
end


punks = []
punks += make_punks( attributes_m, base: 'Ghost' )
punks += make_punks( attributes_f, base: 'Ghost Female' )

punks += make_punks( attributes_m, base: 'Male 1' )
punks += make_punks( attributes_f, base: 'Female 3' )


composite = make_composite( punks, background: '#60a4f7' )

composite.save( "./tmp/attributes_popit.png" )
composite.zoom(2).save( "./tmp/attributes_popit@2x.png" )
composite.zoom(4).save( "./tmp/attributes_popit@4x.png" )


puts "bye"
