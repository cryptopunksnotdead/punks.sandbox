###########
#  to run use:
#    ruby ./dodge.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'

### (re)use some pre-defined color names - add more? why? why not?
BLACK = '000000'
WHITE = 'FFFFFF'



design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . . @ x x x x x x @ . . . . . . . .
. . . . . . . @ x x x x x x x x @ . . . . . . .
. . . . . . . @ x x x x x x x x @ . . . . . . .
. . . . . . . @ x x x x x x x x @ . . . . . . .
. . . . . . @ x x ^ ^ x x x ^ ^ @ . . . . . . .
. . . . . . @ x x @ o x x x @ o @ . . . . . . .
. . . . . . @ @ x x x x x x x x @ . . . . . . .
. . . . . . . @ x x x x x x x x @ . . . . . . .
. . . . . . . @ x x x x @ x x x @ . . . . . . .
. . . . . . . @ x x x x x x x x @ . . . . . . .
. . . . . . . @ x x x @ @ @ x x @ . . . . . . .
. . . . . . . . @ x x x x x x @ . . . . . . . .
. . . . . . . . @ x @ x x x @ . . . . . . . . .
. . . . . . . . @ x x @ @ @ . . . . . . . . . .
. . . . . . . . @ x x x @ . . . . . . . . . . .
. . . . . . . . @ x x x @ . . . . . . . . . . .
TXT


skin_tones = {
  deep_bronze:  '793F11',
  light_warm_olive: 'E2AE72',
  deep_warm_gold: '9A5816',
  deep_neutral: '5F3201',
  medium_olive: 'CB9655',
  medium_gold: 'C58247',
 cyber_green: '77AD19',
 burning_red: 'CA371D',
 cool_blue: '5A9BE6',
  # -- Rainbow Bright  -- multi color (gradient) - add/possible? - how? skip for now
  golden: 'E6A100',
  night_goddess: '4B228D',
}


pp skin_tones


skin_tones.each do |key,color|
  h,s,l  = Color.to_hsl( Color.parse(color))
  color2 = Color.from_hsl( h, [s-0.1,0.0].max, [l-0.20,0.0].max )

  # print "%20s  " % key
  # print "#{Color.format( Color.parse(color) )}"
  # print "\n"


  woman = Image.parse( design, colors: [BLACK, color, WHITE, color2])
  woman.save( "./i/woman-#{key}.png")
  woman.zoom(4).save( "./i/woman-#{key}4x.png" )
  woman.zoom(8).save( "./i/woman-#{key}8x.png" )
end


eyes_design = <<TXT
 @ x . . . @ x
TXT

eyes_colors = {
  blue:   '259FAC',   ## blue_eye_roll
  brown:  '682B15',   ## brown_to_the_right
  green:  '8EA226',   ## green_eye_roll
  purple: '792CC7',   ## purple_straight
}

eyes_colors.each do |key,color|
  eyes = Image.parse( eyes_design, colors: [color, WHITE])
  woman = Image.new( 24, 24 )
  woman.compose!( eyes, 9, 13 )
  woman.save( "./i/woman-eyes-#{key}.png")
  woman.zoom(4).save( "./i/woman-eyes-#{key}4x.png" )
  woman.zoom(8).save( "./i/woman-eyes-#{key}8x.png" )
end



####
#  7	Lips Colors

lips_design = <<TXT
@ @ @
TXT

lips_smile_design = <<TXT
@ . . .
. @ @ @
TXT

lips_smiley_design = <<TXT
@ . . . @
. @ @ @ .
TXT


lips_colors =  {
  passion_red:  'D03C18',
  burgundy:     '4D010A',
  purple:       '8A1EE6',
  party_pink:   'E90878',
  flashy_blue:  '5BE1FC',    ## todo/fix: use two color (upper/lower lips - possible - why?)
  gold:         'F0BA1D',
  space:        '31003C',
}


