###########
#  to run use:
#    $ ruby ./slowmotion.rb



require 'cryptopunks'



def slow_motion_punks( attributes )
   punks = []
   count = attributes.size
   (1..count).each do |limit|
     puts
     puts "==> punk with #{limit} attribute(s): #{attributes[0,limit].inspect}"
     punks << Punk::Image.generate( *attributes[0,limit])
   end
   punks
end


attributes_8348 = [
  'Male 2',
  'Mole',
  'Buck Teeth',
  'Big Beard',
  'Earring',
  'Classic Shades',
  'Cigarette',
  'Top Hat'
]


composite = ImageComposite.new( 3, 3, background: '#638596' )

composite << Image.new( 24, 24 )  # start with empty tile

slow_motion_punks( attributes_8348 ).each do |punk|
   composite << punk
end

composite.save( "./tmp/slowmotionpunk8348.png" )
composite.zoom(4).save( "./tmp/slowmotionpunk8348@4x.png" )
composite.zoom(6).save( "./tmp/slowmotionpunk8348@6x.png" )




attributes_marilyn = [
 'Female 3',
 'Mole',
 'Wild Blonde',
 'Blue Eye Shadow',
 'Hot Lipstick',
 'Earring'
]

composite = ImageComposite.new( 3, 2, background: '#34B9A5' )

slow_motion_punks( attributes_marilyn ).each do |punk|
   composite << punk.mirror      ## philip the intern - phree the phunks!
end

composite.save( "./tmp/slowmotionmarilyn.png" )
composite.zoom(4).save( "./tmp/slowmotionmarilyn@4x.png" )
composite.zoom(6).save( "./tmp/slowmotionmarilyn@6x.png" )



puts "bye"
