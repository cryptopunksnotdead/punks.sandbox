require 'punks'



flag = Image.read( './saudi_arabia.png' )

#############
## variant 1
##   place saudi in the middle of two flags


specs = Csv.parse( <<TXT )
Dark 1, Luxurious Beard, White Shemagh & Agal, MAX BIDDING
Dark 2, Luxurious Beard, Red Shemagh & Agal,  Laser Eyes

Light 1,  Normal Brown Beard & Mustache, Red Shemagh & Agal, Regular Pixel Shades
Light 1,  Messy White Beard, Brown Shemagh & Agal, Big Purple Shades
Dark 1,   Brown Shemagh & Agal, Big Pixel Shades, Rosewood Pipe
Light 2,  Short White Beard, Red Shemagh & Agal, Stylish Nerd Glasses

TXT
pp specs


saudis = ImageComposite.new( 2, specs.size/2, width: 24*2,
                                            height: 24 )


specs.each do |attributes|
   saudi = Saudi::Image.generate( *attributes )

   frame = Image.new( 24*2, 24 )
   frame.compose!( flag )
   frame.compose!( flag, 24, 0 )
   frame.compose!( saudi.mirror, 12, 0 )

   saudis << frame
end

saudis.save( "./tmp/saudis.png" )
saudis.zoom(4).save( "./tmp/saudis@4x.png" )





saudis = ImageComposite.new( 2, specs.size/2, width: 24*3,
                                              height: 24 )


specs.each do |attributes|
   saudi = Saudi::Image.generate( *attributes )

   frame = Image.new( 24*3, 24 )
   frame.compose!( flag )
   frame.compose!( flag, 24, 0 )
   frame.compose!( flag, 24*2, 0 )
   frame.compose!( saudi.mirror, 24, 0 )

   saudis << frame
end

saudis.save( "./tmp/saudis_v2.png" )
saudis.zoom(4).save( "./tmp/saudis_v2@4x.png" )




puts "bye"