lips_colors.each do |key,color|
  lips = Image.parse( lips_design, colors: [color])
  woman = Image.new( 24, 24 )
  woman.compose!( lips, 11, 18 )
  woman.save( "./i/woman-lips-#{key}.png")
  woman.zoom(4).save( "./i/woman-lips-#{key}4x.png" )
  woman.zoom(8).save( "./i/woman-lips-#{key}8x.png" )
end

lips_colors.each do |key,color|
  lips = Image.parse( lips_smile_design, colors: [color])
  woman = Image.new( 24, 24 )
  woman.compose!( lips, 10, 17 )
  woman.save( "./i/woman-lips-smile-#{key}.png")
  woman.zoom(4).save( "./i/woman-lips-smile-#{key}4x.png" )
  woman.zoom(8).save( "./i/woman-lips-smile-#{key}8x.png" )
end

lips_colors.each do |key,color|
  lips = Image.parse( lips_smiley_design, colors: [color])
  woman = Image.new( 24, 24 )
  woman.compose!( lips, 10, 17 )
  woman.save( "./i/woman-lips-smiley-#{key}.png")
  woman.zoom(4).save( "./i/woman-lips-smiley-#{key}4x.png" )
  woman.zoom(8).save( "./i/woman-lips-smiley-#{key}8x.png" )
end




####
## test some pics with hair

sidehair_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . @ @ @ @ . . . . . . . . . .
. . . . . . . . @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . . @ @ . . . . @ . @ @ @ . . . . . .
. . . . . . @ @ . . . . . . . . @ @ . . . . . .
. . . . . . @ @ . . . . . . . . @ @ . . . . . .
. . . . . . @ . . . . . . . . . @ @ . . . . . .
. . . . . . @ . . . . . . . . . @ @ . . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . @ @ @ @ . . . . .
. . . . . . . . . . . . . . @ @ @ @ @ . . . . .
. . . . . . . . . . . . . . @ @ @ . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

wildhair_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . @ @ @ @ . @ . . . . . . . .
. . . . . . . @ . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ . @ . . . . . .
. . . . . @ @ @ @ @ @ @ @ @ @ @ @ . @ . . . . .
. . . . . . @ @ @ @ . @ @ @ @ @ @ @ @ . . . . .
. . . . . @ @ @ @ . @ . @ . . @ @ @ . . . . . .
. . . . @ . @ @ @ . . . @ . . . @ @ @ . . . . .
. . . . . @ @ @ . . . . @ . . . . @ . @ . . . .
. . . . @ . @ . . . . . . @ . . . @ @ . . . . .
. . . @ @ @ @ . . . . . . . . . . @ @ . . . . .
. . . . . @ @ . . . . . . . . . . @ @ @ . . . .
. . . . . @ @ . . . . . . . . . . @ . . . . . .
. . . . @ . . . . . . . . . . . . . @ . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT


pigtails_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . @ @ . . @ @ @ @ @ @ @ @ . . @ @ . . . .
. . . @ @ @ @ x @ @ @ @ @ @ @ @ x @ @ @ @ . . .
. . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . .
. . @ @ @ @ . @ @ @ . . . . . @ @ . @ @ @ @ . .
. . @ @ @ . . @ @ . . . . . . . @ . . @ @ @ . .
. . @ @ @ . . @ . . . . . . . . . . . @ @ @ . .
. . . @ . . . . . . . . . . . . . . . . @ . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

bob_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . @ @ @ @ @ @ @ @ . @ @ @ . . . . . .
. . . . . . @ @ . @ @ @ @ . . . @ @ . . . . . .
. . . . . . @ @ . . . @ . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ @ . . . . . . . . . @ @ . . . . . .
. . . . . @ @ . . . . . . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . @ @ @ @ @ . . . . . . . @ @ @ @ . . . .
. . . . . . @ @ @ @ . . . . . @ @ . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

ORANGE     = 'e65700'
GREEN      = '28b143'
BLONDE     = 'fff68e'
WHITESMOKE = 'f5f5f5'


