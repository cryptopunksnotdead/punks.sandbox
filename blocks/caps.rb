###########
#  to run use:
#    ruby ./caps.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'

#####
# cap pixel art design - 14x5, 2 colors
#
#  51 pixel - #8119b7 / rgb(129  25 183) - hsl(279°  76%  41%)
#   2 pixel - #b261dc / rgb(178  97 220) - hsl(280°  64%  62%)

cap_design = <<TXT
. . @ @ @ @ @ @ @ . . . . .
. @ @ @ @ @ @ x @ @ . . . .
@ @ @ @ @ @ @ @ x @ . . . .
@ @ @ @ @ @ @ @ @ @ @ @ @ .
@ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT


hues = [0,      ## red
        30,     ## orange
        90,     ## chartreuse
        120,    ## green
        240,    ## blue
        300,    ## magenta
        330,    ## fuchsia
        ]
hues.each do |hue|
  img  = Image.parse( cap_design, colors: [[hue,         0.76, 0.41],
                                           [(hue+1)%360, 0.64 ,0.62]] )

  punk = Image.new( 24, 24 )
  punk.compose!( img, 6, 4 )
  punk.save( "./tmp/cap_#{hue}.png" )
end








