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


def make_punks( specs, hair: )
  punks = []
  specs.each do |attributes|
    base = attributes[0]
    more_attributes = attributes[1..-1]

    hairstyle =  if base.index( '1' )
                   ## orange
                   hair.change_colors( { '#FFF68E' => '#E65700',
                                         '#FEF7B9' => '#F25800' } )
                  elsif base.index( '2' )
                    ## black
                    hair.change_colors( { '#FFF68E' => '#000000',
                                          '#FEF7B9' => '#2A2A2A' } )
                  elsif base.index( '4' )
                    ## purple
                    hair.change_colors( { '#FFF68E' => '#710CC7',
                                          '#FEF7B9' => '#8110E5' } )
                elsif base.index( 'Zombie' )
                ## red
              hair.change_colors( { '#FFF68E' => '#E22626',
                                    '#FEF7B9' => '#F92A2A' } )
                elsif base.index( 'Blue' )
                  hair.change_colors( { '#FFF68E' => '#FFFFFF',
                                        '#FEF7B9' => '#E4E4E4' } )
              else
                hair  ## use as is
            end

    punk = Image.new( 24, 24 )
    punk.compose!( Punk::Sheet.find_by( name: base ))
    punk.compose!( hairstyle )
    more_attributes.each do |attribute|
      punk.compose!( Punk::Sheet.find_by( name: attribute, gender: 'f' ))
    end
    punks << punk
  end
  punks
end


specs = Csv.parse( <<TXT )
  Female 1
  Female 2
  Female 3
  Female 4
  Zombie Female
  Female Blue
  Female 1,   3D GLasses, Purple Lipstick
  Female 3,   Big Shades, Hot Lipstick
TXT


##
#  note: turn all hair style to blonde
hair1 = Image.read( "./f/blonde_short.png" )
hair2 = Image.read( "./f/orange_side.png" ).change_colors( {  '#E65700' => '#FFF68E'} )
hair3 = Image.read( "./f/straight_hair_blonde.png" )
hair4 = Image.read( "./f/purple_hair.png" ).change_colors( { '#710CC7' => '#FFF68E' } )
hair5 = Image.read( "./f/wild_blonde.png" )
hair6 = Image.read( "./f/dark_hair.png" ).change_colors( { '#000000' => '#FFF68E',
                                                           '#2A2A2A' => '#FEF7B9' } )
hair7 = Image.read( "./f/wild_white_hair.png" ).change_colors( { '#FFFFFF' => '#FFF68E',
                                                                 '#E4E4E4'  => '#FEF7B9' } )



punks = []
punks += make_punks( specs, hair: hair1 )
punks += make_punks( specs, hair: hair2 )
punks += make_punks( specs, hair: hair3 )
punks += make_punks( specs, hair: hair4 )
punks += make_punks( specs, hair: hair5 )
punks += make_punks( specs, hair: hair6 )
punks += make_punks( specs, hair: hair7 )


composite = make_composite( punks, cols: specs.size, background: '#60a4f7' )

composite.save( "./tmp/punkettes_popit.png" )
composite.zoom(2).save( "./tmp/punkettes_popit@2x.png" )
composite.zoom(4).save( "./tmp/punkettes_popit@4x.png" )



puts "bye"
