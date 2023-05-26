###############
#  to run use:
#    $ ruby ./mundl32xl.rb

$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'


mundl = Image.read( './32x32/mundl_xl.png' )


mundl.zoom(4).save( './tmp/mundl_xl32@4x.png' )
mundl.zoom(8).save( './tmp/mundl_xl32@8x.png' )

## use an even bigger (+1 px height) head - why? why not?
mundl_alt = Image.read( './32x32/mundl_xxl.png' )


mundl_alt.zoom(4).save( './tmp/mundl_xxl32@4x.png' )
mundl_alt.zoom(8).save( './tmp/mundl_xxl32@8x.png' )



ATTRIBUTES = {
 '3d glasses'     => Image.read( './32x32/3d_glasses.png' ),
 'laser eyes'     => Image.read( './32x32/laser_eyes.png' ),
 'noun glasses'   => Image.read( './32x32/noun_glasses.png' ),
 'classic shades' => Image.read( './32x32/classic_shades.png' ),
 'vr'             => Image.read( './32x32/vr.png' ),
 'top hat'        => Image.read( './32x32/top_hat.png' ),
 'beanie'         => Image.read( './32x32/beanie.png' ),
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
