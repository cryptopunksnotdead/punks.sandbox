#####################
#  generate more hats sample; to run use:
#
#   $ ruby ./more_hats.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


more_hats = {
  'blackbeanie'   => Image.read( './i/blackbeanie.png'),
  'greenbeanie'   => Image.read( './i/greenbeanie.png'),
  'redbeanie'     => Image.read( './i/redbeanie.png'),

  'redbobblehat'  => Image.read( './i/redbobblehat.png'),
  'bluebobblehat' => Image.read( './i/bluebobblehat.png'),

  'graduatehat'   => Image.read( './i/graduatehat.png'),
  'tinfoilhat'    => Image.read( './i/tinfoilhat.png'),
  'safteyhelmet'  => Image.read( './i/safteyhelmet.png'),
}


composite = ImageComposite.new( 8, 4 )  # 8x4 (=32 punks)


[
  Punks::Image.generate( "Male 1" ),
  Punks::Image.generate( "Male 1", style: 'natural' ),
  Punks::Image.generate( "Male 3" ),
  Punks::Image.generate( "Male 3", style: 'natural' )
].each_with_index do |base,i|

  more_hats.each do |name, attribute|
     punk = Image.new( 24, 24 )
     punk.compose!( base )
     punk.compose!( attribute )

     punk.zoom(4).save( "./tmp/punk_#{name}_(#{i})@4x.png")

     composite << punk
  end
end


composite.save( "./tmp/morehats.png" )
composite.zoom(4).save( "./tmp/morehats@4x.png" )



puts "bye"