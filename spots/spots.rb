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


def args( args, **kwargs )
  args = [args]   if args.is_a?( Integer )

  argsnew = []
  argsnew[0] = args[0]
  argsnew[1] = (args[1] || {}).merge( kwargs )
  argsnew
end


#####   variant 1 - spots (no space)
SPOTS        = args( 10 )                 #24*10 =   px
SPOTS_RANDOM = args( SPOTS, radius: [3,5] )


####    variant 2 - spots with ½ space
SPOTS_SPACE_MEDIUM  = args( 7, spacing: 3 )    # 24*7 + 23*3 =  px
# or with 10px and 5px  -- 24*10 + 23*5 =   px
                      # [10, { spacing: 5 }],

####    variant 3 - spots with 1/1 space
SPOTS_SPACE            = args( 5, spacing: 5 )    # 24*5 + 23*5 =   px
SPOTS_SPACE_RANDOM     = args( SPOTS_SPACE, center: [-2,2], radius: [2,5] )
SPOTS_SPACE_RANDOM_BIG = args( SPOTS_SPACE, center: [-1,1], radius: [3,6] )

#  or with 10px and 10px  -- 24*10 + 23*10 =   px
                        # [10, { spacing: 10}],
                        # [10, { spacing: 10,
                        #       center: [-2,2], radius: [5,10] }],
                        # [10, { spacing: 10,
                        #            center: [-1,1], radius: [6,12]}],
                        # ---
                        # [10, { lightness: [-0.03,0.03],
                        #        spacing: 10,
                        #          center: [-1,1], radius: [6,12]}],
                        # ---
                        # [10, { odd: true,
                        #        lightness: [-0.03,0.03],
                        #        spacing: 10,
                        #         center: [-1,1], radius: [6,12]}],


pp SPOTS                   #=> [10, {}]
pp SPOTS_RANDOM            #=> [10, {:radius=>[3, 5]}]
pp SPOTS_SPACE_MEDIUM      #=> [7, {:spacing=>3}]
pp SPOTS_SPACE_RANDOM      #=> [5, {:spacing=>5, :center=>[-2, 2], :radius=>[2, 5]}]
pp SPOTS_SPACE_RANDOM_BIG  #=> [5, {:spacing=>5, :center=>[-1, 1], :radius=>[3, 6]}]




variants = {
  'spots1'           => SPOTS,
  'spots1_(bg)'        => args( SPOTS, background: '#638596' ),
  'spots1_random'    => SPOTS_RANDOM,
  'spots1_random_(bg)' => args( SPOTS_RANDOM, background: '#638596' ),

  'spots2'         => SPOTS_SPACE_MEDIUM,
  'spots2_(bg)'    => args( SPOTS_SPACE_MEDIUM, background: '#638596' ),

  'spots3'            => SPOTS_SPACE,
  'spots3_random'     => SPOTS_SPACE_RANDOM,
  'spots3_random_big' => SPOTS_SPACE_RANDOM_BIG,

  ## with color lightness +/- variation
   'spots3_random_big_(l)' => args( SPOTS_SPACE_RANDOM_BIG,
                                         lightness: [-0.03,0.03] ),
   'spots3_random_big_(l+odd)' => args( SPOTS_SPACE_RANDOM_BIG,
                                             odd: true,
                                             lightness: [-0.03,0.03] ),
  ## with background spots
  'spots3_(bg)' => args( SPOTS_SPACE, background: '#638596' ),

  'spots3_random_(bg)' => args( SPOTS_SPACE_RANDOM, background: '#638596' ),
  'spots3_random_big_(bg)' => args( SPOTS_SPACE_RANDOM_BIG, background: '#638596' ),
  ## with color lightness +/- variation & background spots
  'spots3_random_big_(l+bg)' => args( SPOTS_SPACE_RANDOM_BIG, background: '#638596',
                                        lightness: [-0.03,0.03] ),
  'spots3_random_big_(l+odd+bg)' => args( SPOTS_SPACE_RANDOM_BIG, background: '#638596',
                                              odd: true,
                                               lightness: [-0.03,0.03] ),
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

     ## note: for deterministic pseudo-random numbers
     ##         "reset" seed befor spots call
     ##      use the punk id as seed
     srand( id.to_i(10) )

     punk_spots = punk.spots( size, **opts )
     punk_spots.save( "./i/punk-#{id}@#{slug}.png" )
   end
end


puts "bye"
