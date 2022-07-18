#####################
#  generate greek punk (pixel) characters / heads; to run use:
#
#   $ ruby ./greeks.rb


$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'punks'



flag = Image.read( "./flag.png" )

patch = {
  'shorthairblack' => Image.read( './short_hair-black.png' ),
  'shorthairbrown' => Image.read( './short_hair-brown.png' ),
  'shorthairgray'  => Image.read( './short_hair-gray.png' ),
  'curlyhairbrown' => Image.read( './curly-hair-brown.png' ),
  'curlyhairblack' => Image.read( './curly_hair-black.png' ),
  'curlyhairgray'  => Image.read( './curly_hair-gray.png' ),
  'longhairblack'  => Image.read( './long_hair-black.png' ),
  'oldfellahair'   => Image.read( './old_fella_hair.png' ),
  'longbeardblack' => Image.read( './long_beard-black.png' ),
  'longbeardbrown' => Image.read( './long_beard-brown.png' ),
  'longbeardgray'  => Image.read( './long_beard-gray.png' ),

  'goldenband'   => Image.read( './golden_band.png' ),
  'hadescrown'   => Image.read( './hades_crown.png' ),
  'laurelwreath' => Image.read( './laurel_wreath.png' ),
  'pileus'       => Image.read( './pileus.png' ),
  'smallcrown'   => Image.read( './small_crown.png' ),
  'spartan'      => Image.read( './spartan.png' ),
  'theatermask'  => Image.read( './theater_mask.png' ),
}


specs = Csv.parse( <<TXT )
  Male M06, Short Hair Black, Long Beard Black
  Male M05, Curly Hair Brown, Long Beard Brown, Horned-Rim Glasses, Laurel Wreath
  Male M04, Curly Hair Gray, Long Beard Gray, Golden Band, Gold Chain, Earring, Regular Shades Reflective

  Male M07, Old Fella Hair, Long Beard Gray, Pileus, Bubble Gum
  Male M08, Curly Hair Gray, Theater Mask
  Male M04, Short Hair Brown, Long Beard Brown, Spartan

  Male M06, Curly Hair Black, Long Beard Black, 3D Glasses
  Male M07, Old Fella Hair, Spots, Headband, Smile, Pipe
  Male M05,  Long Hair Black, Long Beard Black, Laurel Wreath, Laser Eyes Gold
TXT


greeks = ImageComposite.new( 3, 3 )

specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes, patch: patch )
  punk = punk.background( flag )

  punk.zoom(8).save( "./tmp/greek#{i}@8x.png" )

  greeks << punk
end

greeks.save( "./tmp/greeks.png" )
greeks.zoom(8).save( "./tmp/greeks@8x.png" )


puts "bye"