sidehair_black      = Image.parse( sidehair_design, colors: [BLACK] )
sidehair_blonde     = Image.parse( sidehair_design, colors: [BLONDE] )
sidehair_whitesmoke = Image.parse( sidehair_design, colors: [WHITESMOKE] )
sidehair_orange     = Image.parse( sidehair_design, colors: [ORANGE] )
sidehair_green      = Image.parse( sidehair_design, colors: [GREEN] )


pigtails_black      = Image.parse( pigtails_design, colors: [BLACK, 'ffd926'] )
pigtails_blonde     = Image.parse( pigtails_design, colors: [BLONDE, 'ffd926'] )
pigtails_whitesmoke = Image.parse( pigtails_design, colors: [WHITESMOKE, 'ffd926'] )
pigtails_orange     = Image.parse( pigtails_design, colors: [ORANGE, 'ffd926'] )
pigtails_green      = Image.parse( pigtails_design, colors: [GREEN, 'ffd926'] )
pigtails_fuchsia    = Image.parse( pigtails_design, colors: ['870057', 'ffd926'] )
pigtails_turquoise  = Image.parse( pigtails_design, colors: ['06AD93', 'ffd926'] )


bob_black      = Image.parse( bob_design, colors: [BLACK] )
bob_blonde     = Image.parse( bob_design, colors: [BLONDE] )
bob_whitesmoke = Image.parse( bob_design, colors: [WHITESMOKE] )
bob_orange     = Image.parse( bob_design, colors: [ORANGE] )
bob_green      = Image.parse( bob_design, colors: [GREEN] )
bob_fuchsia    = Image.parse( bob_design, colors: ['870057'] )
bob_turquoise  = Image.parse( bob_design, colors: ['06AD93'] )


wildhair_blonde = Image.parse( wildhair_design, colors: [BLONDE] )


woman = Image.read( "./i/woman-light_warm_olive.png" )
woman.compose!( bob_blonde )
woman.save( "./i/woman_i_a.png" )
woman.zoom(4).save( "./i/woman_i_ax4.png" )

woman = Image.read( "./i/woman-light_warm_olive.png" )
woman.compose!( bob_blonde )
woman.compose!( Image.read( "./i/woman-eyes-blue.png") )
woman.compose!( Image.read( "./i/woman-lips-party_pink.png") )
woman.save( "./i/woman_i_b.png" )
woman.zoom(4).save( "./i/woman_i_bx4.png" )

woman = Image.read( "./i/woman-light_warm_olive.png" )
woman.compose!( pigtails_blonde )
woman.compose!( Image.read( "./i/woman-eyes-purple.png") )
woman.compose!( Image.read( "./i/woman-lips-smile-party_pink.png") )
woman.save( "./i/woman_i_c.png" )
woman.zoom(4).save( "./i/woman_i_cx4.png" )



woman = Image.read( "./i/woman-light_warm_olive.png" )
woman.compose!( bob_whitesmoke )
woman.save( "./i/woman_ii_a.png" )
woman.zoom(4).save( "./i/woman_ii_ax4.png" )

woman = Image.read( "./i/woman-light_warm_olive.png" )
woman.compose!( bob_whitesmoke )
woman.compose!( Image.read( "./i/woman-eyes-blue.png") )
woman.compose!( Image.read( "./i/woman-lips-flashy_blue.png") )
woman.save( "./i/woman_ii_b.png" )
woman.zoom(4).save( "./i/woman_ii_bx4.png" )

woman = Image.read( "./i/woman-light_warm_olive.png" )
woman.compose!( pigtails_whitesmoke )
woman.compose!( Image.read( "./i/woman-eyes-purple.png") )
woman.compose!( Image.read( "./i/woman-lips-smile-flashy_blue.png") )
woman.save( "./i/woman_ii_c.png" )
woman.zoom(4).save( "./i/woman_ii_cx4.png" )




woman = Image.read( "./i/woman-golden.png" )
woman.compose!( bob_fuchsia )
woman.save( "./i/woman_iii_a.png" )
woman.zoom(4).save( "./i/woman_iii_ax4.png" )

