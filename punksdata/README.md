# Inside the CryptoPunksData Contract - Decoding the On-Chain Assets (11 Archetypes and 122 Attributes) and Color Palette for Easy (Re)Use "Off-Chain"


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


Note: If you are looking for the on-chain data (attributes
or the hexstring encoded pixel matrix / bitmap and so on) - find the data NOT in the contract source but in the 266 transaction (txn) inputs. See [punksdata/transactions.txt](https://github.com/cryptopunksnotdead/punks.contracts/blob/master/punksdata/transactions.txt).


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


Let's start with the Clown Nose ![](i/018-clown_nose.png) asset.
The Clown Nose attribute
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


Let's try the 2x2 red clown nose ![](i/018-clown_nose.png):

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


Let's try the all black regular shades ![](i/021-regular_shades.png):

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


Let's try the biggie, that is, the male (face) 1 ![](i/001-male_1.png) archetype  :

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


Next let's decode the color palette.
What's COLOR 1? What's COLOR 38?


The very first CryptoPunksData transaction reads:

```
  setPalette(
    0x000000ff 713f1dff 8b532cff 562600ff 723709ff...
      ae8b61ff b69f82ff 86581eff a77c47ff dbb180ff...
      e7cba9ff a66e2cff d29d60ff ead9d9ff ffffffff...
      a58d8dff c9b2b2ff 4a1201ff 5f1d09ff 711010ff...
      7da269ff 9bbc88ff 5e7253ff ff0000ff 352410ff...
      856f56ff 6a563fff a98c6bff c8fbfbff 9be0e0ff...
      f1ffffff 75bdbdff d6000033 692f08ff 28b143ff...
      794b11ff 502f05ff 00000099 d60000ff c6c6c6ff...
      dedede80 e25b26ff 80dbdaff ca4e11ff 933709ff...
      0000004d 86581e4d 353535ff 515151ff 221e1766...
      710cc7ff 00000091 5c390fff c77514ff 595959ff...
      0040ffff dfdfdfff 8c0d5bff 690c45ff ad2160ff...
      555555ff 0060c3ff e4eb17ff 3cc300ff d60404ff...
      8119b7ff b261dcff 2c9541ff 296434ff c9c9c9ff...
      b1b1b1ff 8d8d8dff b4b4b4ff dc1d1dff 1a43c8ff...
      1637a4ff 142c7cff c28946ff 2a2a2aff e22626ff...
      26314aff ffd800ff 4c4c4cff 636363ff 00000040...
      3d2f1eff ffd926ff cae7fe70 1a6ed5ff 855114ff...
      bababa80 683c08ff 68461fff ffc926ff d7d7d7ff...
      f0f0f0ff 328dfdff fd3232ff 2858b1ff 2c5195ff...
      293e64ff 85561eff 2d6b62ff 005580ff 229000ff...
      c42110ff 2c779599 fff68eff 8d5b4099 ffba00ff...
      ff2a00ff e65700ff b500af99 cd00cbff 1c1a00ff...
      534c00ff ff8ebeff 2c954199 51360cff 96200526
  )
```

(source tx: [0xa92ea3630a13abf3a7322043406df32744c8dc3db1107cf8e244506fba8b284c](https://etherscan.io/tx/0xa92ea3630a13abf3a7322043406df32744c8dc3db1107cf8e244506fba8b284c))


Yes, that's it.  All 120 colors get passed along in an all-in-one single bytes argument
to `setPalette` where
every color in the red/green/blue/alpha (rgba) format
is made up of four bytes each
e.g. `000000ff`, that is, rgba(00 00 00 ff) or
`713f1dff` rgba(71 3f 1d ff) and so on.


Let's try a little "off-chain" script to decode
and pretty print the color palette:


``` ruby
require 'pixelart'

hex = <<TXT
000000ff 713f1dff 8b532cff 562600ff 723709ff
ae8b61ff b69f82ff 86581eff a77c47ff dbb180ff
e7cba9ff a66e2cff d29d60ff ead9d9ff ffffffff
a58d8dff c9b2b2ff 4a1201ff 5f1d09ff 711010ff
7da269ff 9bbc88ff 5e7253ff ff0000ff 352410ff
856f56ff 6a563fff a98c6bff c8fbfbff 9be0e0ff
f1ffffff 75bdbdff d6000033 692f08ff 28b143ff
794b11ff 502f05ff 00000099 d60000ff c6c6c6ff
dedede80 e25b26ff 80dbdaff ca4e11ff 933709ff
0000004d 86581e4d 353535ff 515151ff 221e1766
710cc7ff 00000091 5c390fff c77514ff 595959ff
0040ffff dfdfdfff 8c0d5bff 690c45ff ad2160ff
555555ff 0060c3ff e4eb17ff 3cc300ff d60404ff
8119b7ff b261dcff 2c9541ff 296434ff c9c9c9ff
b1b1b1ff 8d8d8dff b4b4b4ff dc1d1dff 1a43c8ff
1637a4ff 142c7cff c28946ff 2a2a2aff e22626ff
26314aff ffd800ff 4c4c4cff 636363ff 00000040
3d2f1eff ffd926ff cae7fe70 1a6ed5ff 855114ff
bababa80 683c08ff 68461fff ffc926ff d7d7d7ff
f0f0f0ff 328dfdff fd3232ff 2858b1ff 2c5195ff
293e64ff 85561eff 2d6b62ff 005580ff 229000ff
c42110ff 2c779599 fff68eff 8d5b4099 ffba00ff
ff2a00ff e65700ff b500af99 cd00cbff 1c1a00ff
534c00ff ff8ebeff 2c954199 51360cff 96200526
TXT


def decode_colors( hex )
  ## note: allow spaces and newlines in hexstring for formatting
  hex = hex.gsub( /[ \n]/, '' )

  # split hexstring into slices of 4 bytes (8 hex chars) each
  palette = hex.chars.each_slice(8).map { |slice| slice.join }
  pp palette

  palette.map {|hex| Color.from_hex( hex ) }
end


colors = decode_colors( hex )

## pretty print colors / palette
puts "  #{colors.size} color(s):"     #=> 120 color(s)

colors.each_with_index do |color,i|
  print "color #{'%-3d' % i} - "
  print Color.format( color )
  print "\n"
end
```

resulting in:

```
COLOR 0   - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
COLOR 1   - #713f1d / rgb(113  63  29) - hsl( 24°  59%  28%)
COLOR 2   - #8b532c / rgb(139  83  44) - hsl( 25°  52%  36%)
COLOR 3   - #562600 / rgb( 86  38   0) - hsl( 27° 100%  17%)
COLOR 4   - #723709 / rgb(114  55   9) - hsl( 26°  85%  24%)
COLOR 5   - #ae8b61 / rgb(174 139  97) - hsl( 33°  32%  53%)
COLOR 6   - #b69f82 / rgb(182 159 130) - hsl( 33°  26%  61%)
COLOR 7   - #86581e / rgb(134  88  30) - hsl( 33°  63%  32%)
COLOR 8   - #a77c47 / rgb(167 124  71) - hsl( 33°  40%  47%)
COLOR 9   - #dbb180 / rgb(219 177 128) - hsl( 32°  56%  68%)
COLOR 10  - #e7cba9 / rgb(231 203 169) - hsl( 33°  56%  78%)
COLOR 11  - #a66e2c / rgb(166 110  44) - hsl( 32°  58%  41%)
COLOR 12  - #d29d60 / rgb(210 157  96) - hsl( 32°  56%  60%)
COLOR 13  - #ead9d9 / rgb(234 217 217) - hsl(  0°  29%  88%)
COLOR 14  - #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE
COLOR 15  - #a58d8d / rgb(165 141 141) - hsl(  0°  12%  60%)
COLOR 16  - #c9b2b2 / rgb(201 178 178) - hsl(  0°  18%  74%)
COLOR 17  - #4a1201 / rgb( 74  18   1) - hsl( 14°  97%  15%)
COLOR 18  - #5f1d09 / rgb( 95  29   9) - hsl( 14°  83%  20%)
COLOR 19  - #711010 / rgb(113  16  16) - hsl(  0°  75%  25%)
COLOR 20  - #7da269 / rgb(125 162 105) - hsl( 99°  23%  52%)
COLOR 21  - #9bbc88 / rgb(155 188 136) - hsl( 98°  28%  64%)
COLOR 22  - #5e7253 / rgb( 94 114  83) - hsl( 99°  16%  39%)
COLOR 23  - #ff0000 / rgb(255   0   0) - hsl(  0° 100%  50%)
COLOR 24  - #352410 / rgb( 53  36  16) - hsl( 32°  54%  14%)
COLOR 25  - #856f56 / rgb(133 111  86) - hsl( 32°  21%  43%)
COLOR 26  - #6a563f / rgb(106  86  63) - hsl( 32°  25%  33%)
COLOR 27  - #a98c6b / rgb(169 140 107) - hsl( 32°  26%  54%)
COLOR 28  - #c8fbfb / rgb(200 251 251) - hsl(180°  86%  88%)
COLOR 29  - #9be0e0 / rgb(155 224 224) - hsl(180°  53%  74%)
COLOR 30  - #f1ffff / rgb(241 255 255) - hsl(180° 100%  97%)
COLOR 31  - #75bdbd / rgb(117 189 189) - hsl(180°  35%  60%)
COLOR 32  - #d60000 / rgb(214   0   0) - hsl(  0° 100%  42%) - α( 20%)
COLOR 33  - #692f08 / rgb(105  47   8) - hsl( 24°  86%  22%)
COLOR 34  - #28b143 / rgb( 40 177  67) - hsl(132°  63%  43%)
COLOR 35  - #794b11 / rgb(121  75  17) - hsl( 33°  75%  27%)
COLOR 36  - #502f05 / rgb( 80  47   5) - hsl( 34°  88%  17%)
COLOR 37  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 60%)
COLOR 38  - #d60000 / rgb(214   0   0) - hsl(  0° 100%  42%)
COLOR 39  - #c6c6c6 / rgb(198 198 198) - hsl(  0°   0%  78%)           - 8-BIT GRAYSCALE #198
COLOR 40  - #dedede / rgb(222 222 222) - hsl(  0°   0%  87%) - α( 50%)
COLOR 41  - #e25b26 / rgb(226  91  38) - hsl( 17°  76%  52%)
COLOR 42  - #80dbda / rgb(128 219 218) - hsl(179°  56%  68%)
COLOR 43  - #ca4e11 / rgb(202  78  17) - hsl( 20°  84%  43%)
COLOR 44  - #933709 / rgb(147  55   9) - hsl( 20°  88%  31%)
COLOR 45  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 30%)
COLOR 46  - #86581e / rgb(134  88  30) - hsl( 33°  63%  32%) - α( 30%)
COLOR 47  - #353535 / rgb( 53  53  53) - hsl(  0°   0%  21%)           - 8-BIT GRAYSCALE #53
COLOR 48  - #515151 / rgb( 81  81  81) - hsl(  0°   0%  32%)           - 8-BIT GRAYSCALE #81
COLOR 49  - #221e17 / rgb( 34  30  23) - hsl( 38°  19%  11%) - α( 40%)
COLOR 50  - #710cc7 / rgb(113  12 199) - hsl(272°  89%  41%)
COLOR 51  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 56%)
COLOR 52  - #5c390f / rgb( 92  57  15) - hsl( 33°  72%  21%)
COLOR 53  - #c77514 / rgb(199 117  20) - hsl( 33°  82%  43%)
COLOR 54  - #595959 / rgb( 89  89  89) - hsl(  0°   0%  35%)           - 8-BIT GRAYSCALE #89
COLOR 55  - #0040ff / rgb(  0  64 255) - hsl(225° 100%  50%)
COLOR 56  - #dfdfdf / rgb(223 223 223) - hsl(  0°   0%  87%)           - 8-BIT GRAYSCALE #223
COLOR 57  - #8c0d5b / rgb(140  13  91) - hsl(323°  83%  30%)
COLOR 58  - #690c45 / rgb(105  12  69) - hsl(323°  79%  23%)
COLOR 59  - #ad2160 / rgb(173  33  96) - hsl(333°  68%  40%)
COLOR 60  - #555555 / rgb( 85  85  85) - hsl(  0°   0%  33%)           - 8-BIT GRAYSCALE #85
COLOR 61  - #0060c3 / rgb(  0  96 195) - hsl(210° 100%  38%)
COLOR 62  - #e4eb17 / rgb(228 235  23) - hsl( 62°  84%  51%)
COLOR 63  - #3cc300 / rgb( 60 195   0) - hsl(102° 100%  38%)
COLOR 64  - #d60404 / rgb(214   4   4) - hsl(  0°  96%  43%)
COLOR 65  - #8119b7 / rgb(129  25 183) - hsl(279°  76%  41%)
COLOR 66  - #b261dc / rgb(178  97 220) - hsl(280°  64%  62%)
COLOR 67  - #2c9541 / rgb( 44 149  65) - hsl(132°  54%  38%)
COLOR 68  - #296434 / rgb( 41 100  52) - hsl(131°  42%  28%)
COLOR 69  - #c9c9c9 / rgb(201 201 201) - hsl(  0°   0%  79%)           - 8-BIT GRAYSCALE #201
COLOR 70  - #b1b1b1 / rgb(177 177 177) - hsl(  0°   0%  69%)           - 8-BIT GRAYSCALE #177
COLOR 71  - #8d8d8d / rgb(141 141 141) - hsl(  0°   0%  55%)           - 8-BIT GRAYSCALE #141
COLOR 72  - #b4b4b4 / rgb(180 180 180) - hsl(  0°   0%  71%)           - 8-BIT GRAYSCALE #180
COLOR 73  - #dc1d1d / rgb(220  29  29) - hsl(  0°  77%  49%)
COLOR 74  - #1a43c8 / rgb( 26  67 200) - hsl(226°  77%  44%)
COLOR 75  - #1637a4 / rgb( 22  55 164) - hsl(226°  76%  36%)
COLOR 76  - #142c7c / rgb( 20  44 124) - hsl(226°  72%  28%)
COLOR 77  - #c28946 / rgb(194 137  70) - hsl( 32°  50%  52%)
COLOR 78  - #2a2a2a / rgb( 42  42  42) - hsl(  0°   0%  16%)           - 8-BIT GRAYSCALE #42
COLOR 79  - #e22626 / rgb(226  38  38) - hsl(  0°  76%  52%)
COLOR 80  - #26314a / rgb( 38  49  74) - hsl(222°  32%  22%)
COLOR 81  - #ffd800 / rgb(255 216   0) - hsl( 51° 100%  50%)
COLOR 82  - #4c4c4c / rgb( 76  76  76) - hsl(  0°   0%  30%)           - 8-BIT GRAYSCALE #76
COLOR 83  - #636363 / rgb( 99  99  99) - hsl(  0°   0%  39%)           - 8-BIT GRAYSCALE #99
COLOR 84  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 25%)
COLOR 85  - #3d2f1e / rgb( 61  47  30) - hsl( 33°  34%  18%)
COLOR 86  - #ffd926 / rgb(255 217  38) - hsl( 49° 100%  57%)
COLOR 87  - #cae7fe / rgb(202 231 254) - hsl(207°  96%  89%) - α( 43%)
COLOR 88  - #1a6ed5 / rgb( 26 110 213) - hsl(213°  78%  47%)
COLOR 89  - #855114 / rgb(133  81  20) - hsl( 32°  74%  30%)
COLOR 90  - #bababa / rgb(186 186 186) - hsl(  0°   0%  73%) - α( 50%)
COLOR 91  - #683c08 / rgb(104  60   8) - hsl( 33°  86%  22%)
COLOR 92  - #68461f / rgb(104  70  31) - hsl( 32°  54%  26%)
COLOR 93  - #ffc926 / rgb(255 201  38) - hsl( 45° 100%  57%)
COLOR 94  - #d7d7d7 / rgb(215 215 215) - hsl(  0°   0%  84%)           - 8-BIT GRAYSCALE #215
COLOR 95  - #f0f0f0 / rgb(240 240 240) - hsl(  0°   0%  94%)           - 8-BIT GRAYSCALE #240
COLOR 96  - #328dfd / rgb( 50 141 253) - hsl(213°  98%  59%)
COLOR 97  - #fd3232 / rgb(253  50  50) - hsl(  0°  98%  59%)
COLOR 98  - #2858b1 / rgb( 40  88 177) - hsl(219°  63%  43%)
COLOR 99  - #2c5195 / rgb( 44  81 149) - hsl(219°  54%  38%)
COLOR 100 - #293e64 / rgb( 41  62 100) - hsl(219°  42%  28%)
COLOR 101 - #85561e / rgb(133  86  30) - hsl( 33°  63%  32%)
COLOR 102 - #2d6b62 / rgb( 45 107  98) - hsl(171°  41%  30%)
COLOR 103 - #005580 / rgb(  0  85 128) - hsl(200° 100%  25%)
COLOR 104 - #229000 / rgb( 34 144   0) - hsl(106° 100%  28%)
COLOR 105 - #c42110 / rgb(196  33  16) - hsl(  6°  85%  42%)
COLOR 106 - #2c7795 / rgb( 44 119 149) - hsl(197°  54%  38%) - α( 60%)
COLOR 107 - #fff68e / rgb(255 246 142) - hsl( 55° 100%  78%)
COLOR 108 - #8d5b40 / rgb(141  91  64) - hsl( 21°  38%  40%) - α( 60%)
COLOR 109 - #ffba00 / rgb(255 186   0) - hsl( 44° 100%  50%)
COLOR 110 - #ff2a00 / rgb(255  42   0) - hsl( 10° 100%  50%)
COLOR 111 - #e65700 / rgb(230  87   0) - hsl( 23° 100%  45%)
COLOR 112 - #b500af / rgb(181   0 175) - hsl(302° 100%  35%) - α( 60%)
COLOR 113 - #cd00cb / rgb(205   0 203) - hsl(301° 100%  40%)
COLOR 114 - #1c1a00 / rgb( 28  26   0) - hsl( 56° 100%   5%)
COLOR 115 - #534c00 / rgb( 83  76   0) - hsl( 55° 100%  16%)
COLOR 116 - #ff8ebe / rgb(255 142 190) - hsl(335° 100%  78%)
COLOR 117 - #2c9541 / rgb( 44 149  65) - hsl(132°  54%  38%) - α( 60%)
COLOR 118 - #51360c / rgb( 81  54  12) - hsl( 37°  74%  18%)
COLOR 119 - #962005 / rgb(150  32   5) - hsl( 11°  94%  30%) - α( 14%)
```


Now let's answer
the questions - What's COLOR 1? Let's lookup:

```
COLOR 1   - #713f1d / rgb(113  63  29) - hsl( 24°  59%  28%)
```

What's COLOR 38?

```
COLOR 38  - #d60000 / rgb(214   0   0) - hsl(  0° 100%  42%)
```

and so on.


All together now.
Let's change `decode( hex )`
to `decode_image( hex, colors: )` to return - surprise, surprise -
a 24x24 image ready-to-save:

``` ruby
def decode_image( hex, colors: )
  puts "==> decoding #{hex}..."

  ## convert hex string to byte array, that is, array of integer numbers
  ##   e.g.  0x6726f0    (3 bytes - 0x67 / 0x26 / 0xf0)
  ##     =>  [103, 38, 240]
  a = [hex].pack("H*").unpack('C*')

  n = a.length / 3
  puts "  #{a.size} byte(s), #{n} pixel block(s):"


  img = Image.new( 24, 24 )

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
            img[x,y] = colors[ color ]
        elsif black_mask & (1 << (dx*2+dy)) != 0
            print " BLACK"       # rgba( 00 00 00 FF)
            img[x,y] = Color::BLACK
        else
            print " TRANSPARENT"
        end
        print "\n"
      end
    end
  end

  img
end
```

And let's test drive the red clown nose:

``` ruby
## asset #18 - Clown Nose

hex = '6726f0'
image = decode_image( hex, colors: colors )

image.save( "018-clown_nose.png" )
image.zoom(4).save( "018-clown_nosex4.png" )
```

Voila!
![](i/018-clown_nose.png)
4x  ![](i/018-clown_nosex4.png)


And on to the all-black regular shades:

``` ruby
## asset #21 - Regular Shades

hex = '25000835000a45000a46000d55000a56000765000a75000a76000d85000a860007'
image = decode_image( hex, colors: colors )

image.save( "regular_shades.png" )
image.zoom(4).save( "regular_shadesx4.png" )
```

Voila!
![](i/021-regular_shades.png)
4x  ![](i/021-regular_shadesx4.png)



And let's wrap up with the "biggie" hexstring that
encodes the human male 1 archetype:


``` ruby
## asset #1 - Male 1

hex = '26000c2700043301863401c33501c33601f03701c33801c33901c33a01c33b01c342000a4
       302804301704402104401e04503804501704601b44701f04801f04901f04a01f04b01f052
       000a5301f05401f05503205501d05604105601e05701f05801f05901b45a015a5b0003620
       00a6301f06401f06501f06601f067015a6801f06901a56a015a7200027301b47401f07503
       a07501507604417601a07701f07801f07901f07a011683000284000385000386000387000
       3880003890003'
image = decode_image( hex, colors: colors )

image.save( "001-male_1.png" )
image.zoom(4).save( "001-male_1x4.png" )
```

Voila!
![](i/001-male_1.png)
4x  ![](i/001-male_1x4.png)


That's it. Yes, you can! Save all 133 assets (11 archetypes and 122 attributes)
and start generating your own do-it-yourself (DIY) punks.


## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.

