###########
#  decode (cryptopunksdata) assets / attributes
#
#  to run use:
#    ruby ./asset.rb



def decode( hex )
  puts "==> decoding #{hex}..."

  ## convert hex string to byte array, that is, array of integer numbers
  ##   e.g.  0x6726f0    (3 bytes - 0x67 / 0x26 / 0xf0)
  ##     =>  [103, 38, 240]
  a = [hex].pack("H*").unpack('C*')

  n = a.length / 3
  puts "  #{a.size} byte(s), #{n} pixel block(s):"


  n.times do |i|

    bx = (a[i*3] & 0xf0) >> 4
    by = a[i*3] & 0xf

    color = a[i*3+1]

    color_mask = (a[i*3+2] & 0xf0) >> 4
    black_mask = a[i*3+2] & 0xf


    print "    #{i+1} of #{n} pixel block - "
    print "block.x: #{bx}, block.y: #{by}, "
    print "color: #{color}, "
    print "color?: #{color_mask.to_s(2).rjust(4,'0')}, "
    print "black?: #{black_mask.to_s(2).rjust(4,'0')}:"
    print "\n"


    2.times do |dx|
      2.times do |dy|
        x = 2 * bx + dx
        y = 2 * by + dy

        print "      x: #{'%2d' % x} / y: #{'%2d' % y}  - "

        if color_mask & (1 << (dx*2+dy)) != 0
            print " COLOR #{color}"
        elsif black_mask & (1 << (dx*2+dy)) != 0
            print " BLACK"       # rgba( 00 00 00 FF)
        else
            print " TRANSPARENT"
        end
        print "\n"
      end
    end
  end
end


## asset #18 - Clown Nose
hex = '6726f0'
decode( hex )


## asset #21 - Regular Shades
hex = '25000835000a45000a46000d55000a56000765000a75000a76000d85000a860007'
decode( hex )


## asset #1 - Male 1
hex = '26000c2700043301863401c33501c33601f03701c33801c33901c33a01c33b01c342000a4302804301704402104401e04503804501704601b44701f04801f04901f04a01f04b01f052000a5301f05401f05503205501d05604105601e05701f05801f05901b45a015a5b000362000a6301f06401f06501f06601f067015a6801f06901a56a015a7200027301b47401f07503a07501507604417601a07701f07801f07901f07a0116830002840003850003860003870003880003890003'
decode( hex )



## asset #22 - Knitted Cap
hex = '24000c332b80342c70342b80432bf0442c70442b80532bf0542c70542b80632bf0642c70642b80732bb0742c70742b80842c3c'
decode( hex )


