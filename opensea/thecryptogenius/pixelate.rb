require 'pixelart'


###############
## 512x512    21*24 = 504 + 8 = 512
##
##
## quick hack use safe 13 for pixel offset
##  e.g.   24.times {|i| puts "#{i*21+13} => #{i}," }

PIXEL_OFFSET = {
  13  => 0,
  34  => 1,
  55  => 2,
  76  => 3,
  97  => 4,
  118 => 5,
  139 => 6,
  160 => 7,
  181 => 8,
  202 => 9,
  223 => 10,
  244 => 11,
  265 => 12,
  286 => 13,
  307 => 14,
  328 => 15,
  349 => 16,
  370 => 17,
  391 => 18,
  412 => 19,
  433 => 20,
  454 => 21,
  475 => 22,
  496 => 23,
}



def pixelate( img )
  dest = Image.new( 24, 24 )

  if img.width == 512 && img.height == 512
    ## do nothing; everything ok
  else
    puts "!! ERROR - unknown image dimension #{img.width}x#{img.height}; sorry"
    exit 1
  end


  ## use pixel[0,0] for background - why? why not?
  background = img[0,0]
  bh,bs,bl =  Color.to_hsl( background )
  bh = (bh % 360)  ## might might negative degree (always make positive)



  PIXEL_OFFSET.each do |offset_x, x|
    PIXEL_OFFSET.each do |offset_y, y|
       pixel = img[offset_x,offset_y]

        ## check for more transparents
          ##   not s  is 0.0 to 0.99  (100%)
          ##   and l  is 0.0 to 0.99  (100%)
        h,s,l =  Color.to_hsl( pixel )
        h = (h % 360)  ## might might negative degree (always make positive)

        ## try some kind-of fuzzy "heuristic" match on background color
        if ((h >= bh-5) && (h <= bh+5)) &&
           ((s >= bs-0.07) && (s <= bs+0.07)) &&
           ((l >= bl-0.07) && (l <= bl+0.07))
         dest[x,y] = 0  ## Color::TRANSPARENT

         if h != bh || s != bs || l != bl
            # report fuzzy background color
            puts "  #{x}/#{y} fuzzy background #{[h,s,l]} ~= #{[bh,bs,bl]}"
         end
       else
         dest[x,y] =  pixel
       end
    end
  end

  dest
end



(0..89).each do |id|

    txt = File.open( "./thecryptogenius/meta/#{id}.json", "r:utf-8") { |f| f.read }
    data = JSON.parse( txt )

    assets = data['assets']
    if assets.size != 1
       puts "!! error - expection one asset per file"
       exit 1
    end

    asset = assets[0]

    name = asset['name']

    # e.g.  #1 - Leonardo Da Vinci  => 1

    num  =  if m=name.match( /^#?(?<num>[0-9]+) -/ )
                  m[:num].to_i( 10 )   ## note: add base 10 (e.g. 015=>15)
            else
              puts "!! ERROR - cannot find genius id number:"
              pp asset
              exit 1
            end

    puts "==> #{id}  - #{name} => #{num}"

    img = Image.read( "./thecryptogenius/i/#{id}.png" )
    puts "     #{img.width}x#{img.height}"
    pix = pixelate( img )

    pix.save( "./thecryptogenius/ii/#{num}.png")
end


puts "bye"
