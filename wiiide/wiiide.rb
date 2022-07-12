####################
#  to run use.
#
#  ruby ./wiiide.rb


require 'punks'



class Image
  def stretch( factor=3 )

    ## create a new stretch factor x image (2x, 3x, etc.)

    width  = @img.width*factor
    height = @img.height

    img = Image.new( width, height )

    @img.height.times do |y|
      @img.width.times do |x|
         pixel = @img[x,y]
           factor.times do |n|
             img[n+factor*x, y] = pixel
           end
      end # each x
    end # each y

    img
  end

  def wiiide( factor=6, left: 9,
                        right: 9,
                        top: 5,
                        bottom: 0 )
     img = crop( left, top,
                 @img.width-left-right,
                 @img.height-top-bottom )
     img = img.stretch( factor )
     img
  end
end   ## class Image



specs = Csv.parse( <<TXT )
 Alien, Bandana
 Male 3, 3D Glasses, Beanie
 Zombie, Crazy Hair
 Ape, Knitted Cap, Small Shades
TXT


pp specs

wiiides = ImageComposite.new( 2, 2,  width: 36,
                                     height: 19 )


specs.each_with_index do |attributes,i|
   punk = Punk::Image.generate( *attributes )

   punk.save( "./tmp/punk#{i}.png" )
   punk.zoom(8).save( "./tmp/punk#{i}@8x.png" )

   wiiide = punk.wiiide(3) # stretch by factor 3x
   wiiide.save( "./tmp/wiiide#{i}.png" )
   wiiide.zoom(20).save( "./tmp/wiiide#{i}@20x.png" )

   wiiide = punk.wiiide(6)  # stretch by factor 6x (default)
   wiiide.save( "./tmp/wiiiiiide#{i}.png" )
   wiiide.zoom(10).save( "./tmp/wiiiiiide#{i}@10x.png" )

   wiiides << wiiide
end


wiiides.save( "./tmp/wiiides.png" )
wiiides.zoom(10).save( "./tmp/wiiides@10x.png" )

puts "bye"

