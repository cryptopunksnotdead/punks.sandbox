require 'pixelart'


module Pixelart
class Color
  TRANSPARENT = 0            # rgba(  0,  0,  0,  0)
  BLACK       = 0xff         # rgba(  0,  0,  0,255)
  WHITE       = 0xffffffff   # rgba(255,255,255,255)
end

class Image
  def led( led=8, spacing: 2, round_corner: false )

    width  = @img.width*led  + (@img.width-1)*spacing
    height = @img.height*led + (@img.height-1)*spacing

    puts " #{width}x#{height}"

    img = Image.new( width, height, Color::BLACK )

    @img.width.times do |x|
      @img.height.times do |y|
        pixel = @img[x,y]
        ## use raisin black for black
        pixel = 0x242124ff    if  pixel == Color::BLACK
        pixel = Color::BLACK  if  pixel == Color::TRANSPARENT
        led.times do |n|
          led.times do |m|
            ## round a little - drop all four corners for now
            next  if round_corner &&
                    [[0,0],[0,1],[1,0],[1,1],[0,2],[2,0],
                     [0,led-1],[0,led-2],[1,led-1],[1,led-2],[0,led-3],[2,led-1],
                     [led-1,0],[led-1,1],[led-2,0],[led-2,1],[led-1,2],[led-3,0],
                     [led-1,led-1],[led-1,led-2],[led-2,led-1],[led-2,led-2],[led-1,led-3],[led-3,led-1],
                    ].include?( [n,m] )
            img[x*led+n + spacing*x,
                y*led+m + spacing*y] = pixel
          end
        end
      end
    end
    img
  end
end # class Image
end # module Pixelart



punk = Pixelart::Image.read( './i/punk-3100.png' )
puts " #{punk.width}x#{punk.height}"

punk_led = punk.led( 8, spacing: 2 )
punk_led.save( './i/punk-3100_led8x.png' )

punk_led = punk.led( 16, spacing: 3 )
punk_led.save( './i/punk-3100_led16x.png' )

punk_led = punk.led( 16, spacing: 8, round_corner: true )
punk_led.save( './i/punk-3100_led16xr.png' )





ids = [
 3393,   # zombie
 172,    # blondie
 2964,   # beanie
]
ids.each do |id|
  name = '%04d' % id
  punk = Pixelart::Image.read( "./i/punk-#{name}.png" )
  puts " #{punk.width}x#{punk.height}"

  punk_led = punk.led( 8, spacing: 2 )
  punk_led.save( "./i/punk-#{name}_led8x.png" )

  punk_led = punk.led( 16, spacing: 3 )
  punk_led.save( "./i/punk-#{name}_led16x.png" )

  punk_led = punk.led( 16, spacing: 8, round_corner: true )
  punk_led.save( "./i/punk-#{name}_led16xr.png" )
end


puts "bye"