woman = Image.read( "./i/woman-golden.png" )
woman.compose!( bob_fuchsia )
woman.compose!( Image.read( "./i/woman-eyes-blue.png") )
woman.compose!( Image.read( "./i/woman-lips-purple.png") )
woman.save( "./i/woman_iii_b.png" )
woman.zoom(4).save( "./i/woman_iii_bx4.png" )

woman = Image.read( "./i/woman-golden.png" )
woman.compose!( pigtails_fuchsia )
woman.compose!( Image.read( "./i/woman-eyes-purple.png") )
woman.compose!( Image.read( "./i/woman-lips-smile-purple.png") )
woman.save( "./i/woman_iii_c.png" )
woman.zoom(4).save( "./i/woman_iii_cx4.png" )


woman = Image.read( "./i/woman-golden.png" )
woman.compose!( bob_turquoise )
woman.save( "./i/woman_iiii_a.png" )
woman.zoom(4).save( "./i/woman_iiii_ax4.png" )

woman = Image.read( "./i/woman-golden.png" )
woman.compose!( bob_turquoise )
woman.compose!( Image.read( "./i/woman-eyes-blue.png") )
woman.compose!( Image.read( "./i/woman-lips-space.png") )
woman.save( "./i/woman_iiii_b.png" )
woman.zoom(4).save( "./i/woman_iiii_bx4.png" )

woman = Image.read( "./i/woman-golden.png" )
woman.compose!( pigtails_turquoise )
woman.compose!( Image.read( "./i/woman-eyes-purple.png") )
woman.compose!( Image.read( "./i/woman-lips-smile-space.png") )
woman.save( "./i/woman_iiii_c.png" )
woman.zoom(4).save( "./i/woman_iiii_cx4.png" )



woman = Image.read( "./i/woman-night_goddess.png" )  ## check: fix typo
woman.compose!( bob_black )
woman.save( "./i/woman_v_a.png" )
woman.zoom(4).save( "./i/woman_v_ax4.png" )

woman = Image.read( "./i/woman-night_goddess.png" )  ## check: fix typo
woman.compose!( bob_black )
woman.compose!( Image.read( "./i/woman-eyes-green.png") )
woman.compose!( Image.read( "./i/woman-lips-burgundy.png") )
woman.save( "./i/woman_v_b.png" )
woman.zoom(4).save( "./i/woman_v_bx4.png" )

woman = Image.read( "./i/woman-night_goddess.png" )  ## check: fix typo
woman.compose!( pigtails_black )
woman.compose!( Image.read( "./i/woman-eyes-green.png") )
woman.compose!( Image.read( "./i/woman-lips-smile-burgundy.png") )
woman.save( "./i/woman_v_c.png" )
woman.zoom(4).save( "./i/woman_v_cx4.png" )


woman = Image.read( "./i/woman-night_goddess.png" )  ## check: fix typo
woman.compose!( bob_whitesmoke )
woman.save( "./i/woman_vi_a.png" )
woman.zoom(4).save( "./i/woman_vi_ax4.png" )

woman = Image.read( "./i/woman-night_goddess.png" )  ## check: fix typo
woman.compose!( bob_whitesmoke )
woman.compose!( Image.read( "./i/woman-eyes-brown.png") )
woman.compose!( Image.read( "./i/woman-lips-burgundy.png") )
woman.save( "./i/woman_vi_b.png" )
woman.zoom(4).save( "./i/woman_vi_bx4.png" )

woman = Image.read( "./i/woman-night_goddess.png" )  ## check: fix typo
woman.compose!( pigtails_whitesmoke )
woman.compose!( Image.read( "./i/woman-eyes-brown.png") )
woman.compose!( Image.read( "./i/woman-lips-smile-burgundy.png") )
woman.save( "./i/woman_vi_c.png" )
woman.zoom(4).save( "./i/woman_vi_cx4.png" )


puts "bye"