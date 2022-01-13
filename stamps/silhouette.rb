require 'pixelart'


names = [
'catherine_the_great',
'cleopatra',
'che_guevara',
'fidel_castro',
'genghis_khan',

'julius_caesar',
'leif_erikson',
'henry_viii',
'napoleon_bonaparte',
'mao_zedong',

'queen_elizabeth_ii_(3)',
'queen_nefertiti',
'queen_victoria',
'tutankhamun',
'winston_churchill',
]

puts "  #{names.size} punk(s)"
#=> 15 punk(s)


punks =  names.map do |name|
            puts "   reading #{name}..."
            punk = Image.read( "../../punks.readymade/politics/#{name}.png" )
            punk
         end


composite  = ImageComposite.new( 5, 3 )
composite2 = ImageComposite.new( 5, 3, background: '#638596' )


punks.each do |punk|
  silhouette = punk.silhouette
  composite  << silhouette
  composite2 << silhouette
end


composite.save( "./tmp/silhouettes.png" )
composite.zoom(4).save( "./tmp/silhouettes@4x.png" )

composite2.save( "./tmp/silhouettes_(2).png" )
composite2.zoom(4).save( "./tmp/silhouettes_(2)@4x.png" )




composite  = ImageComposite.new( 5, 3, background: '#638596' )
composite2 = ImageComposite.new( 5, 3, background: '#ff0000' )



punks.each do |punk|
  silhouette = punk.silhouette( '#ffffff' )  ## white
  composite  << silhouette
  composite2 << silhouette
end


composite.save( "./tmp/silhouettes_(3).png" )
composite.zoom(4).save( "./tmp/silhouettes_(3)@4x.png" )

composite2.save( "./tmp/silhouettes_(4).png" )
composite2.zoom(4).save( "./tmp/silhouettes_(4)@4x.png" )

puts "bye"
