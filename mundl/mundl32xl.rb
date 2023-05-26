###############
#  to run use:
#    $ ruby ./mundl32xl.rb

$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'


mundl = Image.read( './mundl_xl-32x32.png' )


mundl.zoom(4).save( './tmp/mundl_xl32@4x.png' )
mundl.zoom(8).save( './tmp/mundl_xl32@8x.png' )

## use an even bigger (+1 px height) head - why? why not?
mundl_alt = Image.read( './mundl_xxl-32x32.png' )


mundl_alt.zoom(4).save( './tmp/mundl_xxl32@4x.png' )
mundl_alt.zoom(8).save( './tmp/mundl_xxl32@8x.png' )



ATTRIBUTES = {
 '3d glasses'     => Image.read( './3d_glasses-32x32.png' ),
 'laser eyes'     => Image.read( './laser_eyes-32x32.png' ),
 'noun glasses'   => Image.read( './noun_glasses-32x32.png' ),
 'classic shades' => Image.read( './classic_shades-32x32.png' ),
 'vr'             => Image.read( './vr-32x32.png' ),
 'top hat'        => Image.read( './top_hat-32x32.png' ),
 'beanie'         => Image.read( './beanie-32x32.png' ),
}


specs = [
  [],  ## empty
  ['3d glasses'],
  ['top hat', '3d glasses'],
  ['laser eyes'],
  ['noun glasses'],
  ['top hat'],
  ['classic shades'],
  ['beanie', 'classic shades'],
  ['vr'],
  ['beanie'],
  ['beanie', 'vr'],
  ['top hat', 'laser eyes'],
]


composite = ImageComposite.new( 4,3, width: 32, height: 32 )


specs.each_with_index do |attributes,i|
  img = Image.new( 32, 32 )
  img.compose!( mundl )
  attributes.each do |attr|
    img.compose!( ATTRIBUTES[attr] )
  end

  img.save( "./tmp/mundl_xl-#{i}.png" )
  img.zoom(4).save( "./tmp/mundl_xl-#{i}@4x.png" )
  img.zoom(8).save( "./tmp/mundl_xl-#{i}@8x.png" )

  composite << img
end


composite.save( "./tmp/mundls_xl.png" )
composite.zoom(4).save( "./tmp/mundls_xl@4x.png" )

puts "bye"
