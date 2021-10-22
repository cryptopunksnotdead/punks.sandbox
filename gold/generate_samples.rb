###############################
# to run use:
#    $  ruby ./generate_samples.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


names = ['Gold 1', 'Gold 2', 'Gold 3']


composite = ImageComposite.new( 6, 3 )

names.each do |name|

  composite << Punks::Image.generate( "Skeleton #{name}" )
  composite << Punks::Image.generate( "Skeleton Female #{name}" )

  composite << Punks::Image.generate( "Skeleton #{name}",
                                      'Big Hair Blonde' )
  composite << Punks::Image.generate( "Skeleton Female #{name}",
                                      'Blonde Bob',
                                      'Flowers' )

  composite << Punks::Image.generate( "Skeleton #{name}",
                                      'Sun Hat',
                                      '3D Glasses',
                                      'Pipe' )
  composite << Punks::Image.generate( "Skeleton Female #{name}",
                                      'Sun Hat',
                                      '3D Glasses',
                                      'Pipe' )
end

composite.save( "./tmp/skeletons.png" )
composite.zoom(2).save( "./tmp/skeletons@2x.png" )
composite.zoom(4).save( "./tmp/skeletons@4x.png" )




composite = ImageComposite.new( 6, 3 )

names.each do |name|
  composite << Punks::Image.generate( "Demon #{name}" )
  composite << Punks::Image.generate( "Demon Female #{name}" )

  composite << Punks::Image.generate( "Demon #{name}",
                                      'Heart Shades' )
  composite << Punks::Image.generate( "Demon Female #{name}",
                                      'Heart Shades' )

  composite << Punks::Image.generate( "Demon #{name}",
                                      'Sombrero',
                                      '3D Glasses',
                                      'Pipe' )
  composite << Punks::Image.generate( "Demon Female #{name}",
                                      'Sombrero',
                                      '3D Glasses',
                                      'Pipe' )
end

composite.save( "./tmp/demons.png" )
composite.zoom(2).save( "./tmp/demons@2x.png" )
composite.zoom(4).save( "./tmp/demons@4x.png" )



composite = ImageComposite.new( 6, 3 )

names.each do |name|
  composite << Punks::Image.generate( "Alien #{name}" )
  composite << Punks::Image.generate( "Alien Female #{name}" )

  composite << Punks::Image.generate( "Alien #{name}",
                                      'Birthday Hat' )
  composite << Punks::Image.generate( "Alien Female #{name}",
                                      'Flowers' )

  composite << Punks::Image.generate( "Alien #{name}",
                                      'Cap Forward',
                                      'Small Shades',
                                      'Pipe' )
  composite << Punks::Image.generate( "Alien Female #{name}",
                                      'Cap Forward',
                                      'Small Shades',
                                      'Pipe' )
end

composite.save( "./tmp/aliens.png" )
composite.zoom(2).save( "./tmp/aliens@2x.png" )
composite.zoom(4).save( "./tmp/aliens@4x.png" )




composite = ImageComposite.new( 6, 3 )

names.each do |name|
  composite << Punks::Image.generate( "Zombie #{name}" )
  composite << Punks::Image.generate( "Zombie Female #{name}" )

  composite << Punks::Image.generate( "Zombie #{name}",
                                      'Crazy Hair' )
  composite << Punks::Image.generate( "Zombie Female #{name}",
                                      'Crazy Hair' )

  composite << Punks::Image.generate( "Zombie #{name}",
                                      'Wild Hair',
                                      '3D Glasses',
                                      'Pipe' )
  composite << Punks::Image.generate( "Zombie Female #{name}",
                                      'Wild Hair',
                                      '3D Glasses',
                                      'Pipe' )
end

composite.save( "./tmp/zombies.png" )
composite.zoom(2).save( "./tmp/zombies@2x.png" )
composite.zoom(4).save( "./tmp/zombies@4x.png" )




composite = ImageComposite.new( 6, 3 )

names.each do |name|
  composite << Punks::Image.generate( "Ape #{name}" )
  composite << Punks::Image.generate( "Ape Female #{name}" )

  composite << Punks::Image.generate( "Ape #{name}",
                                      'Knitted Cap' )
  composite << Punks::Image.generate( "Ape Female #{name}",
                                      'Knitted Cap' )

  composite << Punks::Image.generate( "Ape #{name}",
                                      'Cap Forward',
                                      '3D Glasses',
                                      'Pipe' )
  composite << Punks::Image.generate( "Ape Female #{name}",
                                      'Cap Forward',
                                      '3D Glasses',
                                      'Pipe' )
end

composite.save( "./tmp/apes.png" )
composite.zoom(2).save( "./tmp/apes@2x.png" )
composite.zoom(4).save( "./tmp/apes@4x.png" )


puts "bye"