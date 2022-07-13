require 'punks'


patch = {
  'cyborgmale1' => Image.read( './attributes/cyborg-male1.png' ),
  'cyborgmale2' => Image.read( './attributes/cyborg-male2.png' ),
  'cyborgmale3' => Image.read( './attributes/cyborg-male3.png' ),
  'cyborgmale4'  => Image.read( './attributes/cyborg-male4.png' ),
  'cyborgmalemetal'  => Image.read( './attributes/cyborg-male-metal.png' ),
  'cyborgfemale1' => Image.read( './attributes/cyborg-female1.png' ),
  'cyborgfemale2' => Image.read( './attributes/cyborg-female2.png' ),
  'cyborgfemale3' => Image.read( './attributes/cyborg-female3.png' ),
  'cyborgfemale4' => Image.read( './attributes/cyborg-female4.png' ),
  'cyborgfemalemetal' => Image.read( './attributes/cyborg-female-metal.png' ),
  'cyborgape'      => Image.read( './attributes/cyborg-ape.png' ),
  'cyborgapemetal' => Image.read( './attributes/cyborg-ape-metal.png' ),
}


cyborgs = %w[
  male1
  male2
  male3
  male4
  male-metal
  female1
  female2
  female3
  female4
  female-metal
  ape
  ape-metal
]

specs = [
  [],
  ['Hoodie'],
  ['Knitted Cap', 'Earring'],
  ['Cap Forward', 'Pipe'],
  ['VR'],
  ['Top Hat', '3D Glasses', 'Gold Chain', 'Smile'],
  [],
  ['Birthday Hat', 'Bubble Gum', 'Smile'],
  ['Frog Hood'],
]


punks = ImageComposite.new( cyborgs.size, specs.size,
                            background: '#638596' )

specs.each_with_index do |more_attributes,i|
   cyborgs.each_with_index do |cyborg,j|
      attributes = ["cyborg-#{cyborg}"] + more_attributes

      ## note: filter out / remove
      ##   for apes  - smile
      ##   for metal - smile, earring
      attributes =  attributes.filter { |attribute|
                          !['Smile'].include?( attribute )
                       }  if cyborg.index( 'ape' )

       attributes =  attributes.filter { |attribute|
                          !['Earring', 'Gold Chain', 'Smile'].include?( attribute )
                       }  if cyborg.index( 'metal' )


      punk =  Punk::Image.generate( *attributes, patch: patch )

      ## change red cyborg to blue
      color_map = { '#FF0000' => '#00FCFF',
                    '#981613' => '#0DC4C6',
                    '#63100E' => '#0E9193'}
      punk = punk.change_colors( color_map )   if i >= 6

      punks << punk

      punk.zoom(4).save( "./tmp/cyborg#{j}.#{i}@4x.png" )
   end
end


punks.save( "./tmp/cyborgs.png" )
punks.zoom(2).save( "./tmp/cyborgs@2x.png" )

puts "bye"