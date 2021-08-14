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
. . . . . . . @ x @ @ x x x @ @ @ . . . . . . .
. . . . . . @ x x x x x x x x x @ . . . . . . .
. . . . . . @ x x o @ x x x o @ @ . . . . . . .
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
  woman = Image.parse( design, colors: [BLACK, color, WHITE])
  woman.save( "./i/woman-#{key}.png")
  woman.zoom(4).save( "./i/woman-#{key}4x.png" )
  woman.zoom(8).save( "./i/woman-#{key}8x.png" )
end


eyes_design = <<TXT
x @ . . . x @
TXT

eyes_colors = {
  blue:   '259FAC',  ## blue_eye_roll
  brown:  '682B15',  ## brown_to_the_right
  green: '8EA226',   ## green_eye_roll
  purple: '792CC7',  ## purple_straight
}

eyes_colors.each do |key,color|
  eyes = Image.parse( eyes_design, colors: [color, WHITE])
  woman = Image.new( 24, 24 )
  woman.compose!( eyes, 9, 3 )
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



puts "bye"