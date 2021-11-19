#####################
#  generate more hair-dos sample; to run use:
#
#   $ ruby ./more_hairdos.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


more_hairdos = {
  'big_mohawk'  => Image.read( './i/hair/big_mohawk.png' ),
  'comma'       => Image.read( './i/hair/comma.png' ),
  'fringe_up'   => Image.read( './i/hair/fringe_up.png' ),
  'long_front_curly' => Image.read( './i/hair/long_front_curly.png' ),
  'messier'   => Image.read( './i/hair/messier.png' ),
  'oldman'    => Image.read( './i/hair/oldman.png' ),
  'pompadour'  => Image.read( './i/hair/pompadour.png' ),
  'short_messy' => Image.read( './i/hair/short_messy.png' ),
  'short_mohawk' => Image.read( './i/hair/short_mohawk.png' ),
}


composite = ImageComposite.new( 9, 6 )  # 9x5 (=54 punks)


[
  Punks::Image.generate( "Male 1" ),
  Punks::Image.generate( "Male 1", style: 'natural' ),
  Punks::Image.generate( "Male 3" ),
  Punks::Image.generate( "Male 3", style: 'natural' ),
  Punks::Image.generate( "Zombie" ),
  Punks::Image.generate( "Zombie", style: 'natural' ),
].each_with_index do |base,i|

  more_hairdos.each do |name, attribute|
     punk = Image.new( 24, 24 )
     punk.compose!( base )

     attribute = if     i == 2 || i == 3  then attribute.change_colors( { '000000' => 'FFF68E'} )
                 elsif  i == 4 || i == 5  then attribute.change_colors( { '000000' => 'E22626'} )
                 else    attribute   ## keep color as is (that is, black is black)
                 end

     punk.compose!( attribute )

     punk.zoom(4).save( "./tmp/punk_#{name}_(#{i})@4x.png")

     composite << punk
  end
end


composite.save( "./tmp/morehairdos.png" )
composite.zoom(4).save( "./tmp/morehairdos@4x.png" )



puts "bye"