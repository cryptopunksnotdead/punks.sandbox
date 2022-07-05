#############################################
#  generate / create pixel punk quiz composites - who is ___?

require 'pixelart'



enterprise = [
  Image.read( '../../punks.readymade/cinema_I_fictional_characters/sulu.png' ),
  Image.read( '../../punks.readymade/cinema_I_fictional_characters/nyota_uhura.png' ),
  Image.read( '../../punks.readymade/cinema_I_fictional_characters/spock.png' ),
  Image.read( '../../punks.readymade/cinema_I_fictional_characters/kirk.png' ),
]

## quiz no. 5
composite = ImageComposite.new( 2, 2 )

enterprise.each do |punk|
  composite << punk
end



composite.save( "./tmp/quiz_v.png" )
composite.zoom(2).save( "./tmp/quiz_v@2x.png" )
composite.zoom(4).save( "./tmp/quiz_v@4x.png" )
composite.zoom(8).save( "./tmp/quiz_v@8x.png" )





star_wars = [
  'c3po_(3)',
  'chewbacca',
  'count_dooku',
  'darth_maul',

  'han_solo',
  'grogu',
  'darth_sidious',
  'lando_calrissian',

  'han_solo_hoth',
  'darth_vader_(2)',
  'luke_skywalker',
  'qui-gon_jinn',

  'mace_windu',
  'obi-wan_kenobi',
  'princess_leia_(2)',
  'r2d2',
]

## quiz no. 6
composite = ImageComposite.new( 4, 4 )

star_wars.each do |name|
  punk = Image.read( "../../punks.readymade/cinema_I_star_wars/#{name}.png" )
  composite << punk
end



composite.save( "./tmp/quiz_vi.png" )
composite.zoom(2).save( "./tmp/quiz_vi@2x.png" )
composite.zoom(4).save( "./tmp/quiz_vi@4x.png" )
composite.zoom(8).save( "./tmp/quiz_vi@8x.png" )







def gen_palette( hex )
  ## from black to white (with upper/darker and lower/lighter cut-offs)
  color = Color.parse( hex )
  h,s,l = Color.to_hsl( color )

  pp h
  pp s
  pp l

  darker = 0.3    ## cut-off colors starting from black
  lighter = 0.05   ## cut-off colors starting from white

  ldiff = (1.0 - darker - lighter)

  puts "  ldiff: #{ldiff}"

  colors = []
  256.times do |i|
     lnew = darker+(ldiff*i / 256.0)
     puts "  #{i} - #{lnew}"
     colors << Color.from_hsl( h, s, lnew)
  end

  colors
end




beatles = [
  'john_lennon',
  'paul_mccartney_(2)',
  'ringo_starr_(2)',
  'george_harrison_(2)',
]

## quiz no. 7


composite = ImageComposite.new( 2, 2 )

RED    = '#ff0000'
GREEN  = '#00ff00'
YELLOW = '#ffff00'
BLUE   = '#0000ff'

backgrounds = [YELLOW, RED, BLUE, GREEN]
beatles.each_with_index do |name,i|
  punk = Image.new( 24, 24, backgrounds[ i ] )
  punk.compose!( Image.read( "../../punks.readymade/music_I_pop-n-rock/#{name}.png" ))
  composite << punk
end



composite.save( "./tmp/quiz_vii.png" )
composite.zoom(2).save( "./tmp/quiz_vii@2x.png" )
composite.zoom(4).save( "./tmp/quiz_vii@4x.png" )
composite.zoom(8).save( "./tmp/quiz_vii@8x.png" )



## try with "monochrome colors"
composite = ImageComposite.new( 2, 2 )

beatles.each_with_index do |name,i|
  punk = Image.read( "../../punks.readymade/music_I_pop-n-rock/#{name}.png" )
  punk = punk.change_palette8bit( gen_palette( backgrounds[ i ])  )

  img = Image.new( 24, 24, backgrounds[ i ] )
  img.compose!( punk )

  composite << img
end

composite.save( "./tmp/quiz_vii_(2).png" )
composite.zoom(2).save( "./tmp/quiz_vii_(2)@2x.png" )
composite.zoom(4).save( "./tmp/quiz_vii_(2)@4x.png" )
composite.zoom(8).save( "./tmp/quiz_vii_(2)@8x.png" )




## try variant with all left-two-right and "flipped" looking from top
composite = ImageComposite.new( 4, 1, width: 24, height: 24*2 )

beatles.each_with_index do |name,i|
  punk = Image.read( "../../punks.readymade/music_I_pop-n-rock/#{name}.png" )
  punk = punk.flip
  punk = punk.change_palette8bit( gen_palette( backgrounds[ i ])  )

  img  = Image.new( 24, 24*2, backgrounds[ i ] )
  img.compose!( punk, 0, 0 )
  composite << img
end

composite.save( "./tmp/quiz_vii_(3).png" )
composite.zoom(2).save( "./tmp/quiz_vii_(3)@2x.png" )
composite.zoom(4).save( "./tmp/quiz_vii_(3)@4x.png" )
composite.zoom(8).save( "./tmp/quiz_vii_(3)@8x.png" )



puts "bye"