

require 'pixelart'



###############
## 512x512    21*24 = 504 + 8 = 512
##
##
##  top - +80px!!!  = 432   -- 18*24 = 432 !!!
##
##  left/right +40px +40px!!!  ( start with 40 )

###.
#  pick pixel in middle - +9
#  24.times {|i| puts "#{9 + 18*i} => #{i}," }
#
# ## 24.times {|i| puts "#{4 + (i/3) + 21*i} => #{i}," }


PIXEL_OFFSET_432 = {
  9 => 0,
  27 => 1,
  45 => 2,
  63 => 3,
  81 => 4,
  99 => 5,
  117 => 6,
  135 => 7,
  153 => 8,
  171 => 9,
  189 => 10,
  207 => 11,
  225 => 12,
  243 => 13,
  261 => 14,
  279 => 15,
  297 => 16,
  315 => 17,
  333 => 18,
  351 => 19,
  369 => 20,
  387 => 21,
  405 => 22,
  423 => 23,
}



## more green-ish backgrounds
##  use color by hue? 139-??     (v=100%-??)
MORE_TRANSPARENT_COLORS = ['86D9A1',  #        139 / 38 / 85
                           '87DBA2',  #        139 / 38 / 85
                           '87DCA3',
                           '8BDBA4',  #       138  / 36 / 85
                           '90EAA9',  #       136  / 38 / 91
                           '97F1B4',
                           '97F4B5',
                           '97F4B6',
                           '98F4B5',
                           '98F4B6',
                           '98F4B7',
                           '98F5B6',  #        139 / 37 / 96
                           '98F5B7',  #        140 / 37 / 96
                           '98F6B6',
                           '98F6B7',    #       139 / 38 / 96
                           '98F7B7',    #       139 / 38 / 96
                           '99F5B6',    # 138 / 37 / 96
                           '99F5B7',    #       139 / 37  / 96
                           '99F6B7',
                           '99F7B7',    #       139 / 38 / 96
                           '99FCBB',
                           '9AF4B5',    # HSV - 138 / 36 / 95
                           '9AF5B6',
                           '9AF6B6',
                           '9AF8B8',
                           '9AF8B9',
                           '9AF9B9',
                           '9BF9B9',
                           '9CEEBB',    # 142 / 34 / 93
                           '9CFBBA',
                           '9FFFBE',
                           'A0FABD',     # 139 / 36 / 98
                           'A1FFC1',     # 140  / 36 / 100
                           'A2FFC1',
                           'A2FFC2',     # 140 / 36 / 100
                           'A3FABA',
                           'A3FBB9',     # 135 / 35 / 98
                           'A3FFC3',
                           'A5FFC3',
                           'A7FEC2',
                           'A8FCC2',     # 138 / 33 / 98
#                         'B3FCC2',
                          ].map { |hex| Color.from_hex( hex ) }


puts "transparent colors:"
MORE_TRANSPARENT_COLORS.each do |color|
  puts "   #{Color.format( color )}"
end

AUTO_TRANSPARENT_COLORS = []

=begin
transparent colors:
   #86d9a1 / rgb(134 217 161) - hsl(140°  52%  69%)
   #87dba2 / rgb(135 219 162) - hsl(139°  54%  69%)
   #87dca3 / rgb(135 220 163) - hsl(140°  55%  70%)
   #8bdba4 / rgb(139 219 164) - hsl(139°  53%  70%)
   #90eaa9 / rgb(144 234 169) - hsl(137°  68%  74%)
   #97f4b5 / rgb(151 244 181) - hsl(139°  81%  77%)
   #98f4b6 / rgb(152 244 182) - hsl(140°  81%  78%)
   #98f5b6 / rgb(152 245 182) - hsl(139°  82%  78%)
   #98f6b6 / rgb(152 246 182) - hsl(139°  84%  78%)
   #98f6b7 / rgb(152 246 183) - hsl(140°  84%  78%)
   #98f7b7 / rgb(152 247 183) - hsl(140°  86%  78%)
   #99f5b7 / rgb(153 245 183) - hsl(140°  82%  78%)
   #99f6b7 / rgb(153 246 183) - hsl(139°  84%  78%)
   #99f7b7 / rgb(153 247 183) - hsl(139°  85%  78%)
   #9af4b5 / rgb(154 244 181) - hsl(138°  80%  78%)
   #9af5b6 / rgb(154 245 182) - hsl(138°  82%  78%)
   #9af8b8 / rgb(154 248 184) - hsl(139°  87%  79%)
   #9af8b9 / rgb(154 248 185) - hsl(140°  87%  79%)
   #9ceebb / rgb(156 238 187) - hsl(143°  71%  77%)
   #9fffbe / rgb(159 255 190) - hsl(139° 100%  81%)
   #a0fabd / rgb(160 250 189) - hsl(139°  90%  80%)
   #a1ffc1 / rgb(161 255 193) - hsl(140° 100%  82%)
   #a2ffc2 / rgb(162 255 194) - hsl(141° 100%  82%)
   #a3fbb9 / rgb(163 251 185) - hsl(135°  92%  81%)
