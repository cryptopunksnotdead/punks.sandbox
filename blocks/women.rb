###########
#  to run use:
#    ruby ./women.rb


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


##
# alt design ii
#   uses extra 2px "high brows"
#   bigger eyes (2x2)

design_ii =<<TXT
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
. . . . . . . @ x ^ ^ x x x ^ ^ @ . . . . . . .
. . . . . . @ x x o o x x x o o @ . . . . . . .
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


##
# alt design iii
#   uses extra "high brows" 3px plus padding line
#   bigger eyes (2x2)
#   no black outline
#    nose and neck in derived color

design_iii = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . x x x x x x . . . . . . . . .
. . . . . . . . x x x x x x x x . . . . . . . .
. . . . . . . x x x x x x x x x x . . . . . . .
. . . . . . . x ^ ^ ^ x x ^ ^ ^ x . . . . . . .
. . . . . . . x x x x x x x x x x . . . . . . .
. . . . . . x x x o o x x x o o x . . . . . . .
. . . . . . x x x @ o x x x @ o x . . . . . . .
. . . . . . x x x x x x x x x x x . . . . . . .
. . . . . . . x x x x x x x x x x . . . . . . .
. . . . . . . x x x x x ^ x x x x . . . . . . .
. . . . . . . x x x x x x x x x x . . . . . . .
. . . . . . . x x x x @ @ @ x x x . . . . . . .
. . . . . . . . x x x x x x x ~ . . . . . . . .
. . . . . . . . x x ~ x x x ~ . . . . . . . . .
. . . . . . . . x x x ~ ~ ~ . . . . . . . . . .
. . . . . . . . x x x x x . . . . . . . . . . .
. . . . . . . . x x x x x . . . . . . . . . . .
TXT


##
# alt design iii (b)
#    like design iii - keeps black outline

design_iiib =<<TXT
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
. . . . . . . @ ^ ^ ^ x x ^ ^ ^ @ . . . . . . .
. . . . . . . @ x x x x x x x x @ . . . . . . .
. . . . . . @ x x o o x x x o o @ . . . . . . .
. . . . . . @ x x @ o x x x @ o @ . . . . . . .
. . . . . . @ @ x x x x x x x x @ . . . . . . .
. . . . . . . @ x x x x x x x x @ . . . . . . .
. . . . . . . @ x x x x ^ x x x @ . . . . . . .
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
end


skin_tones.each do |key,color|
  h,s,l  = Color.to_hsl( Color.parse(color))
  color2 = Color.from_hsl( h, [s-0.1,0.0].max, [l-0.20,0.0].max )

  woman = Image.parse( design_ii, colors: [BLACK, color, WHITE, color2])
  woman.save( "./i/woman-#{key}-ii.png")
  woman.zoom(4).save( "./i/woman-#{key}-ii4x.png" )
end


skin_tones.each do |key,color|
  h,s,l  = Color.to_hsl( Color.parse(color))
  color2 = Color.from_hsl( h, [s-0.1,0.0].max, [l-0.2,0.0].max )
  color3 = Color.from_hsl( h, [s-0.1,0.0].max, [l-0.05,0.0].max )

  woman = Image.parse( design_iii, colors: [BLACK, color, WHITE, color2, color3])
  woman.save( "./i/woman-#{key}-iii.png")
  woman.zoom(4).save( "./i/woman-#{key}-iii4x.png" )
end

skin_tones.each do |key,color|
  h,s,l  = Color.to_hsl( Color.parse(color))
  color2 = Color.from_hsl( h, [s-0.1,0.0].max, [l-0.20,0.0].max )

  woman = Image.parse( design_iiib, colors: [BLACK, color, WHITE, color2])
  woman.save( "./i/woman-#{key}-iiib.png")
  woman.zoom(4).save( "./i/woman-#{key}-iiib4x.png" )
end





## todo/check: add big nose - why? why not?
#  @ .
#  . @
#  @ @     instead of simple single pixel @  ???



eyes_design = <<TXT
 @ . . . . @
TXT

eyes_colors = {
  blue:   '259FAC',   ## blue_eye_roll
  brown:  '682B15',   ## brown_to_the_right
  green:  '8EA226',   ## green_eye_roll
  purple: '792CC7',   ## purple_straight
}

eyes_colors.each do |key,color|
  eyes = Image.parse( eyes_design, colors: [color])
  woman = Image.new( 24, 24 )
  woman.compose!( eyes, 9, 13 )
  woman.save( "./i/woman-eyes-#{key}.png")
  woman.zoom(4).save( "./i/woman-eyes-#{key}4x.png" )
end



####
#  7	Lips Colors

lips_design = <<TXT
@ @ @
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
end




## try some alternate lip designs - why? why not?
lips_smile_design = <<TXT
@ . . .
. @ @ @
TXT

lips_smiley_design = <<TXT
@ . . . @
. @ @ @ .
TXT

lips = Image.parse( lips_smile_design, colors: [BLACK])
woman = Image.new( 24, 24 )
woman.compose!( lips, 10, 17 )
woman.save( "./i/woman-lips-smile.png")
woman.zoom(4).save( "./i/woman-lips-smile4x.png" )

lips = Image.parse( lips_smiley_design, colors: [BLACK])
woman = Image.new( 24, 24 )
woman.compose!( lips, 10, 17 )
woman.save( "./i/woman-lips-smiley.png")
woman.zoom(4).save( "./i/woman-lips-smiley4x.png" )



puts "bye"