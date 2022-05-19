##################################################
#  generate some coolcats 24x24 via attributes; to run use
#
#  $ ruby ./coolcats.rb

require 'pixelart'


base = Image.read( "attributes/base.png" )


base.zoom(4).save( "tmp/base@4x.png" )
base.zoom(8).save( "tmp/base@8x.png" )


### try some coolcats
coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/face/ditto.png" ))
coolcat.compose!( Image.read( "attributes/hat/beret_red.png" ))
coolcat.save( "tmp/coolcat1.png")
coolcat.zoom(4).save( "tmp/coolcat1@4x.png" )


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/face/hearts.png" ))
coolcat.compose!( Image.read( "attributes/hat/afro_black.png" ))
coolcat.save( "tmp/coolcat2.png")
coolcat.zoom(4).save( "tmp/coolcat2@4x.png" )


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/face/unamused.png" ))
coolcat.save( "tmp/coolcat3.png")
coolcat.zoom(4).save( "tmp/coolcat3@4x.png" )


####
# try some halloween attributes
#   plus add to composite (4x2 grid )

composite = ImageComposite.new( 4, 2 )


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/halloween/jack.png" ))
coolcat.save( "tmp/halloween1.png")
coolcat.zoom(4).save( "tmp/halloween1@4x.png" )

composite << coolcat


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/halloween/jason.png" ))
coolcat.save( "tmp/halloween2.png")
coolcat.zoom(4).save( "tmp/halloween2@4x.png" )

composite << coolcat


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/halloween/skull.png" ))
coolcat.save( "tmp/halloween3.png")
coolcat.zoom(4).save( "tmp/halloween3@4x.png" )

composite << coolcat


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/halloween/scream.png" ))
coolcat.save( "tmp/halloween4.png")
coolcat.zoom(4).save( "tmp/halloween4@4x.png" )

composite << coolcat



coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/hat/beret_red.png" ))
coolcat.compose!( Image.read( "attributes/halloween/jason.png" ))
coolcat.save( "tmp/halloween5.png")
coolcat.zoom(4).save( "tmp/halloween5@4x.png" )

composite << coolcat


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/hat/beret_red.png" ))
coolcat.compose!( Image.read( "attributes/halloween/skull.png" ))
coolcat.save( "tmp/halloween6.png")
coolcat.zoom(4).save( "tmp/halloween6@4x.png" )

composite << coolcat


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/hat/beanie_orange.png" ))
coolcat.compose!( Image.read( "attributes/halloween/jason.png" ))
coolcat.save( "tmp/halloween7.png")
coolcat.zoom(4).save( "tmp/halloween7@4x.png" )

composite << coolcat


coolcat = Image.new( 24, 24 )
coolcat.compose!( base )
coolcat.compose!( Image.read( "attributes/hat/afro_black.png" ))
coolcat.compose!( Image.read( "attributes/halloween/skull.png" ))
coolcat.save( "tmp/halloween8.png")
coolcat.zoom(4).save( "tmp/halloween8@4x.png" )

composite << coolcat




composite.save( "tmp/halloween.png" )
composite.zoom(4).save( "tmp/halloween@4x.png")



####
# try some super-rare tvhead/tvface attributes
#   plus add to composite (3x4 grid )


composite = ImageComposite.new( 3, 4 )


tvfaces = ['404',
         'nosignal',
         'bobross',
         'xp']
tvheads = ['white',
          'grey',
          'purple']

tvfaces.each do |tvface|
  tvheads.each do |tvhead|
    coolcat = Image.new( 24, 24 )
    coolcat.compose!( base )
    coolcat.compose!( Image.read( "attributes/hat/tvhead_#{tvhead}.png" ))
    coolcat.compose!( Image.read( "attributes/face/tvface_#{tvface}.png" ))

    coolcat.save( "tmp/tvhead_#{tvface}-#{tvhead}.png")
    coolcat.zoom(4).save( "tmp/tvhead_#{tvface}-#{tvhead}@4x.png" )

    composite << coolcat
  end
end


composite.save( "tmp/tvheads.png" )
composite.zoom(4).save( "tmp/tvheads@4x.png")



puts "bye"