=end


def pixelate( img, id: )
  dest = Image.new( 24, 24 )

  transparents = Hash.new(0)

  offsets =  if img.width == 512 && img.height == 512
                PIXEL_OFFSET_432
             else
               puts "!! ERROR - unknown image dimension #{img.width}x#{img.height}; sorry"
               exit 1
             end
  ## use pixel[0,0] for background - why? why not?
  background = img[0,0]

  offsets.each do |offset_x, x|
    offsets.each do |offset_y, y|
       pixel = img[40+offset_x,80+offset_y]

       if pixel == background || MORE_TRANSPARENT_COLORS.include?( pixel ) ||
                                 AUTO_TRANSPARENT_COLORS.include?( pixel )
         dest[x,y] = 0  ## Color::TRANSPARENT
       else

          ## check for more transparents
          ##   not s  is 0.0 to 0.99  (100%)
          ##   and l  is 0.0 to 0.99  (100%)
          h,s,l =  Color.to_hsl( pixel )
          h = (h % 360)  ## might might negative degree (always make positive)
          if (h >= 135 && h <= 143) &&
              s >= 0.52 &&
              l >= 0.69       #  >= 52% && >= 69%
            ###
              transparents[ pixel ] += 1
              dest[x,y] = 0 ## Color::TRANSPARENT
          else
            dest[x,y] =  pixel
          end
       end
    end
  end


  if transparents.size > 0
     puts "  #{id} - (#{transparents.size}) transparent background(s) ?? auto-added:"
     transparents.each do |color, count|
        print "     #{count} pixel(s) - #{Color.format( color )}"
        print "   -- #{Color.to_hsl( color ).join('/')}"
        print "\n"

        AUTO_TRANSPARENT_COLORS << color
     end
  end


  dest
end



## 9900 items
range =  (0..9899) ##  (201..999)  #(0..99)   #  ##(10..99)   # (0..9)    #  (0..999)    # (0..99)   # (0..9)

range.each do |id|

    txt = File.open( "./24px/meta/#{id}.json", "r:utf-8") { |f| f.read }
    data = JSON.parse( txt )

    assets = data['assets']
    if assets.size != 1
       puts "!! error - expection one asset per file"
       exit 1
    end

    asset = assets[0]

    name = asset['name']

    # e.g.  PixelCat 1  => 1

    num  =  if m=name.match( /^PixelCat (?<num>[0-9]+)$/ )
                  m[:num].to_i( 10 )   ## note: add base 10 (e.g. 015=>15)
            else
              puts "!! ERROR - cannot find cat id number:"
              pp asset
              exit 1
            end

    puts "==> #{id}  - #{name} => #{num}"

    img = Image.read( "./24px/i/#{id}.png" )
    ## puts "     #{img.width}x#{img.height}"
    pix = pixelate( img, id: num )   ## for id use output number (not input id) - why? why not?

    pix.save( "./24px/ii/#{num}.png")
end


puts
puts "  #{AUTO_TRANSPARENT_COLORS.size} color(s) auto-added:"
AUTO_TRANSPARENT_COLORS.sort.each do |color|
  puts "     #{Color.format( color )}"
end

puts "bye"




__END__

