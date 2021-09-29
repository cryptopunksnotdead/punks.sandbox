

require 'pixelart'


###############
## 512x512
##    height =28px!!! (needs to cut-off bottom 4!!!)
##
##   18 * 28 = 504 !!  504 + 8 = 512
##
##  width (cut-off first 2 and last 2)

###.
#  pick pixel in middle - +9
#  28.times {|i| puts "#{9 + (i/3) + 18*i} => #{i}," }


PIXEL_OFFSET = {
  9 => 0,
  27 => 1,
  45 => 2,
  64 => 3,
  82 => 4,
  100 => 5,
  119 => 6,
  137 => 7,
  155 => 8,
  174 => 9,
  192 => 10,
  210 => 11,
  229 => 12,
  247 => 13,
  265 => 14,
  284 => 15,
  302 => 16,
  320 => 17,
  339 => 18,
  357 => 19,
  375 => 20,
  394 => 21,
  412 => 22,
  430 => 23,
  449 => 24,
  467 => 25,
  485 => 26,
  504 => 27,
}



TRANSPARENT_COLOR = Color.from_hex( '12DEC8' )


def pixelate( img, id: )
  dest = Image.new( 28, 28 )


  if img.width == 512 && img.height == 512
    ## do nothing
  else
    puts "!! ERROR - unknown image dimension #{img.width}x#{img.height}; sorry"
    exit 1
  end

  ## use pixel[0,0] for background - why? why not?
  # background = img[0,0]

  PIXEL_OFFSET.each do |offset_x, x|
    PIXEL_OFFSET.each do |offset_y, y|
       pixel = img[offset_x, offset_y]

       if pixel == TRANSPARENT_COLOR
         dest[x,y] = 0  ## Color::TRANSPARENT
       else
          dest[x,y] =  pixel
       end
    end
  end

  dest
end



## 9900 items
range =  (0..9899) ## (0..99) ##  (201..999)  #(0..99)   #  ##(10..99)   # (0..9)    #  (0..999)    # (0..99)   # (0..9)

range.each do |id|

    txt = File.open( "./weape24/meta/#{id}.json", "r:utf-8") { |f| f.read }
    data = JSON.parse( txt )

    assets = data['assets']
    if assets.size != 1
       puts "!! error - expection one asset per file"
       exit 1
    end

    asset = assets[0]

    name = asset['name']

    # e.g.  PixelApe 1  => 1

    num  =  if m=name.match( /^PixelApe (?<num>[0-9]+)$/ )
                  m[:num].to_i( 10 )   ## note: add base 10 (e.g. 015=>15)
            else
              puts "!! ERROR - cannot find ape id number:"
              pp asset
              exit 1
            end

    puts "==> #{id}  - #{name} => #{num}"

    img = Image.read( "./weape24/i/#{id}.png" )
    ## puts "     #{img.width}x#{img.height}"
    pix = pixelate( img, id: num )   ## for id use output number (not input id) - why? why not?

    pix.save( "./weape24/ii/#{num}.png")
end


puts "bye"

