require 'pixelart'

require 'mini_magick'



module Pixelart



class Image
  MAGICK_INPUT  = "./tmp/magick_input.png"
  MAGICK_OUTPUT = "./tmp/magick_output.png"


def spots( spot=20,
              spacing: 0,
              center: nil,
              radius: nil,
              background: nil,
              lightness: nil,
              odd: false )

  width  = @img.width
  height = @img.height

  canvas = Image.new( width*spot+(width-1)*spacing,
                      height*spot+(height-1)*spacing )
  canvas.save( MAGICK_INPUT )

  min_center, max_center = center ? center : [0,0]
  min_radius, max_radius = radius ? radius : [0,0]

  background_color = background ? Color.parse( background ) : 0

  min_lightness, max_lightness = lightness ? lightness : [0.0,0.0]



  MiniMagick::Tool::Magick.new do |magick|
      magick << MAGICK_INPUT

    width.times do |x|
      height.times do |y|
         color = @img[ x, y ]

         if color == 0  ## transparent
           if background   ## change transparent to background
              color = background_color
           else
             next ## skip transparent
           end
         end


         if lightness
          ## todo/check: make it work with alpha too
          h,s,l = Color.to_hsl( color, include_alpha: false )

           h = h % 360    ## make sure h(ue) is always positive!!!

           ## note: rand() return between 0.0 and 1.0
           l_diff = min_lightness +
                     (max_lightness-min_lightness)*rand()

           lnew = [1.0, l+l_diff].min
           lnew = [0.0, lnew].max

           ## print " #{l}+#{l_diff}=#{lnew} "

           color = Color.from_hsl( h,
                                   [1.0, s].min,
                                   lnew )
         end

         ## note: return hexstring with leading #
         # e.g.    0 becomes #00000000
         #        and so on
         color_hex = Color.to_hex( color, include_alpha: true )
         magick.fill( color_hex )

         cx_offset,
         cy_offset = if center  ## randomize (offset off center +/-)
                       [(spot/2 + min_center) + rand( max_center-min_center ),
                        (spot/2 + min_center) + rand( max_center-min_center )]
                     else
                       [spot/2,   ## center
                        spot/2]
                     end

         cx = x*spot + x*spacing + cx_offset
         cy = y*spot + y*spacing + cx_offset

         px_offset = if radius ## randomize (radius +/-)
                       min_radius + rand( max_radius-min_radius )
                     else
                       spot/2
                     end
         px = cx + px_offset
         py = cy


         if odd && (y % 2 == 1)  ## add odd offset
            cx += spot/2
            px += spot/2
         end

         ## circle
         ##  give the center and any point on the perimeter (boundary)
         magick.draw( "circle #{cx},#{cy},#{px},#{py}" )
      end
    end

    magick << MAGICK_OUTPUT
  end

  Image.read( MAGICK_OUTPUT )
end


end # class Image
end # class Pixelart




variants = {
  'spots10'           => [10],
  'spots10+5'         => [10, { spacing: 5 }],
  'spots10+10'        => [10, { spacing: 10}],
  'spots10_random'    => [10, { center: [-2,2], radius: [3,5] }],
  'spots10+10_random' => [10, { spacing: 10,
                                center: [-2,2], radius: [5,10] }],
  'spots10+10+big_random.png' => [10, { spacing: 10,
                                        center: [-1,1], radius: [6,12]}],

  ## with color lightness +/- variation
  'l+spots10+10+big_random.png' => [10, { lightness: [-0.03,0.03],
                                          spacing: 10,
                                          center: [-1,1], radius: [6,12]}],
  'odd+l+spots10+10+big_random.png' => [10, { odd: true,
                                             lightness: [-0.03,0.03],
                                          spacing: 10,
                                          center: [-1,1], radius: [6,12]}],

  ## with background spots
  'bg+spots10'    => [10, { background: '#638596' }],
  'bg+spots10+5'  => [10, { background: '#638596', spacing: 5 }],
  'bg+spots10+10' => [10, { background: '#638596', spacing: 10 }],
  'bg+spots10_random' => [10, { background: '#638596',
                                center: [-2,2], radius: [3,5] }],
  'bg+spots10+10_random' => [10, { background: '#638596', spacing: 10,
                                center: [-2,2], radius: [5,10] }],
  'bg+spots10+10+big_random.png' => [10, { background: '#638596', spacing: 10,
                                center: [-1,1], radius: [6,12]}],

  ## with color lightness +/- variation & background spots
  'l+bg+spots10+10+big_random.png' => [10, { lightness: [-0.03,0.03], background: '#638596', spacing: 10,
                                center: [-1,1], radius: [6,12]}],
  'odd+l+bg+spots10+10+big_random.png' => [10, { odd: true,
                                               lightness: [-0.03,0.03], background: '#638596', spacing: 10,
                                              center: [-1,1], radius: [6,12]}],

}


ids = %w[
  0172
  2964
  3100
  3393
]

ids.each do |id|
   puts "==> punk #{id}"
   punk = Image.read( "./i/punk-#{id}.png" )

   variants.each do |slug, rec|
     size = rec[0]
     opts = rec[1] || {}

     puts "   #{slug} - #{size}, #{opts.inspect}"

     punk_spots = punk.spots( size, **opts )
     punk_spots.save( "./i/punk-#{id}@#{slug}.png" )
   end
end


puts "bye"
