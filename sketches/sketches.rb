#####
#  to run use
#    $ ruby ./sketches.rb


require 'pixelart'




module Pixelart


  class Image
    def sketch( sketch=4, line: 1 )
       # todo: line - find a better name eg. line_strenght/width or such?
      width  = @img.width*sketch  + (@img.width+1)*line
      height = @img.height*sketch + (@img.height+1)*line

      puts "  #{width}x#{height}"

      img = Image.new( width, height, Color::WHITE )

      @img.width.times do |x|
        @img.height.times do |y|
          pixel = @img[x,y]

          ## get surrounding pixels - if "out-of-bound" use transparent (0)
          left   =  x == 0  ? Color::TRANSPARENT : @img[x-1,y]
          top    =  y == 0  ? Color::TRANSPARENT : @img[x  ,y-1]

          if pixel != left   ## draw vertical line
              (sketch+line*2).times do |n|
                line.times do |m|
                  img[    x*sketch + line*x + m,
                      n + y*sketch + line*y] = Color::BLACK
                end
              end
          end

          if pixel != top   ## draw horizontal line
             (sketch+line*2).times do |n|
               line.times do |m|
                 img[n + x*sketch + line*x,
                         y*sketch + line*y + m] = Color::BLACK
                end
             end
          end


          ## check special edge case for x and y to add "finish-up" right and bottom line
          if x == @img.width-1 && pixel != Color::TRANSPARENT
             ## draw vertical line
             (sketch+line*2).times do |n|
              line.times do |m|
                img[    (x+1)*sketch + line*(x+1) + m,
                    n + y*sketch + line*y] = Color::BLACK
              end
             end
          end

          if y== @img.height-1 && pixel != Color::TRANSPARENT
            ## draw horizontal line
            (sketch+line*2).times do |n|
              line.times do |m|
                img[n + x*sketch + line*x,
                        (y+1)*sketch + line*(y+1) + m] = Color::BLACK
              end
            end
          end
        end
      end

      img
  end
end # class Image
end # module Pixelart


punk = Pixelart::Image.read( './i/punk-3100.png' )
punk_sketch = punk.sketch( 4 )
punk_sketch.save( './i/punk-3100_sketch4x.png' )
punk_sketch = punk.sketch( 4, line: 4 )
punk_sketch.save( './i/punk-3100_sketch4x4.png' )
punk_sketch = punk.sketch( 8, line: 2 )
punk_sketch.save( './i/punk-3100_sketch8x2.png' )
punk_sketch = punk.sketch( 12, line: 3 )
punk_sketch.save( './i/punk-3100_sketch12x3.png' )


ids = [
 3393,   # zombie
 172,    # blondie
 2964,   # beanie
]
ids.each do |id|
  name = '%04d' % id
  punk = Pixelart::Image.read( "./i/punk-#{name}.png" )

  punk_sketch = punk.sketch( 4 )
  punk_sketch.save( "./i/punk-#{name}_sketch4x.png" )
  punk_sketch = punk.sketch( 4, line: 4 )
  punk_sketch.save( "./i/punk-#{name}_sketch4x4.png" )
  punk_sketch = punk.sketch( 8, line: 2 )
  punk_sketch.save( "./i/punk-#{name}_sketch8x2.png" )
  punk_sketch = punk.sketch( 12, line: 3 )
  punk_sketch.save( "./i/punk-#{name}_sketch12x3.png" )
end


puts "bye"


