####
#   try new bear archetypes

require 'punks'


#####################
## add (patch) punk generator with more archetypes & attributes
patch = {
  ## archetype (base) bears
  'bear'         => Image.read( './bear.png' ),
  'beardark'     => Image.read( './bear-dark.png' ),
  'beargold'     => Image.read( './bear-gold.png' ),
  'bearpink'     => Image.read( './bear-pink.png' ),
  'bearwhite'    => Image.read( './bear-white.png' ),
  'beargray'    => Image.read( './bear-gray.png' ),
  'bearorange'    => Image.read( './bear-orange.png' ),
  'bearred'    => Image.read( './bear-red.png' ),
  'bearblue'    => Image.read( './bear-blue.png' ),
}


types = ['Bear',
         'Bear Dark',
         'Bear Gray',
         'Bear White',
         'Bear Blue',
         'Bear Red',
         'Bear Pink',
         'Bear Orange',
         'Bear Gold',
         ]


specs = [
  [],
  ['Regular Shades Reflective', 'Smile'],
  ['Big Shades'],
  ['Horned-Rim Glasses'],
  ['Heart Shades', 'Birthday Hat', 'Bubble Gum'],
  ['Headband', 'Pipe'],
  ['Eye Patch'],
  ['Laser Eyes', 'Frown'],
  ['3D Glasses', 'Smile'],
  ['VR', 'Gold Chain', 'Sombrero'],
]

bears = ImageComposite.new( specs.size, types.size, background: '#638596' )

types.each do |type|
  specs.each do |more_attributes|
     attributes = [type] + more_attributes
     bear = Punk::Image.generate( *attributes, patch: patch )
     bears << bear
  end
end

bears.save( "./tmp/bears_v2.png" )
bears.zoom(4).save( "./tmp/bears_v2@4x.png" )


puts "bye"