166 color(s) auto-added:
#8ae0a6 / rgb(138 224 166) - hsl(140°  58%  71%)
#96f2b3 / rgb(150 242 179) - hsl(139°  78%  77%)
#96f2b4 / rgb(150 242 180) - hsl(140°  78%  77%)
#96f2b6 / rgb(150 242 182) - hsl(141°  78%  77%)
#96f3b4 / rgb(150 243 180) - hsl(139°  79%  77%)
#97f2b2 / rgb(151 242 178) - hsl(138°  78%  77%)
#97f2b3 / rgb(151 242 179) - hsl(138°  78%  77%)
#97f2b4 / rgb(151 242 180) - hsl(139°  78%  77%)
#97f3b3 / rgb(151 243 179) - hsl(138°  79%  77%)
#97f3b4 / rgb(151 243 180) - hsl(139°  79%  77%)
#97f3b5 / rgb(151 243 181) - hsl(140°  79%  77%)
#97f3b6 / rgb(151 243 182) - hsl(140°  79%  77%)
#97f4b7 / rgb(151 244 183) - hsl(141°  81%  77%)
#97f5b5 / rgb(151 245 181) - hsl(139°  82%  78%)
#97f5b6 / rgb(151 245 182) - hsl(140°  82%  78%)
#98f2b4 / rgb(152 242 180) - hsl(139°  78%  77%)
#98f2b5 / rgb(152 242 181) - hsl(139°  78%  77%)
#98f3b5 / rgb(152 243 181) - hsl(139°  79%  77%)
#98f5b5 / rgb(152 245 181) - hsl(139°  82%  78%)
#98f5b8 / rgb(152 245 184) - hsl(141°  82%  78%)
#98ffc0 / rgb(152 255 192) - hsl(143° 100%  80%)
#99f3b5 / rgb(153 243 181) - hsl(139°  79%  78%)
#99f4b5 / rgb(153 244 181) - hsl(138°  81%  78%)
#99f4b6 / rgb(153 244 182) - hsl(139°  81%  78%)
#99f4b7 / rgb(153 244 183) - hsl(140°  81%  78%)
#99f5b5 / rgb(153 245 181) - hsl(138°  82%  78%)
#99f5b8 / rgb(153 245 184) - hsl(140°  82%  78%)
#99f6b6 / rgb(153 246 182) - hsl(139°  84%  78%)
#99f6b9 / rgb(153 246 185) - hsl(141°  84%  78%)
#99f7b8 / rgb(153 247 184) - hsl(140°  85%  78%)
#99f8b8 / rgb(153 248 184) - hsl(140°  87%  79%)
#99f9b8 / rgb(153 249 184) - hsl(139°  89%  79%)
#99f9b9 / rgb(153 249 185) - hsl(140°  89%  79%)
#99fab9 / rgb(153 250 185) - hsl(140°  91%  79%)
#99fbb9 / rgb(153 251 185) - hsl(140°  92%  79%)
#99fbba / rgb(153 251 186) - hsl(140°  92%  79%)
#99fcba / rgb(153 252 186) - hsl(140°  94%  79%)
#99fcbc / rgb(153 252 188) - hsl(141°  94%  79%)
#9af4b6 / rgb(154 244 182) - hsl(139°  80%  78%)
#9af5b5 / rgb(154 245 181) - hsl(138°  82%  78%)
#9af5b7 / rgb(154 245 183) - hsl(139°  82%  78%)
#9af5b8 / rgb(154 245 184) - hsl(140°  82%  78%)
#9af6b7 / rgb(154 246 183) - hsl(139°  84%  78%)
#9af6b8 / rgb(154 246 184) - hsl(140°  84%  78%)
#9af7b7 / rgb(154 247 183) - hsl(139°  85%  79%)
#9af7b8 / rgb(154 247 184) - hsl(139°  85%  79%)
#9afab9 / rgb(154 250 185) - hsl(139°  91%  79%)
#9afaba / rgb(154 250 186) - hsl(140°  91%  79%)
#9afcbc / rgb(154 252 188) - hsl(141°  94%  80%)
#9afdba / rgb(154 253 186) - hsl(139°  96%  80%)
#9afdbc / rgb(154 253 188) - hsl(141°  96%  80%)
#9afdbd / rgb(154 253 189) - hsl(141°  96%  80%)
#9bf2b7 / rgb(155 242 183) - hsl(139°  77%  78%)
#9bf4b5 / rgb(155 244 181) - hsl(138°  80%  78%)
#9bf5b6 / rgb(155 245 182) - hsl(138°  82%  78%)
#9bf5b7 / rgb(155 245 183) - hsl(139°  82%  78%)
#9bf7b8 / rgb(155 247 184) - hsl(139°  85%  79%)
#9bf7b9 / rgb(155 247 185) - hsl(140°  85%  79%)
#9bf7ba / rgb(155 247 186) - hsl(140°  85%  79%)
#9bf8b7 / rgb(155 248 183) - hsl(138°  87%  79%)
#9bf8b8 / rgb(155 248 184) - hsl(139°  87%  79%)
#9bf8b9 / rgb(155 248 185) - hsl(139°  87%  79%)
#9bf9ba / rgb(155 249 186) - hsl(140°  89%  79%)
#9bfab9 / rgb(155 250 185) - hsl(139°  90%  79%)
#9bfaba / rgb(155 250 186) - hsl(140°  90%  79%)
#9bfabb / rgb(155 250 187) - hsl(140°  90%  79%)
#9bfbba / rgb(155 251 186) - hsl(139°  92%  80%)
#9bfbbb / rgb(155 251 187) - hsl(140°  92%  80%)
#9bfcbb / rgb(155 252 187) - hsl(140°  94%  80%)
#9bfdbc / rgb(155 253 188) - hsl(140°  96%  80%)
#9cf6b7 / rgb(156 246 183) - hsl(138°  83%  79%)
#9cf7b8 / rgb(156 247 184) - hsl(138°  85%  79%)
#9cf7b9 / rgb(156 247 185) - hsl(139°  85%  79%)
#9cf8b7 / rgb(156 248 183) - hsl(138°  87%  79%)
#9cf8b8 / rgb(156 248 184) - hsl(138°  87%  79%)
#9cf8b9 / rgb(156 248 185) - hsl(139°  87%  79%)
#9cfbbb / rgb(156 251 187) - hsl(140°  92%  80%)
#9cfbbd / rgb(156 251 189) - hsl(141°  92%  80%)
#9cfbbe / rgb(156 251 190) - hsl(141°  92%  80%)
#9cfcbb / rgb(156 252 187) - hsl(139°  94%  80%)
#9cfcbd / rgb(156 252 189) - hsl(141°  94%  80%)
#9cfcbe / rgb(156 252 190) - hsl(141°  94%  80%)
#9cfdbb / rgb(156 253 187) - hsl(139°  96%  80%)
#9df5b5 / rgb(157 245 181) - hsl(136°  81%  79%)
#9df6b7 / rgb(157 246 183) - hsl(138°  83%  79%)
#9dfcbb / rgb(157 252 187) - hsl(139°  94%  80%)
#9dfebc / rgb(157 254 188) - hsl(139°  98%  81%)
#9ef4bb / rgb(158 244 187) - hsl(140°  80%  79%)
#9efbba / rgb(158 251 186) - hsl(138°  92%  80%)
#9fedbc / rgb(159 237 188) - hsl(142°  68%  78%)
#9ff4bc / rgb(159 244 188) - hsl(140°  79%  79%)
#9ff5ba / rgb(159 245 186) - hsl(139°  81%  79%)
#9ff9be / rgb(159 249 190) - hsl(141°  88%  80%)
#9ffbba / rgb(159 251 186) - hsl(138°  92%  80%)
#9ffbc2 / rgb(159 251 194) - hsl(143°  92%  80%)
#a0f3be / rgb(160 243 190) - hsl(142°  78%  79%)
#a0f5bb / rgb(160 245 187) - hsl(139°  81%  79%)
#a0f6b5 / rgb(160 246 181) - hsl(135°  83%  80%)
#a0f8ba / rgb(160 248 186) - hsl(138°  86%  80%)
#a0fbc2 / rgb(160 251 194) - hsl(142°  92%  81%)
#a0fcba / rgb(160 252 186) - hsl(137°  94%  81%)
#a0fcc3 / rgb(160 252 195) - hsl(143°  94%  81%)
#a1f7ba / rgb(161 247 186) - hsl(137°  84%  80%)
#a1f9bc / rgb(161 249 188) - hsl(138°  88%  80%)
#a1f9bd / rgb(161 249 189) - hsl(139°  88%  80%)
#a1fab8 / rgb(161 250 184) - hsl(136°  90%  81%)
#a1fcb8 / rgb(161 252 184) - hsl(135°  94%  81%)
#a1ffc0 / rgb(161 255 192) - hsl(140° 100%  82%)
#a1ffc2 / rgb(161 255 194) - hsl(141° 100%  82%)
#a2eeba / rgb(162 238 186) - hsl(139°  69%  78%)
#a2f8bb / rgb(162 248 187) - hsl(137°  86%  80%)
#a2f8c1 / rgb(162 248 193) - hsl(142°  86%  80%)
#a2fcc2 / rgb(162 252 194) - hsl(141°  94%  81%)
#a2fdc2 / rgb(162 253 194) - hsl(141°  96%  81%)
#a2fec2 / rgb(162 254 194) - hsl(141°  98%  82%)
#a2ffc0 / rgb(162 255 192) - hsl(139° 100%  82%)
#a3efbc / rgb(163 239 188) - hsl(140°  70%  79%)
#a3f6b8 / rgb(163 246 184) - hsl(135°  82%  80%)
#a3f7be / rgb(163 247 190) - hsl(139°  84%  80%)
#a3f8b8 / rgb(163 248 184) - hsl(135°  86%  81%)
#a3fcbf / rgb(163 252 191) - hsl(139°  94%  81%)
#a3fcc3 / rgb(163 252 195) - hsl(142°  94%  81%)
#a3fdc0 / rgb(163 253 192) - hsl(139°  96%  82%)
#a3fdc1 / rgb(163 253 193) - hsl(140°  96%  82%)
#a3fdc2 / rgb(163 253 194) - hsl(141°  96%  82%)
#a3fdc3 / rgb(163 253 195) - hsl(141°  96%  82%)
#a3fec1 / rgb(163 254 193) - hsl(140°  98%  82%)
#a3ffc0 / rgb(163 255 192) - hsl(139° 100%  82%)
#a3ffc1 / rgb(163 255 193) - hsl(140° 100%  82%)
#a3ffc2 / rgb(163 255 194) - hsl(140° 100%  82%)
#a4f7bd / rgb(164 247 189) - hsl(138°  84%  81%)
#a4f8bc / rgb(164 248 188) - hsl(137°  86%  81%)
#a4f8c3 / rgb(164 248 195) - hsl(142°  86%  81%)
#a4fbbe / rgb(164 251 190) - hsl(138°  92%  81%)
#a4fbc1 / rgb(164 251 193) - hsl(140°  92%  81%)
#a4fcbe / rgb(164 252 190) - hsl(138°  94%  82%)
#a4fcbf / rgb(164 252 191) - hsl(138°  94%  82%)
#a4ffc1 / rgb(164 255 193) - hsl(139° 100%  82%)
#a4ffc3 / rgb(164 255 195) - hsl(140° 100%  82%)
#a5f6bb / rgb(165 246 187) - hsl(136°  82%  81%)
#a5f6bc / rgb(165 246 188) - hsl(137°  82%  81%)
#a5f7bb / rgb(165 247 187) - hsl(136°  84%  81%)
#a5f8bf / rgb(165 248 191) - hsl(139°  86%  81%)
#a5f9c1 / rgb(165 249 193) - hsl(140°  87%  81%)
#a5fabe / rgb(165 250 190) - hsl(138°  89%  81%)
#a5fec1 / rgb(165 254 193) - hsl(139°  98%  82%)
#a5ffbf / rgb(165 255 191) - hsl(137° 100%  82%)
#a6f7bc / rgb(166 247 188) - hsl(136°  84%  81%)
#a6fdc2 / rgb(166 253 194) - hsl(139°  96%  82%)
#a7f6c2 / rgb(167 246 194) - hsl(141°  81%  81%)
#a7fac2 / rgb(167 250 194) - hsl(140°  89%  82%)
#a7fdc2 / rgb(167 253 194) - hsl(139°  96%  82%)
#a9f0c2 / rgb(169 240 194) - hsl(141°  70%  80%)
#a9fcc2 / rgb(169 252 194) - hsl(138°  93%  83%)
#aafbc6 / rgb(170 251 198) - hsl(141°  91%  83%)
#abf4c2 / rgb(171 244 194) - hsl(139°  77%  81%)
#abf9c1 / rgb(171 249 193) - hsl(137°  87%  82%)
#adfac2 / rgb(173 250 194) - hsl(136°  89%  83%)
#aef8c6 / rgb(174 248 198) - hsl(139°  84%  83%)
#d0ffdf / rgb(208 255 223) - hsl(139° 100%  91%)
#d1ffe2 / rgb(209 255 226) - hsl(142° 100%  91%)
#d3fee0 / rgb(211 254 224) - hsl(138°  96%  91%)
#d3fee1 / rgb(211 254 225) - hsl(140°  96%  91%)
#d3ffe1 / rgb(211 255 225) - hsl(139° 100%  91%)
#d3ffe2 / rgb(211 255 226) - hsl(140° 100%  91%)
#d4fee1 / rgb(212 254 225) - hsl(139°  95%  91%)

