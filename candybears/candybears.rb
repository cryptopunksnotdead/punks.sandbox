require 'pixelart'
require 'backgrounds'


bear = Image.read( './candybear-24x24.png')




YELLOW = '#ffff00'
RED    = '#ff0000'
GREEN  = '#00ff00'
BLUE   = '#0000ff'

bears = ImageComposite.new( 2, 2, background: [RED, GREEN, YELLOW, BLUE] )

bears << bear
bears << bear
bears << bear
bears << bear


bears.save( "./tmp/candybears.png" )
bears.zoom(4).save( "./tmp/candybears@4x.png" )
bears.zoom(8).save( "./tmp/candybears@8x.png" )


###
#  try with different backgrounds

bears = ImageComposite.new( 2, 2 )

bears << bear.background( 'ukraine' )
bears << bear.background( 'pride' )
bears << bear.background( 'ukraine', 'rainbow 1' )
bears << bear.background( 'ukraine', 'rainbow 2' )

bears.save( "./tmp/candybears-vol2.png" )
bears.zoom(4).save( "./tmp/candybears-vol2@4x.png" )
bears.zoom(8).save( "./tmp/candybears-vol2@8x.png" )


##
#  try different (derived) colors (hues)

def dump_colors( img )
  usage = Hash.new(0)
  img.pixels.each do |color|
    usage[ color ] += 1
  end

  usage.each do |color,count|
    print "%3d  " % count
    print Color.format( color )
    print "\n"
  end
end


dump_colors( bear )
#=>  234px  #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α(  0%) - TRANSPARENT
#    100px  #571c27 / rgb( 87  28  39) - hsl(349°  51%  23%)  -- darkest
#    138px  #891e2b / rgb(137  30  43) - hsl(353°  64%  33%)  -- dark
#     72px  #c42430 / rgb(196  36  48) - hsl(355°  69%  45%)  -- light
#     24px  #f68187 / rgb(246 129 135) - hsl(357°  87%  74%)  -- lightest
#      8px  #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE


BACKGROUND =   '#C0A65B'    ## gold?


def make_padded( bear, padding: 4 )
  ## add 4px (2p on each side transparent padding/border)
  bear_with_padding = Image.new( bear.width+padding, bear.height+padding )
  bear_with_padding.compose!( bear, padding/2, padding/2)
  bear_with_padding
end

bears = ImageComposite.new( 4, 3, width:  24+4,
                                  height: 24+4,
                                  background: BACKGROUND )


# hues = [0, 30, 60, 90,
#        120, 150, 180, 210,
#        240, 270, 300, 330]

hues = [ 60, 240, 270, 210,
         180, 0, 90, 150,
         120,  300,  30, 330]


hues.each do |hue|
  bear_new = bear.change_colors( {
                '#571c27' =>  [hue,         0.51, 0.23],
                '#891e2b' =>  [(hue+4)%360, 0.64, 0.33],
                '#c42430' =>  [(hue+6)%360, 0.69, 0.45],
                '#f68187' =>  [(hue+8)%360, 0.87, 0.74] })
  bears << make_padded( bear_new )
end

bears.save( "./tmp/candybears-vol3.png" )
bears.zoom(4).save( "./tmp/candybears-vol3@4x.png" )
bears.zoom(8).save( "./tmp/candybears-vol3@8x.png" )


## try a brighter version
bears = ImageComposite.new( 4, 3,  width:  24+4,
                                   height: 24+4,
                                   background: BACKGROUND )

hues.each do |hue|
  s = 0.28
  l = 0.08
  bear_new = bear.change_colors( {
                '#571c27' =>  [hue,         0.51+s, 0.23+l],
                '#891e2b' =>  [(hue+4)%360, 0.64+s, 0.33+l],
                '#c42430' =>  [(hue+6)%360, [1.0,0.69+s].min, 0.45+l],
                '#f68187' =>  [(hue+8)%360, [1.0,0.87+s].min, 0.74+l] })
  bears << make_padded( bear_new )
end

bears.save( "./tmp/candybears-vol4.png" )
bears.zoom(4).save( "./tmp/candybears-vol4@4x.png" )
bears.zoom(8).save( "./tmp/candybears-vol4@8x.png" )




FRAME = Image.read( "./frame_black-26x26.png" )


bears = ImageComposite.new( 4, 3,
                              width: 40+4,
                              height: 40+4 )

def make_framed( bear )
  framed = Image.new( 40, 40 )
  framed.compose!( FRAME )
  framed.compose!( Image.new( 26,26, BACKGROUND ), 7, 7 )  ## add non-trasparent / opaque background first
  framed.compose!( bear, 8, 9 )

  ## add 4px (2p on each side transparent padding/border)
  framed_with_padding = Image.new( 40+4, 40+4 )
  framed_with_padding.compose!( framed, 2, 2)
  framed_with_padding
end


hues.each do |hue|
  s = 0.28
  l = 0.08
  bear_new  = bear.change_colors( {
                '#571c27' =>  [hue,         0.51+s, 0.23+l],
                '#891e2b' =>  [(hue+4)%360, 0.64+s, 0.33+l],
                '#c42430' =>  [(hue+6)%360, [1.0,0.69+s].min, 0.45+l],
                '#f68187' =>  [(hue+8)%360, [1.0,0.87+s].min, 0.74+l] })

  bears << make_framed( bear_new )
end

bears.save( "./tmp/candybears-vol5.png" )
bears.zoom(4).save( "./tmp/candybears-vol5@4x.png" )



###
#  save a transparent collection version
#     for artbase.server

bears = ImageComposite.new( 4, 3,
                              width: 24,
                              height: 24 )

hues = [0, 30, 60, 90,
         120, 150, 180, 210,
         240, 270, 300, 330]

hues.each do |hue|
  s = 0.28
  l = 0.08
  bear_new  = bear.change_colors( {
                '#571c27' =>  [hue,         0.51+s, 0.23+l],
                '#891e2b' =>  [(hue+4)%360, 0.64+s, 0.33+l],
                '#c42430' =>  [(hue+6)%360, [1.0,0.69+s].min, 0.45+l],
                '#f68187' =>  [(hue+8)%360, [1.0,0.87+s].min, 0.74+l] })

  bears << bear_new
end

bears.save( "./tmp/candybears-24x24.png" )
bears.zoom(4).save( "./tmp/candybears-24x24@4x.png" )




####
#  try rainbow bear with 8 colors

bears = ImageComposite.new( 8*3, 16,  width:  24+4,
                                   height: 24+4 )

hues = [ 60, 30, 0, 300, 270, 240, 150, 120 ]
(3*16).times do
  hues.each do |hue|
    s = 0.28
    l = 0.08
    bear_new  = bear.change_colors( {
                '#571c27' =>  [hue,         0.51+s, 0.23+l],
                '#891e2b' =>  [(hue+4)%360, 0.64+s, 0.33+l],
                '#c42430' =>  [(hue+6)%360, [1.0,0.69+s].min, 0.45+l],
                '#f68187' =>  [(hue+8)%360, [1.0,0.87+s].min, 0.74+l] })

    bears << make_padded( bear_new )
 end
end

bears.save( "./tmp/candybears-vol6.png" )
bears.zoom(2).save( "./tmp/candybears-vol6@2x.png" )

puts "bye"
