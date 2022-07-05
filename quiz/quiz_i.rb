#############################################
#  generate / create pixel punk quiz composites - who is ___?

require 'pixelart'


basedir = '../../opensea.sandbox'




pop_rock = [
  Image.read( "#{basedir}/thecryptogenius/ii/076-freddie_mercury.png" ),
  Image.read( "#{basedir}/thecryptogenius/ii/079-david_bowie.png" ),
  Image.read( "#{basedir}/thecryptogenius/ii/082-bob_marley.png" ),

  Image.read( "#{basedir}/thecryptogenius/ii/083-jimi_hendrix.png" ),
  Image.read( "#{basedir}/unofficialpunks/ii/047-lady_gaga_punk.png" ),
  Image.read( "#{basedir}/thecryptogenius/ii/067-michael_jackson.png" ),

  Image.read( "#{basedir}/thecryptogenius/ii/072-john_lennon.png" ),
  Image.read( "#{basedir}/thecryptogenius/ii/088-whitney_houston.png" ),
  Image.read( "#{basedir}/unofficialpunks/ii/051-billie_eilish_punk.png" ),
]


pop_rock_2 = [
  Image.read( "#{basedir}/histopunks/ii/032-kurt_cobain.png" ),
  Image.read( "#{basedir}/unofficialpunks/ii/094-pink_punk.png" ),
  Image.read( "#{basedir}/unofficialpunks/ii/084-snoop_dogg_punk.png" ),

  Image.read( "#{basedir}/histopunks/ii/056-prince.png" ),
  Image.read( "#{basedir}/unofficialpunks/ii/025-freebritney_britney_spears_punk.png" ),
  Image.read( "#{basedir}/unofficialpunks/ii/086-justin_bieber_punk.png" ),

  Image.read( "#{basedir}/histopunks/ii/113-eddie_van_halen.png" ),
  Image.read( "#{basedir}/unofficialpunks/ii/085-stevie_wonder_punk.png" ),
  Image.read( "#{basedir}/histopunks/ii/052-amy_winehouse.png" ),
]



## quiz no. 1
composite = ImageComposite.new( 3, 3 )

pop_rock.each do |punk|
  composite << punk
end

composite.save( "./tmp/quiz_i.png" )
composite.zoom(2).save( "./tmp/quiz_i@2x.png" )
composite.zoom(4).save( "./tmp/quiz_i@4x.png" )


## quiz no. 2
composite = ImageComposite.new( 3, 3 )

pop_rock_2.each do |punk|
  composite << punk
end

composite.save( "./tmp/quiz_ii.png" )
composite.zoom(2).save( "./tmp/quiz_ii@2x.png" )
composite.zoom(4).save( "./tmp/quiz_ii@4x.png" )



autocrats = [
  Image.read( "#{basedir}/star-punks1/ii/donald_trump.png" ),
  Image.read( "#{basedir}/star-punks1/ii/vladimir_putin.png" ),
  Image.read( "#{basedir}/star-punks1/ii/alexander_lukashenko.png" ),

  Image.read( "#{basedir}/star-punks1/ii/recep_tayyip_erdoan.png" ),
  Image.read( "#{basedir}/star-punks1/ii/xi_jinping.png" ),
  Image.read( "#{basedir}/star-punks1/ii/kim_jong-un.png" ),

  Image.read( "#{basedir}/star-punks1/ii/adolf_hitler.png" ),
  Image.read( "#{basedir}/star-punks1/ii/joseph_stalin.png" ),
  Image.read( "#{basedir}/star-punks1/ii/mao_zedong.png" ),

  # Image.read( "#{basedir}/star-punks1/ii/fidel_castro.png" ),
  # Image.read( "#{basedir}/star-punks1/ii/darth_vader.png" ),
]


## quiz no. 3
composite = ImageComposite.new( 3, 3, width: 32, height: 32 )

autocrats.each do |punk|
  composite << punk
end

composite.save( "./tmp/quiz_iii.png" )
composite.zoom(2).save( "./tmp/quiz_iii@2x.png" )
composite.zoom(4).save( "./tmp/quiz_iii@4x.png" )



paintings = [
  Image.read( "#{basedir}/clout-punks/ii/girl_with_a_pearl_earring.png" ),
  Image.read( "#{basedir}/clout-punks/ii/american_gothic.png" ),
  Image.read( "#{basedir}/clout-punks/ii/michelangelo_portrait.png" ),

  Image.read( "#{basedir}/clout-punks/ii/van_gogh_self-portrait.png" ),
  Image.read( "#{basedir}/clout-punks/ii/mona_lisa.png" ),
  Image.read( "#{basedir}/clout-punks/ii/pablo_picasso.png" ),

  Image.read( "#{basedir}/clout-punks/ii/a_sunday_afternoon_on_the_island_of_la_grande_jatte.png" ),
  Image.read( "#{basedir}/clout-punks/ii/the_son_of_man.png" ),
  Image.read( "#{basedir}/clout-punks/ii/the_scream.png" ),

#  Image.read( "#{basedir}/clout-punks/ii/claude_monet_self_portrait.png" ),
]


## quiz no. 4
composite = ImageComposite.new( 3, 3 )

paintings.each do |punk|
  composite << punk
end

composite.save( "./tmp/quiz_iiii.png" )
composite.zoom(2).save( "./tmp/quiz_iiii@2x.png" )
composite.zoom(4).save( "./tmp/quiz_iiii@4x.png" )
composite.zoom(8).save( "./tmp/quiz_iiii@8x.png" )




puts "bye"