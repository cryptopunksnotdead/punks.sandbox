####
#   try new bull archetypes

require 'punks'


#####################
## add (patch) punk generator with more archetypes & attributes
patch = {
  ## archetype (base) bulls
  'bull'         => Image.read( './bull.png' ),
  'bull2'         => Image.read( './bull2.png' ),
  'bull3'         => Image.read( './bull3.png' ),
  'bull4'         => Image.read( './bull4.png' ),
  'bull5'         => Image.read( './bull5.png' ),
  'bull5a'         => Image.read( './bull5.a.png' ),

  'bull3dark'     => Image.read( './bull3-dark.png' ),
  'bull3black'     => Image.read( './bull3-black.png' ),
  'bull3white'    => Image.read( './bull3-white.png' ),
  'bull3gold'     => Image.read( './bull3-gold.png' ),
  'bull3gray'    => Image.read( './bull3-gray.png' ),
  'bull3red'    => Image.read( './bull3-red.png' ),
  'bull3blue'    => Image.read( './bull3-blue.png' ),
}


types = ['Bull 3',
         'Bull 3 Dark',
         'Bull 3 Gray',
         'Bull 3 Black',
         'Bull 3 White',
         'Bull 3 Blue',
         'Bull 3 Red',
         'Bull 3 Gold',
         ]


specs = [
  [],
  ['Regular Shades Reflective'],
  ['Big Shades'],
  ['Horned-Rim Glasses'],
  ['Heart Shades', 'Birthday Hat', 'Bubble Gum'],
  ['Headband', 'Pipe'],
  ['Eye Patch'],
  ['Laser Eyes'],
  ['3D Glasses'],
  ['VR', 'Gold Chain'],
]

bulls = ImageComposite.new( specs.size, types.size, background: '#638596' )

types.each do |type|
  specs.each do |more_attributes|
     attributes = [type] + more_attributes
     bull = Punk::Image.generate( *attributes, patch: patch )
     bulls << bull
  end
end

bulls.save( "./tmp/bulls_v2.png" )
bulls.zoom(4).save( "./tmp/bull_v2@4x.png" )



#####
#  try design / style variants

types = ['Bull',
         'Bull 2',
         'Bull 3',
         'Bull 4',
         'Bull 5',
         'Bull 5A',
         ]

specs = [
  [],
  ['Regular Shades Reflective'],
  ['Big Shades'],
  ['Horned-Rim Glasses'],
  ['Heart Shades', 'Birthday Hat', 'Bubble Gum'],
  ['Headband', 'Pipe'],
  ['Eye Patch'],
  ['Laser Eyes'],
  ['3D Glasses'],
  ['VR', 'Gold Chain'],
]

bulls = ImageComposite.new( specs.size, types.size, background: '#638596' )

types.each do |type|
  specs.each do |more_attributes|
     attributes = [type] + more_attributes
     bull = Punk::Image.generate( *attributes, patch: patch )
     bulls << bull
  end
end

bulls.save( "./tmp/bulls_styles.png" )
bulls.zoom(4).save( "./tmp/bulls_styles@4x.png" )



puts "bye"