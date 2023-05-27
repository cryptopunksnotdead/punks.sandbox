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
 'regular shades' => Image.read( './32x32/regular_shades.png' ),
 'heart shades'   => Image.read( './32x32/heart_shades.png' ),
 'skigoogles'     => Image.read( './32x32/skigoogles.png' ),
 'vr'             => Image.read( './32x32/vr.png' ),

 'clown nose'     => Image.read( './32x32/clown_nose.png' ),

 'top hat'        => Image.read( './32x32/top_hat.png' ),
 'beanie'         => Image.read( './32x32/beanie.png' ),
 'bandana'        => Image.read( './32x32/bandana.png' ),
 'cap'            => Image.read( './32x32/cap.png' ),
 'cap forward'    => Image.read( './32x32/cap_forward.png' ),
 'knitted cap'    => Image.read( './32x32/knitted_cap.png' ),
 'headband'       => Image.read( './32x32/headband.png' ),
 'jester hat'     => Image.read( './32x32/jester_hat.png' ),

 'cigarette'      => Image.read( './32x32/cigarette.png' ),
 'pipe'           => Image.read( './32x32/pipe.png' ),
 'bubblegum'      => Image.read( './32x32/bubblegum.png' ),
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

  ## more
  ['heart shades'],
  ['regular shades'],
  ['skigoogles'],

  ['bandana'],
  ['cap'],
  ['cap forward'],
  ['headband'],
  ['jester hat'],

  ['cigarette'],
  ['pipe'],
  ['bubblegum'],

  ['clown nose'],

  ['cap forward', 'pipe'],
  ['knitted cap', 'clown nose', 'cigarette'],
  ['top hat', '3d glasses', 'cigarette'],
]


composite      = ImageComposite.new( 4,3, width: 32, height: 32 )
composite_vol2 = ImageComposite.new( 4,3, width: 32, height: 32 )


specs.each_with_index do |attributes,i|
  img = Image.new( 32, 32 )
  img.compose!( mundl )
  attributes.each do |attr|
    attr_img = ATTRIBUTES[attr]
    puts "!! ERROR - missing attribute >#{attr}<; sorry"  unless attr_img
    img.compose!( attr_img )
  end

  img.save( "./tmp/mundl_xl-#{i}.png" )
  img.zoom(4).save( "./tmp/mundl_xl-#{i}@4x.png" )
  img.zoom(8).save( "./tmp/mundl_xl-#{i}@8x.png" )

  composite       << img     if i < 12
  composite_vol2  << img     if i >= 12 && i < 24
end



composite.save( "./tmp/mundls_xl.png" )
composite.zoom(4).save( "./tmp/mundls_xl@4x.png" )

composite_vol2.save( "./tmp/mundls_xl-vol2.png" )
composite_vol2.zoom(4).save( "./tmp/mundls_xl-vol2@4x.png" )

puts "bye"
