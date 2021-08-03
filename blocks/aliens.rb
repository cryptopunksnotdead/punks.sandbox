###########
#  to run use:
#    ruby ./aliens.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


punk = Pixelart::Image.read( "./i/alien-male.png" )

[180, 150, 120, 90, 60, 30, 0, 330, 300].each do |hue|
  saturation =  0.13
  lightness  = -0.30
  color_map = {
      '#c8fbfbff' => [hue, 0.86+saturation, 0.88+lightness],
      '#75bdbdff' => [hue, 0.35+saturation, 0.60+lightness],
      '#9be0e0ff' => [hue, 0.52+saturation, 0.74+lightness],
  }

  new_punk = punk.change_colors( color_map )
  new_punk.save( "./tmp/alien-male_#{hue}.png")
end

