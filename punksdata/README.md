# Inside the CryptoPunksData Contract - Decoding the On-Chain Assets


>        ____                  _                          _          ____        _
>       / ___|_ __ _   _ _ __ | |_ ___  _ __  _   _ _ __ | | _____  |  _ \  __ _| |_ __ _
>      | |   | '__| | | | '_ \| __/ _ \| '_ \| | | | '_ \| |/ / __| | | | |/ _` | __/ _` |
>      | |___| |  | |_| | |_) | || (_) | |_) | |_| | | | |   <\__ \ | |_| | (_| | || (_| |
>       \____|_|   \__, | .__/ \__\___/| .__/ \__,_|_| |_|_|\_\___/ |____/ \__,_|\__\__,_|
>                  |___/|_|            |_|
>
>  On-chain Cryptopunk images and attributes.


On August 18th, 2021 the CryptoPunks founders
uploaded the [CryptoPunksData blockchain contract / service](https://github.com/cryptopunksnotdead/punks.contracts#punksdata----cryptopunksdata-update--add-on--service).


The code commentary inside the contract reads:

> This contract holds the image and attribute data for the Cryptopunks on-chain.
> The Cryptopunk images are available as raw RGBA pixels, or in SVG format.
> The punk attributes are available as a comma-separated list.
> Included in the attribute list is the head type (various color male and female heads,
> plus the rare zombie, ape, and alien types).


Note: If you are looking for the on-chain data (attributes or the pixel matrix / bitmap and so on) - the data is NOT in the contract source but in the 266 transaction (txn) inputs. See [punksdata/transactions.txt](https://github.com/cryptopunksnotdead/punks.contracts/blob/master/punksdata/transactions.txt).


Let's have a looksie - all 133 attribute building blocks (pixel matrix / bimaps)
from  #1 Male 1 to #133 Silver Chain
got added via
`addAsset(uint8 index, bytes encoding, string name)` transactions.

Example:

```
  addAsset( 18,
            0x6726f0,
            'Clown Nose'
          )
```

(source tx: [0x8972c6b4a44c972111bf18feccae7cfb26db615be400d1422c0763a1a2b03af5](https://etherscan.io/tx/0x8972c6b4a44c972111bf18feccae7cfb26db615be400d1422c0763a1a2b03af5))


or


```
  addAsset( 21,
            0x25000835000a45000a46000d55000a56000765000a75000a76000d85000a860007,
            'Regular Shades'
          )
```
(source tx: [0x2508278bf022e3b9b7816576756a0e6404f5a266d4dae871eaa58c171540d3ee](https://etherscan.io/tx/0x2508278bf022e3b9b7816576756a0e6404f5a266d4dae871eaa58c171540d3ee))

or


```
  addAsset( 1,
            0x26000c2700043301863401c33501c33601f03701c33801c33901c33a01c33b01c342000a4...
              302804301704402104401e04503804501704601b44701f04801f04901f04a01f04b01f052...
              000a5301f05401f05503205501d05604105601e05701f05801f05901b45a015a5b0003620...
              00a6301f06401f06501f06601f067015a6801f06901a56a015a7200027301b47401f07503...
              a07501507604417601a07701f07801f07901f07a011683000284000385000386000387000...
              3880003890003,
              'Male 1'
           )
```

(source tx: [0xb73a74730f54ff8a01b4c1489105225e7638abf0452150ca70daa019dfd82692](https://etherscan.io/tx/0xb73a74730f54ff8a01b4c1489105225e7638abf0452150ca70daa019dfd82692))



## Step 1 -  Decode the Assets from #1 Male 1 to #133 Silver Chain


Let's start with the Clown Nose asset. The Clown Nose attribute
is a 2x2 red pixel matrix - how can we decode the "magic" `0x6726f0` hex string?


Let's try to decipher the decoding by looking at the
`punkImage` function that generates a pixel matrix from the assets:

``` solidity
/**
 * The Cryptopunk image for the given index.
 * The image is represented in a row-major byte array
 *   where each set of 4 bytes is a pixel in RGBA format.
 * @param index the punk index, 0 <= index < 10000
 */


function punkImage(uint16 index) public view returns (bytes memory) {
    require(index >= 0 && index < 10000);
    bytes memory pixels = new bytes(2304);
    for (uint j = 0; j < 8; j++) {
        uint8 asset = uint8(punks[uint8(index / 100)][(index % 100) * 8 + j]);
        if (asset > 0) {
            bytes storage a = assets[asset];
            uint n = a.length / 3;
            for (uint i = 0; i < n; i++) {
                uint[4] memory v = [
                    uint(uint8(a[i * 3]) & 0xF0) >> 4,
                    uint(uint8(a[i * 3]) & 0xF),
                    uint(uint8(a[i * 3 + 2]) & 0xF0) >> 4,
                    uint(uint8(a[i * 3 + 2]) & 0xF)
                ];
                for (uint dx = 0; dx < 2; dx++) {
                    for (uint dy = 0; dy < 2; dy++) {
                        uint p = ((2 * v[1] + dy) * 24 + (2 * v[0] + dx)) * 4;
                        if (v[2] & (1 << (dx * 2 + dy)) != 0) {
                            bytes4 c = composite(a[i * 3 + 1],
                                    pixels[p],
                                    pixels[p + 1],
                                    pixels[p + 2],
                                    pixels[p + 3]
                                );
                            pixels[p] = c[0];
                            pixels[p+1] = c[1];
                            pixels[p+2] = c[2];
                            pixels[p+3] = c[3];
                        } else if (v[3] & (1 << (dx * 2 + dy)) != 0) {
                            pixels[p] = 0;
                            pixels[p+1] = 0;
                            pixels[p+2] = 0;
                            pixels[p+3] = 0xFF;
                        }
                    }
                }
            }
        }
    }
    return pixels;
}
```


What's going on here?
Let's convert the asset decoding machinery to a more readable script
that you can run "off-chain" on your own local machine / computer
and let's change the "cryptic" variables `v[0]` to `bx` (block offset x),
`v[1]` to `by` (block offset y),
`v[2]` to `color_mask`, and `v[3]` to `black_mask`:


``` ruby
def decode( hex )
  puts "==> decoding #{hex}..."

  ## convert hex string to byte array, that is, array of integer numbers
  ##   e.g.  0x6726f0    (3 bytes - 0x67 / 0x26 / 0xf0)
  ##     =>  [103, 38, 240]
  a = [hex].pack("H*").unpack('C*')

  n = a.length / 3
  puts "  #{a.size} byte(s), #{n} pixel block(s):"


  n.times do |i|

    bx = (a[i*3] & 0xf0) >> 4    # was v[0]
    by = a[i*3] & 0xf            # was v[1]

    color = a[i*3+1]

    color_mask = (a[i*3+2] & 0xf0) >> 4   # was v[2]
    black_mask = a[i*3+2] & 0xf           # was v[3]


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
```


Let's try the 2x2 red clown nose:

``` ruby
# asset #18 - Clown Nose

hex = '6726f0'
decode( hex )
```

Resulting in:

```
==> decoding 6726f0...
  3 byte(s), 1 pixel block(s):
    1 of 1 pixel block - block.x: 6, block.y: 7, color: 38, color?: 1111, black?: 0000:
      x: 12 / y: 14  -  COLOR 38
      x: 12 / y: 15  -  COLOR 38
      x: 13 / y: 14  -  COLOR 38
      x: 13 / y: 15  -  COLOR 38
```

Voila!  The magic format uses 2x2 pixel blocks encoded in 3 bytes
where the first byte e.g. `0x67` is the block offset (block x/y e.g. 6/7),
the second byte e.g. `0x26` is the color index number (e.g. 38 in decimal)
and the third byte e.g. `0xf0` or `0b1111 0000` is
the color mask and the black mask.


Let's try the all black regular shades:

``` ruby
# asset #21 - Regular Shades

hex = '25000835000a45000a46000d55000a56000765000a75000a76000d85000a860007'
decode( hex )
```

Resulting in:

```
==> decoding 25000835000a45000a46000d55000a56000765000a75000a76000d85000a860007...
  33 byte(s), 11 pixel block(s):
    1 of 11 pixel block - block.x: 2, block.y: 5, color: 0, color?: 0000, black?: 1000:
      x:  4 / y: 10  -  TRANSPARENT
      x:  4 / y: 11  -  TRANSPARENT
      x:  5 / y: 10  -  TRANSPARENT
      x:  5 / y: 11  -  BLACK
    2 of 11 pixel block - block.x: 3, block.y: 5, color: 0, color?: 0000, black?: 1010:
      x:  6 / y: 10  -  TRANSPARENT
      x:  6 / y: 11  -  BLACK
      x:  7 / y: 10  -  TRANSPARENT
      x:  7 / y: 11  -  BLACK
    3 of 11 pixel block - block.x: 4, block.y: 5, color: 0, color?: 0000, black?: 1010:
      x:  8 / y: 10  -  TRANSPARENT
      x:  8 / y: 11  -  BLACK
      x:  9 / y: 10  -  TRANSPARENT
      x:  9 / y: 11  -  BLACK
    4 of 11 pixel block - block.x: 4, block.y: 6, color: 0, color?: 0000, black?: 1101:
      x:  8 / y: 12  -  BLACK
      x:  8 / y: 13  -  TRANSPARENT
      x:  9 / y: 12  -  BLACK
      x:  9 / y: 13  -  BLACK
    5 of 11 pixel block - block.x: 5, block.y: 5, color: 0, color?: 0000, black?: 1010:
      x: 10 / y: 10  -  TRANSPARENT
      x: 10 / y: 11  -  BLACK
      x: 11 / y: 10  -  TRANSPARENT
      x: 11 / y: 11  -  BLACK
    6 of 11 pixel block - block.x: 5, block.y: 6, color: 0, color?: 0000, black?: 0111:
      x: 10 / y: 12  -  BLACK
      x: 10 / y: 13  -  BLACK
      x: 11 / y: 12  -  BLACK
      x: 11 / y: 13  -  TRANSPARENT
    7 of 11 pixel block - block.x: 6, block.y: 5, color: 0, color?: 0000, black?: 1010:
      x: 12 / y: 10  -  TRANSPARENT
      x: 12 / y: 11  -  BLACK
      x: 13 / y: 10  -  TRANSPARENT
      x: 13 / y: 11  -  BLACK
    8 of 11 pixel block - block.x: 7, block.y: 5, color: 0, color?: 0000, black?: 1010:
      x: 14 / y: 10  -  TRANSPARENT
      x: 14 / y: 11  -  BLACK
      x: 15 / y: 10  -  TRANSPARENT
      x: 15 / y: 11  -  BLACK
    9 of 11 pixel block - block.x: 7, block.y: 6, color: 0, color?: 0000, black?: 1101:
      x: 14 / y: 12  -  BLACK
      x: 14 / y: 13  -  TRANSPARENT
      x: 15 / y: 12  -  BLACK
      x: 15 / y: 13  -  BLACK
    10 of 11 pixel block - block.x: 8, block.y: 5, color: 0, color?: 0000, black?: 1010:
      x: 16 / y: 10  -  TRANSPARENT
      x: 16 / y: 11  -  BLACK
      x: 17 / y: 10  -  TRANSPARENT
      x: 17 / y: 11  -  BLACK
    11 of 11 pixel block - block.x: 8, block.y: 6, color: 0, color?: 0000, black?: 0111:
      x: 16 / y: 12  -  BLACK
      x: 16 / y: 13  -  BLACK
      x: 17 / y: 12  -  BLACK
      x: 17 / y: 13  -  TRANSPARENT
```

Voila!  The magic formula works - the
all black regular shades
are encoded in 33 byte, that is, 11 pixel blocks.


Let's try the biggie, that is, the male (face) 1 archetype:

``` ruby
# asset #1 - Male 1

hex = '26000c2700043301863401c33501c33601f03701c33801c33901c33a01c33b01c342000a4
       302804301704402104401e04503804501704601b44701f04801f04901f04a01f04b01f052
       000a5301f05401f05503205501d05604105601e05701f05801f05901b45a015a5b0003620
       00a6301f06401f06501f06601f067015a6801f06901a56a015a7200027301b47401f07503
       a07501507604417601a07701f07801f07901f07a011683000284000385000386000387000
       3880003890003'
decode( hex )
```

Resulting in:

```
==> decoding 26000c2700043301863401c33501c33601f03701c33801c33901c33a01c33b01c342000a4
             302804301704402104401e04503804501704601b44701f04801f04901f04a01f04b01f052
             000a5301f05401f05503205501d05604105601e05701f05801f05901b45a015a5b0003620
             00a6301f06401f06501f06601f067015a6801f06901a56a015a7200027301b47401f07503
             a07501507604417601a07701f07801f07901f07a011683000284000385000386000387000
             3880003890003...
  189 byte(s), 63 pixel block(s):
    1 of 63 pixel block - block.x: 2, block.y: 6, color: 0, color?: 0000, black?: 1100:
      x:  4 / y: 12  -  TRANSPARENT
      x:  4 / y: 13  -  TRANSPARENT
      x:  5 / y: 12  -  BLACK
      x:  5 / y: 13  -  BLACK
    2 of 63 pixel block - block.x: 2, block.y: 7, color: 0, color?: 0000, black?: 0100:
      x:  4 / y: 14  -  TRANSPARENT
      x:  4 / y: 15  -  TRANSPARENT
      x:  5 / y: 14  -  BLACK
      x:  5 / y: 15  -  TRANSPARENT
    3 of 63 pixel block - block.x: 3, block.y: 3, color: 1, color?: 1000, black?: 0110:
      x:  6 / y:  6  -  TRANSPARENT
      x:  6 / y:  7  -  BLACK
      x:  7 / y:  6  -  BLACK
      x:  7 / y:  7  -  COLOR 1
    4 of 63 pixel block - block.x: 3, block.y: 4, color: 1, color?: 1100, black?: 0011:
      x:  6 / y:  8  -  BLACK
      x:  6 / y:  9  -  BLACK
      x:  7 / y:  8  -  COLOR 1
      x:  7 / y:  9  -  COLOR 1
    5 of 63 pixel block - block.x: 3, block.y: 5, color: 1, color?: 1100, black?: 0011:
      x:  6 / y: 10  -  BLACK
      x:  6 / y: 11  -  BLACK
      x:  7 / y: 10  -  COLOR 1
      x:  7 / y: 11  -  COLOR 1
    6 of 63 pixel block - block.x: 3, block.y: 6, color: 1, color?: 1111, black?: 0000:
      x:  6 / y: 12  -  COLOR 1
      x:  6 / y: 13  -  COLOR 1
      x:  7 / y: 12  -  COLOR 1
      x:  7 / y: 13  -  COLOR 1
    7 of 63 pixel block - block.x: 3, block.y: 7, color: 1, color?: 1100, black?: 0011:
      x:  6 / y: 14  -  BLACK
      x:  6 / y: 15  -  BLACK
      x:  7 / y: 14  -  COLOR 1
      x:  7 / y: 15  -  COLOR 1
    8 of 63 pixel block - block.x: 3, block.y: 8, color: 1, color?: 1100, black?: 0011:
      x:  6 / y: 16  -  BLACK
      x:  6 / y: 17  -  BLACK
      x:  7 / y: 16  -  COLOR 1
      x:  7 / y: 17  -  COLOR 1
    9 of 63 pixel block - block.x: 3, block.y: 9, color: 1, color?: 1100, black?: 0011:
      x:  6 / y: 18  -  BLACK
      x:  6 / y: 19  -  BLACK
      x:  7 / y: 18  -  COLOR 1
      x:  7 / y: 19  -  COLOR 1
    10 of 63 pixel block - block.x: 3, block.y: 10, color: 1, color?: 1100, black?: 0011:
      x:  6 / y: 20  -  BLACK
      x:  6 / y: 21  -  BLACK
      x:  7 / y: 20  -  COLOR 1
      x:  7 / y: 21  -  COLOR 1
    11 of 63 pixel block - block.x: 3, block.y: 11, color: 1, color?: 1100, black?: 0011:
      x:  6 / y: 22  -  BLACK
      x:  6 / y: 23  -  BLACK
      x:  7 / y: 22  -  COLOR 1
      x:  7 / y: 23  -  COLOR 1
    12 of 63 pixel block - block.x: 4, block.y: 2, color: 0, color?: 0000, black?: 1010:
      x:  8 / y:  4  -  TRANSPARENT
      x:  8 / y:  5  -  BLACK
      x:  9 / y:  4  -  TRANSPARENT
      x:  9 / y:  5  -  BLACK
    13 of 63 pixel block - block.x: 4, block.y: 3, color: 2, color?: 1000, black?: 0000:
      x:  8 / y:  6  -  TRANSPARENT
      x:  8 / y:  7  -  TRANSPARENT
      x:  9 / y:  6  -  TRANSPARENT
      x:  9 / y:  7  -  COLOR 2
    14 of 63 pixel block - block.x: 4, block.y: 3, color: 1, color?: 0111, black?: 0000:
      x:  8 / y:  6  -  COLOR 1
      x:  8 / y:  7  -  COLOR 1
      x:  9 / y:  6  -  COLOR 1
      x:  9 / y:  7  -  TRANSPARENT
    15 of 63 pixel block - block.x: 4, block.y: 4, color: 2, color?: 0001, black?: 0000:
      x:  8 / y:  8  -  COLOR 2
      x:  8 / y:  9  -  TRANSPARENT
      x:  9 / y:  8  -  TRANSPARENT
      x:  9 / y:  9  -  TRANSPARENT
    16 of 63 pixel block - block.x: 4, block.y: 4, color: 1, color?: 1110, black?: 0000:
      x:  8 / y:  8  -  TRANSPARENT
      x:  8 / y:  9  -  COLOR 1
      x:  9 / y:  8  -  COLOR 1
      x:  9 / y:  9  -  COLOR 1
    17 of 63 pixel block - block.x: 4, block.y: 5, color: 3, color?: 1000, black?: 0000:
      x:  8 / y: 10  -  TRANSPARENT
      x:  8 / y: 11  -  TRANSPARENT
      x:  9 / y: 10  -  TRANSPARENT
      x:  9 / y: 11  -  COLOR 3
    18 of 63 pixel block - block.x: 4, block.y: 5, color: 1, color?: 0111, black?: 0000:
      x:  8 / y: 10  -  COLOR 1
      x:  8 / y: 11  -  COLOR 1
      x:  9 / y: 10  -  COLOR 1
      x:  9 / y: 11  -  TRANSPARENT
    19 of 63 pixel block - block.x: 4, block.y: 6, color: 1, color?: 1011, black?: 0100:
      x:  8 / y: 12  -  COLOR 1
      x:  8 / y: 13  -  COLOR 1
      x:  9 / y: 12  -  BLACK
      x:  9 / y: 13  -  COLOR 1
    20 of 63 pixel block - block.x: 4, block.y: 7, color: 1, color?: 1111, black?: 0000:
      x:  8 / y: 14  -  COLOR 1
      x:  8 / y: 15  -  COLOR 1
      x:  9 / y: 14  -  COLOR 1
      x:  9 / y: 15  -  COLOR 1
    21 of 63 pixel block - block.x: 4, block.y: 8, color: 1, color?: 1111, black?: 0000:
      x:  8 / y: 16  -  COLOR 1
      x:  8 / y: 17  -  COLOR 1
      x:  9 / y: 16  -  COLOR 1
      x:  9 / y: 17  -  COLOR 1
    22 of 63 pixel block - block.x: 4, block.y: 9, color: 1, color?: 1111, black?: 0000:
      x:  8 / y: 18  -  COLOR 1
      x:  8 / y: 19  -  COLOR 1
      x:  9 / y: 18  -  COLOR 1
      x:  9 / y: 19  -  COLOR 1
    23 of 63 pixel block - block.x: 4, block.y: 10, color: 1, color?: 1111, black?: 0000:
      x:  8 / y: 20  -  COLOR 1
      x:  8 / y: 21  -  COLOR 1
      x:  9 / y: 20  -  COLOR 1
      x:  9 / y: 21  -  COLOR 1
    24 of 63 pixel block - block.x: 4, block.y: 11, color: 1, color?: 1111, black?: 0000:
      x:  8 / y: 22  -  COLOR 1
      x:  8 / y: 23  -  COLOR 1
      x:  9 / y: 22  -  COLOR 1
      x:  9 / y: 23  -  COLOR 1
    25 of 63 pixel block - block.x: 5, block.y: 2, color: 0, color?: 0000, black?: 1010:
      x: 10 / y:  4  -  TRANSPARENT
      x: 10 / y:  5  -  BLACK
      x: 11 / y:  4  -  TRANSPARENT
      x: 11 / y:  5  -  BLACK
    26 of 63 pixel block - block.x: 5, block.y: 3, color: 1, color?: 1111, black?: 0000:
      x: 10 / y:  6  -  COLOR 1
      x: 10 / y:  7  -  COLOR 1
      x: 11 / y:  6  -  COLOR 1
      x: 11 / y:  7  -  COLOR 1
    27 of 63 pixel block - block.x: 5, block.y: 4, color: 1, color?: 1111, black?: 0000:
      x: 10 / y:  8  -  COLOR 1
      x: 10 / y:  9  -  COLOR 1
      x: 11 / y:  8  -  COLOR 1
      x: 11 / y:  9  -  COLOR 1
    28 of 63 pixel block - block.x: 5, block.y: 5, color: 3, color?: 0010, black?: 0000:
      x: 10 / y: 10  -  TRANSPARENT
      x: 10 / y: 11  -  COLOR 3
      x: 11 / y: 10  -  TRANSPARENT
      x: 11 / y: 11  -  TRANSPARENT
    29 of 63 pixel block - block.x: 5, block.y: 5, color: 1, color?: 1101, black?: 0000:
      x: 10 / y: 10  -  COLOR 1
      x: 10 / y: 11  -  TRANSPARENT
      x: 11 / y: 10  -  COLOR 1
      x: 11 / y: 11  -  COLOR 1
    30 of 63 pixel block - block.x: 5, block.y: 6, color: 4, color?: 0001, black?: 0000:
      x: 10 / y: 12  -  COLOR 4
      x: 10 / y: 13  -  TRANSPARENT
      x: 11 / y: 12  -  TRANSPARENT
      x: 11 / y: 13  -  TRANSPARENT
    31 of 63 pixel block - block.x: 5, block.y: 6, color: 1, color?: 1110, black?: 0000:
      x: 10 / y: 12  -  TRANSPARENT
      x: 10 / y: 13  -  COLOR 1
      x: 11 / y: 12  -  COLOR 1
      x: 11 / y: 13  -  COLOR 1
    32 of 63 pixel block - block.x: 5, block.y: 7, color: 1, color?: 1111, black?: 0000:
      x: 10 / y: 14  -  COLOR 1
      x: 10 / y: 15  -  COLOR 1
      x: 11 / y: 14  -  COLOR 1
      x: 11 / y: 15  -  COLOR 1
    33 of 63 pixel block - block.x: 5, block.y: 8, color: 1, color?: 1111, black?: 0000:
      x: 10 / y: 16  -  COLOR 1
      x: 10 / y: 17  -  COLOR 1
      x: 11 / y: 16  -  COLOR 1
      x: 11 / y: 17  -  COLOR 1
    34 of 63 pixel block - block.x: 5, block.y: 9, color: 1, color?: 1011, black?: 0100:
      x: 10 / y: 18  -  COLOR 1
      x: 10 / y: 19  -  COLOR 1
      x: 11 / y: 18  -  BLACK
      x: 11 / y: 19  -  COLOR 1
    35 of 63 pixel block - block.x: 5, block.y: 10, color: 1, color?: 0101, black?: 1010:
      x: 10 / y: 20  -  COLOR 1
      x: 10 / y: 21  -  BLACK
      x: 11 / y: 20  -  COLOR 1
      x: 11 / y: 21  -  BLACK
    36 of 63 pixel block - block.x: 5, block.y: 11, color: 0, color?: 0000, black?: 0011:
      x: 10 / y: 22  -  BLACK
      x: 10 / y: 23  -  BLACK
      x: 11 / y: 22  -  TRANSPARENT
      x: 11 / y: 23  -  TRANSPARENT
    37 of 63 pixel block - block.x: 6, block.y: 2, color: 0, color?: 0000, black?: 1010:
      x: 12 / y:  4  -  TRANSPARENT
      x: 12 / y:  5  -  BLACK
      x: 13 / y:  4  -  TRANSPARENT
      x: 13 / y:  5  -  BLACK
    38 of 63 pixel block - block.x: 6, block.y: 3, color: 1, color?: 1111, black?: 0000:
      x: 12 / y:  6  -  COLOR 1
      x: 12 / y:  7  -  COLOR 1
      x: 13 / y:  6  -  COLOR 1
      x: 13 / y:  7  -  COLOR 1
    39 of 63 pixel block - block.x: 6, block.y: 4, color: 1, color?: 1111, black?: 0000:
      x: 12 / y:  8  -  COLOR 1
      x: 12 / y:  9  -  COLOR 1
      x: 13 / y:  8  -  COLOR 1
      x: 13 / y:  9  -  COLOR 1
    40 of 63 pixel block - block.x: 6, block.y: 5, color: 1, color?: 1111, black?: 0000:
      x: 12 / y: 10  -  COLOR 1
      x: 12 / y: 11  -  COLOR 1
      x: 13 / y: 10  -  COLOR 1
      x: 13 / y: 11  -  COLOR 1
    41 of 63 pixel block - block.x: 6, block.y: 6, color: 1, color?: 1111, black?: 0000:
      x: 12 / y: 12  -  COLOR 1
      x: 12 / y: 13  -  COLOR 1
      x: 13 / y: 12  -  COLOR 1
      x: 13 / y: 13  -  COLOR 1
    42 of 63 pixel block - block.x: 6, block.y: 7, color: 1, color?: 0101, black?: 1010:
      x: 12 / y: 14  -  COLOR 1
      x: 12 / y: 15  -  BLACK
      x: 13 / y: 14  -  COLOR 1
      x: 13 / y: 15  -  BLACK
    43 of 63 pixel block - block.x: 6, block.y: 8, color: 1, color?: 1111, black?: 0000:
      x: 12 / y: 16  -  COLOR 1
      x: 12 / y: 17  -  COLOR 1
      x: 13 / y: 16  -  COLOR 1
      x: 13 / y: 17  -  COLOR 1
    44 of 63 pixel block - block.x: 6, block.y: 9, color: 1, color?: 1010, black?: 0101:
      x: 12 / y: 18  -  BLACK
      x: 12 / y: 19  -  COLOR 1
      x: 13 / y: 18  -  BLACK
      x: 13 / y: 19  -  COLOR 1
    45 of 63 pixel block - block.x: 6, block.y: 10, color: 1, color?: 0101, black?: 1010:
      x: 12 / y: 20  -  COLOR 1
      x: 12 / y: 21  -  BLACK
      x: 13 / y: 20  -  COLOR 1
      x: 13 / y: 21  -  BLACK
    46 of 63 pixel block - block.x: 7, block.y: 2, color: 0, color?: 0000, black?: 0010:
      x: 14 / y:  4  -  TRANSPARENT
      x: 14 / y:  5  -  BLACK
      x: 15 / y:  4  -  TRANSPARENT
      x: 15 / y:  5  -  TRANSPARENT
    47 of 63 pixel block - block.x: 7, block.y: 3, color: 1, color?: 1011, black?: 0100:
      x: 14 / y:  6  -  COLOR 1
      x: 14 / y:  7  -  COLOR 1
      x: 15 / y:  6  -  BLACK
      x: 15 / y:  7  -  COLOR 1
    48 of 63 pixel block - block.x: 7, block.y: 4, color: 1, color?: 1111, black?: 0000:
      x: 14 / y:  8  -  COLOR 1
      x: 14 / y:  9  -  COLOR 1
      x: 15 / y:  8  -  COLOR 1
      x: 15 / y:  9  -  COLOR 1
    49 of 63 pixel block - block.x: 7, block.y: 5, color: 3, color?: 1010, black?: 0000:
      x: 14 / y: 10  -  TRANSPARENT
      x: 14 / y: 11  -  COLOR 3
      x: 15 / y: 10  -  TRANSPARENT
      x: 15 / y: 11  -  COLOR 3
    50 of 63 pixel block - block.x: 7, block.y: 5, color: 1, color?: 0101, black?: 0000:
      x: 14 / y: 10  -  COLOR 1
      x: 14 / y: 11  -  TRANSPARENT
      x: 15 / y: 10  -  COLOR 1
      x: 15 / y: 11  -  TRANSPARENT
    51 of 63 pixel block - block.x: 7, block.y: 6, color: 4, color?: 0100, black?: 0001:
      x: 14 / y: 12  -  BLACK
      x: 14 / y: 13  -  TRANSPARENT
      x: 15 / y: 12  -  COLOR 4
      x: 15 / y: 13  -  TRANSPARENT
    52 of 63 pixel block - block.x: 7, block.y: 6, color: 1, color?: 1010, black?: 0000:
      x: 14 / y: 12  -  TRANSPARENT
      x: 14 / y: 13  -  COLOR 1
      x: 15 / y: 12  -  TRANSPARENT
      x: 15 / y: 13  -  COLOR 1
    53 of 63 pixel block - block.x: 7, block.y: 7, color: 1, color?: 1111, black?: 0000:
      x: 14 / y: 14  -  COLOR 1
      x: 14 / y: 15  -  COLOR 1
      x: 15 / y: 14  -  COLOR 1
      x: 15 / y: 15  -  COLOR 1
    54 of 63 pixel block - block.x: 7, block.y: 8, color: 1, color?: 1111, black?: 0000:
      x: 14 / y: 16  -  COLOR 1
      x: 14 / y: 17  -  COLOR 1
      x: 15 / y: 16  -  COLOR 1
      x: 15 / y: 17  -  COLOR 1
    55 of 63 pixel block - block.x: 7, block.y: 9, color: 1, color?: 1111, black?: 0000:
      x: 14 / y: 18  -  COLOR 1
      x: 14 / y: 19  -  COLOR 1
      x: 15 / y: 18  -  COLOR 1
      x: 15 / y: 19  -  COLOR 1
    56 of 63 pixel block - block.x: 7, block.y: 10, color: 1, color?: 0001, black?: 0110:
      x: 14 / y: 20  -  COLOR 1
      x: 14 / y: 21  -  BLACK
      x: 15 / y: 20  -  BLACK
      x: 15 / y: 21  -  TRANSPARENT
    57 of 63 pixel block - block.x: 8, block.y: 3, color: 0, color?: 0000, black?: 0010:
      x: 16 / y:  6  -  TRANSPARENT
      x: 16 / y:  7  -  BLACK
      x: 17 / y:  6  -  TRANSPARENT
      x: 17 / y:  7  -  TRANSPARENT
    58 of 63 pixel block - block.x: 8, block.y: 4, color: 0, color?: 0000, black?: 0011:
      x: 16 / y:  8  -  BLACK
      x: 16 / y:  9  -  BLACK
      x: 17 / y:  8  -  TRANSPARENT
      x: 17 / y:  9  -  TRANSPARENT
    59 of 63 pixel block - block.x: 8, block.y: 5, color: 0, color?: 0000, black?: 0011:
      x: 16 / y: 10  -  BLACK
      x: 16 / y: 11  -  BLACK
      x: 17 / y: 10  -  TRANSPARENT
      x: 17 / y: 11  -  TRANSPARENT
    60 of 63 pixel block - block.x: 8, block.y: 6, color: 0, color?: 0000, black?: 0011:
      x: 16 / y: 12  -  BLACK
      x: 16 / y: 13  -  BLACK
      x: 17 / y: 12  -  TRANSPARENT
      x: 17 / y: 13  -  TRANSPARENT
    61 of 63 pixel block - block.x: 8, block.y: 7, color: 0, color?: 0000, black?: 0011:
      x: 16 / y: 14  -  BLACK
      x: 16 / y: 15  -  BLACK
      x: 17 / y: 14  -  TRANSPARENT
      x: 17 / y: 15  -  TRANSPARENT
    62 of 63 pixel block - block.x: 8, block.y: 8, color: 0, color?: 0000, black?: 0011:
      x: 16 / y: 16  -  BLACK
      x: 16 / y: 17  -  BLACK
      x: 17 / y: 16  -  TRANSPARENT
      x: 17 / y: 17  -  TRANSPARENT
    63 of 63 pixel block - block.x: 8, block.y: 9, color: 0, color?: 0000, black?: 0011:
      x: 16 / y: 18  -  BLACK
      x: 16 / y: 19  -  BLACK
      x: 17 / y: 18  -  TRANSPARENT
      x: 17 / y: 19  -  TRANSPARENT
```

Voila!  The magic formula works - the
male (face) 1 archetype
are encoded in 189 bytes, that is, 63 pixel blocks.




## Step 2 -  Save the Assets from #1 Male 1 to #133 Silver Chain into Ready-to-(Re)Use 24x24 Images



To be continued





## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.

