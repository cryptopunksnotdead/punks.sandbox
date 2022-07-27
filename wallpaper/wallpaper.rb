require  'punks'


specs = Csv.parse( <<TXT )
   Alien, Headband
   Ape, Bandana
   Ape, Knitted Cap, Earring, Gold Chain
   Zombie, Crazy Hair, 3D Glasses
   Male 3, Peak Spike, Spots, VR
   Male 2, Normal Beard Black, Hoodie
   Female 3, Wild Blonde, Mole, Big Shades
   Skeleton Female, Flowers
   Female 1, Straight Hair, Sombrero, Green Eye Shadow
   Female 2, Rainbow Hair
   Male 3, Wallstreetbets Hair, Regular Shades Reflective
   Male 1, Wallstreetbets Hair Dark, Regular Shades Reflective
   Demon, Heart Shades
TXT


punks = []
specs.each do |attributes|
  punks << Punk::Image.generate( *attributes )
end



def random_punk( punks )
  id = rand( punks.size)

  punk = punks[ id ]

  punk = case rand( 100 )
         when 0..50   then punk         # 50% right-looking
         when 51..99  then punk.mirror  # 50% left-looking
         end

  punk
end



class Wallpaper < Image
   def initialize( cols, rows, width: 24, height: 24, background: 0x0 )
      @tile_width  = width
      @tile_height = height
      @cols = cols
      @rows = rows

      super( @tile_width*@cols, @tile_height*@rows, background )
   end



   def add!( punk, col, row, zoom: 1 )
      punk = punk.zoom( zoom )   if zoom > 1
    x,y = col*@tile_width*zoom, row*@tile_height*zoom

     compose!( punk, x, y )
   end


   def fill_random!( punks, background: nil )
     cols = @cols / 4
     rows = @rows / 4

     cols.times do |col|
      rows.times do |row|
        zoom = case rand( 100 )
               when 0..14 then 4
               when 15..49 then 2
               when 50..99 then 1
               end

         if zoom == 4
            add!( random_punk( punks ), col, row, zoom: zoom )
         elsif zoom == 2
             2.times do |x|
               2.times do |y|
                 if rand( 100 ) <= 29
                    add!( random_punk( punks ), col*2+x, row*2+y, zoom: zoom )
                 else
                    2.times do |n|
                      2.times do |m|
                        add!( random_punk( punks ), (col*2+x)*2+n, (row*2+y)*2+m, zoom: 1 )
                      end
                    end
                  end
                end
              end
         else
             4.times do |x|
              4.times do |y|
                  add!( random_punk( punks ), col*4+x, row*4+y, zoom: zoom )
              end
             end
         end
      end
    end
  end
end



srand( 42 )   ## make runs deterministic / repeatable with seed for pseudo-random generator






wallpaper = Wallpaper.new( 10*4, 5*4, width: 24,
                                      height: 24,
                                      background: '#638596' )

wallpaper.fill_random!( punks )
wallpaper.save( "./tmp/wallpaper-#{wallpaper.width}x#{wallpaper.height}.png" )



puts "bye"