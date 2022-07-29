####
#   try new bull archetypes

require 'punks'


#####################
## add (patch) punk generator with more archetypes & attributes
patch = {
  ## archetype (base) bulls
  'bull'         => Image.read( './bull.png' ),
  'bulldark'     => Image.read( './bull-dark.png' ),
  'bullblack'     => Image.read( './bull-black.png' ),
  'bullwhite'    => Image.read( './bull-white.png' ),
  'bullgold'     => Image.read( './bull-gold.png' ),
  'bullgray'    => Image.read( './bull-gray.png' ),
  'bullred'    => Image.read( './bull-red.png' ),
  'bullblue'    => Image.read( './bull-blue.png' ),
}


types = ['Bull',
         'Bull Dark',
         'Bull Gray',
         'Bull Black',
         'Bull White',
         'Bull Blue',
         'Bull Red',
         'bull Gold',
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

bulls.save( "./tmp/bulls.png" )
bulls.zoom(4).save( "./tmp/bulls@4x.png" )


puts "bye"