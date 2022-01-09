> Someday, owning a CryptoPunk might signify just how early of an
> adopter you were into the world of blockchain and its thriving digital
> art scene. Or, they could just be a bunch of [24×24 pixel] images.
>
> -- [June 2017](https://mashable.com/2017/06/16/cryptopunks-ethereum-art-collectibles/)
>
>
> There will be a desire and need to buy expensive [status symbols]
> in the digital realm [to "flex" how rich and stupid I am].
> What could be more desirable than a small [24×24]
> pixelated [knitted cap-wearing ape] face?
> CryptoPunk artwork [![](i/punk-8219.png) [#8219](https://www.larvalabs.com/cryptopunks/details/8219)] just sold for $176,000.
>
> -- [January 2021](https://decrypt.co/53519/an-ethereum-based-cryptopunk-artwork-just-sold-for-176000)
>
>
> Ultra-rare alien [24×24 pixel] CryptoPunk
> sells for 605 ETH, or $750,000.
> The investment thesis. "Aliens are the rarest form of CryptoPunk and
> we believe that the acquired Alien [![](i/punk-2890.png) [#2890](https://www.larvalabs.com/cryptopunks/details/2890), one of nine]
> will be prized by collectors over
> time and mature into an iconic digital art piece."
>
> -- [January 2021](https://cointelegraph.com/news/ultra-rare-alien-cryptopunk-nft-sells-for-605-eth-or-750-000)
>
>
> The [CryptoPunksMarket] contract now holds 4,095 ETH (~$5.4M USD) in open bids and pending withdrawals.
>
> -- [January 2021](https://twitter.com/larvalabs/status/1353915659453870080)



# Crypto Punks

cryptopunks - mint your own 24×24 pixel punk images off chain from the True Official Genuine CryptoPunks™ sha256-verified original 10 000 unique character collection; incl. 2x/4x/8x zoom for bigger sizes

* home  :: [github.com/cryptopunksnotdead/cryptopunks](https://github.com/cryptopunksnotdead/cryptopunks)
* bugs  :: [github.com/cryptopunksnotdead/cryptopunks/issues](https://github.com/cryptopunksnotdead/cryptopunks/issues)
* gem   :: [rubygems.org/gems/cryptopunks](https://rubygems.org/gems/cryptopunks)
* rdoc  :: [rubydoc.info/gems/cryptopunks](http://rubydoc.info/gems/cryptopunks)


New to Crypto Punks?
See the [**Awesome CryptoPunks Bubble (Anno 2021) - Modern 24×24 Pixel Crypto Art on the Blockchain** »](https://github.com/cryptopunksnotdead/awesome-cryptopunks-bubble)



## Command Line

Use the `punk` (or `cryptopunk`) command line tool. Try:

```
$ punk -h
```

resulting in:

```
NAME
    punk - punk (or cryptopunk) command line tool

SYNOPSIS
    punk [global options] command [command options] [arguments...]

VERSION
    2.1.0

GLOBAL OPTIONS
    -d, --dir,
    -o, --out, --outdir=DIR - Output directory (default: .)
    -f, --file=FILE         - True Official Genuine CryptoPunks™ all-in-one
                              composite image (default: ./punks.png)
    --offset=NUM            - Start counting at offset (default: 0)
    --seed=NUM              - Seed for random number generation /
                              shuffle (default: 4142)
    -z, --zoom=ZOOM         - Zoom factor x2, x4, x8, etc. (default: 1)

    --help                  - Show this message
    --version               - Display the program version
    --verbose               - (Debug) Show debug messages


COMMANDS
    g, gen, generate - Generate punk characters from text attributes (from
                       scratch / zero) via builtin punk spritesheet
    l, ls, list      - List all punk archetype and attribute names from builtin
                       punk spritesheet
    q, query         - Query (builtin off-chain) punk contract for punk text
                       attributes by IDs - use 0 to 9999
    t, tile          - Get punk characters via image tiles from all-in-one punk
                       series composite (./punks.png) - for IDs use 0 to 9999
    f, flip          - Flip (vertically) all punk characters in all-in-one punk
                       series composite (./punks.png)
    s, shuffle       - Shuffle all punk characters (randomly) in all-in-one
                       punk series composite (./punks.png)

    help             - Shows a list of commands or help for one command
```


### Generate Command

_Generate punk characters from text attributes (from scratch / zero) via builtin punk spritesheet_


Let's try punk #0:

```
$ punk generate female_2 earring blonde_bob green_eye_shadow
```

resulting in:

![](i/punk-0000.png)

Let's try  the `-z/--zoom` factor 2x, 4x, 8x, etc.:

```
$ punk --zoom 4 generate female_2 earring blonde_bob green_eye_shadow
# -or-
$ punk -z2 g female_2 earring blonde_bob green_eye_shadow
```

resulting in:

2x ![](i/punk-0000x2.png)
4x ![](i/punk-0000x4.png)
8x ![](i/punk-0000x8.png)


Let's try never-before-seen super-rare punks:

```
$ punk generate demon heart_shades
$ punk generate vampire_female wild_hair
```

resulting in:

![](i/demon.png)
![](i/vampire-female.png)



Q: What punk archetypes and attributes can I use?

A:  See the list command.


### List Command

_List all punk archetype and attribute names from builtin punk spritesheet_


Let's try:

```
$ punk list
# -or-
$ punk ls
```

resulting in:

```
==> Archetypes
  Male 1 / (m)                   - Archetype - Human
  Male 2 / (m)                   - Archetype - Human
  Male 3 / (m)                   - Archetype - Human
  Male 4 / (m)                   - Archetype - Human
  Female 1 / (f)                 - Archetype - Human
  Female 2 / (f)                 - Archetype - Human
  Female 3 / (f)                 - Archetype - Human
  Female 4 / (f)                 - Archetype - Human
  Zombie / (m)                   - Archetype - Zombie
  Zombie Female / (f)            - Archetype - Zombie
  Ape / (m)                      - Archetype - Ape
  Ape Female / (f)               - Archetype - Ape
  Alien / (m)                    - Archetype - Alien
  Alien Female / (f)             - Archetype - Alien
  Demon / (m)                    - Archetype - Demon
  Demon Female / (f)             - Archetype - Demon
  Mummy / (m)                    - Archetype - Mummy
  Mummy Female / (f)             - Archetype - Mummy
  Orc / (m)                      - Archetype - Orc
  Orc Female / (f)               - Archetype - Orc
  Robot / (m)                    - Archetype - Robot
  Robot Female / (f)             - Archetype - Robot
  Skeleton / (m)                 - Archetype - Skeleton
  Skeleton Female / (f)          - Archetype - Skeleton
  Vampire / (m)                  - Archetype - Vampire
  Vampire Female / (f)           - Archetype - Vampire
  Zombie (Ape) / (m)             - Archetype - Zombie
  Alien (Ape) / (m)              - Archetype - Alien
  Alien 0° / (m)                 - Archetype - Alien
  Alien 30° / (m)                - Archetype - Alien
  Alien 60° / (m)                - Archetype - Alien
  Alien 90° / (m)                - Archetype - Alien
  Alien 120° / (m)               - Archetype - Alien
  Alien 150° / (m)               - Archetype - Alien
  Alien 180° / (m)               - Archetype - Alien
  Alien 210° / (m)               - Archetype - Alien
  Alien 240° / (m)               - Archetype - Alien
  Alien 270° / (m)               - Archetype - Alien
  Alien 300° / (m)               - Archetype - Alien
  Alien 330° / (m)               - Archetype - Alien
  Alien (Ape) 0° / (m)           - Archetype - Alien
  Alien (Ape) 30° / (m)          - Archetype - Alien
  Alien (Ape) 60° / (m)          - Archetype - Alien
  Alien (Ape) 90° / (m)          - Archetype - Alien
  Alien (Ape) 120° / (m)         - Archetype - Alien
  Alien (Ape) 150° / (m)         - Archetype - Alien
  Alien (Ape) 180° / (m)         - Archetype - Alien
  Alien (Ape) 210° / (m)         - Archetype - Alien
  Alien (Ape) 240° / (m)         - Archetype - Alien
  Alien (Ape) 270° / (m)         - Archetype - Alien
  Alien (Ape) 300° / (m)         - Archetype - Alien
  Alien (Ape) 330° / (m)         - Archetype - Alien
  Alien Female 0° / (f)          - Archetype - Alien
  Alien Female 30° / (f)         - Archetype - Alien
  Alien Female 60° / (f)         - Archetype - Alien
  Alien Female 90° / (f)         - Archetype - Alien
  Alien Female 120° / (f)        - Archetype - Alien
  Alien Female 150° / (f)        - Archetype - Alien
  Alien Female 180° / (f)        - Archetype - Alien
  Alien Female 210° / (f)        - Archetype - Alien
  Alien Female 240° / (f)        - Archetype - Alien
  Alien Female 270° / (f)        - Archetype - Alien
  Alien Female 300° / (f)        - Archetype - Alien
  Alien Female 330° / (f)        - Archetype - Alien

==> Attributes
  3D Glasses / (m)               - Attribute
  3D Glasses / (f)               - Attribute
  Bandana / (m)                  - Attribute
  Bandana / (f)                  - Attribute
  Beanie / (m)                   - Attribute
  Beanie / (f)                   - Attribute
  Big Beard / (m)                - Attribute
  Big Shades / (m)               - Attribute
  Big Shades / (f)               - Attribute
  Black Lipstick / (f)           - Attribute
  Blonde Bob / (f)               - Attribute
  Blonde Short / (f)             - Attribute
  Blue Eye Shadow / (f)          - Attribute
  Buck Teeth / (m)               - Attribute
  Cap / (m)                      - Attribute
  Cap / (f)                      - Attribute
  Cap Forward / (m)              - Attribute
  Cap Forward / (f)              - Attribute
  Chinstrap / (m)                - Attribute
  Choker / (f)                   - Attribute
  Cigarette / (m)                - Attribute
  Cigarette / (f)                - Attribute
  Classic Shades / (m)           - Attribute
  Classic Shades / (f)           - Attribute
  Clown Eyes Blue / (m)          - Attribute
  Clown Eyes Blue / (f)          - Attribute
  Clown Eyes Green / (m)         - Attribute
  Clown Eyes Green / (f)         - Attribute
  Clown Hair Green / (m)         - Attribute
  Clown Hair Green / (f)         - Attribute
  Clown Nose / (m)               - Attribute
  Clown Nose / (f)               - Attribute
  Cowboy Hat / (m)               - Attribute
  Cowboy Hat / (f)               - Attribute
  Crazy Hair / (m)               - Attribute
  Crazy Hair / (f)               - Attribute
  Dark Hair / (f)                - Attribute
  Do-rag / (m)                   - Attribute
  Do-rag / (f)                   - Attribute
  Earring / (m)                  - Attribute
  Earring / (f)                  - Attribute
  Eye Mask / (m)                 - Attribute
  Eye Mask / (f)                 - Attribute
  Eye Patch / (m)                - Attribute
  Eye Patch / (f)                - Attribute
  Fedora / (m)                   - Attribute
  Fedora / (f)                   - Attribute
  Front Beard / (m)              - Attribute
  Front Beard Dark / (m)         - Attribute
  Frown / (m)                    - Attribute
  Frumpy Hair / (m)              - Attribute
  Frumpy Hair / (f)              - Attribute
  Green Eye Shadow / (f)         - Attribute
  Goat / (m)                     - Attribute
  Gold Chain / (m)               - Attribute
  Gold Chain / (f)               - Attribute
  ...
```

See the [**punks.spritesheet**](https://github.com/cryptopunksnotdead/punks.spritesheet) for more.




### Query Command

_Query (builtin off-chain) punk contract for punk text attributes by IDs - use 0 to 9999_


Let's try punk #0:

```
$ punk query 0
# -or-
$ punk q 0
```

resulting in:

```
==> (1/1) punk #0...
  female_2  earring  blonde_bob  green_eye_shadow
```

Let's try some top sellers:

```
$ punk query 7804 3100 5217 8857
# -or-
$ punk q 7804 3100 5217 8857
```

resulting in:

```
==> (1/4) punk #7804...
  alien  cap_forward  pipe  small_shades
==> (2/4) punk #3100...
  alien  headband
==> (3/4) punk #5217...
  ape  gold_chain  knitted_cap
==> (4/4) punk #8857...
  zombie  wild_hair  3d_glasses
```

Note: Yes, you can pass the text attributes to the generate command
to get a free "cleanroom" copy built from scratch / zero
that you own 100% forever.



### Tile Command

_Get punk characters via image tiles from all-in-one punk series composite (`./punks.png`) - for IDs use 0 to 9999_



Step 0 -  Download the True Official Genuine CryptoPunks™ composite image

One time / first time only - Download the True Official Genuine CryptoPunks™ composite
housing all 10 000 CryptoPunks
in a single 2400×2400 image (~830 kb) for free.
See [`punks.png` »](https://github.com/larvalabs/cryptopunks/blob/master/punks.png)


![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punks-zoom.png)




Now let's give it a try.  Let's save punk #0, #2890, and #8219:

```
$ punk tile 0 2890 8219
```

printing:

```
==> reading >./punks.png<...
     >ac39af4793119ee46bbff351d8cb6b5f23da60222126add4268e261199a2921b< SHA256 hash matching
         ✓ True Official Genuine CryptoPunks™ verified
==> (1/3) saving punk #0 to >./punk-0000.png<...
==> (2/3) saving punk #2890 to >./punk-2890.png<...
==> (3/3) saving punk #8219 to >./punk-8219.png<...
```

And voila!

![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-0000.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-2890.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-8219.png)



**Bonus:  Try the `-z/--zoom` factor 2x, 4x, 8x, etc.**

Let's give it a try.  Let's save punk #0, #2890, and #8219 in 2x format:

```
$ punk --zoom 2 tile 0 2890 8219
# -or-
$ punk -z2 t 0 2890 8219
```

printing:

```
==> reading >./punks.png<...
     >ac39af4793119ee46bbff351d8cb6b5f23da60222126add4268e261199a2921b< SHA256 hash matching
         ✓ True Official Genuine CryptoPunks™ verified
    setting zoom to 2x
==> (1/3) saving punk #0 to >punk-0000@2x.png<...
==> (2/3) saving punk #2890 to >punk-2890@2x.png<...
==> (3/3) saving punk #8219 to >punk-8219@2x.png<...
```

And voila!

![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-0000x2.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-2890x2.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-8219x2.png)

And x4:

![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-0000x4.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-2890x4.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-8219x4.png)


And x8:

![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-0000x8.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-2890x8.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-8219x8.png)


And so on.




**10 000 More Punks  - Unauthorized? No Way?!- Fuck the Establishment - Yes, You Can - Do-It-Yourself - Use Your Own Collections**


Use the `-f, --file=FILE` option
to pass along any unauthorized edition.
Only make sure all punks are lined-up left-to-right, top-to-bottom
in the 24x24 pixel format in the composite image.


Let's try the 10 000 More Punks series housing punks in
packs of a hundred each. Let's have a looksie at the first 100
in the series.


![](https://github.com/cryptopunksnotdead/awesome-cryptopunks-bubble/raw/master/i/more-punks-1.png)



Let's save punk #0, #19, #50, and #89
and let's add an offset of 10000
(to start counting at 10000 instead of 0):

```
$ punk --file ./more-punks-1.png --offset 10000 tile 0 18 40 88
```

printing:

```
==> reading >./more-punks-1.png<...
     240x240 (height x width)
==> (1/4) saving punk #10000 to >./punk-10000.png<...
==> (2/4) saving punk #10018 to >./punk-10018.png<...
==> (3/4) saving punk #10040 to >./punk-10040.png<...
==> (4/4) saving punk #10040 to >./punk-10088.png<...
```

And voila!

![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10000.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10018.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10040.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10088.png)


And 4x:

![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10000x4.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10018x4.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10040x4.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10088x4.png)




Let's try the second pack - that is, punks 100 to 199 in the series.


![](https://github.com/cryptopunksnotdead/awesome-cryptopunks-bubble/raw/master/i/more-punks-2.png)



Let's save punk #0, #79, #80, and #90
and let's add an offset of 10100
(to start counting at 10000 plus 100 instead of 0):

```
$ punk --file ./more-punks-2.png --offset 10100 tile 0 79 80 90
```

printing:

```
==> reading >./more-punks-2.png<...
     240x240 (height x width)
==> (1/4) saving punk #10100 to >./punk-10100.png<...
==> (2/4) saving punk #10179 to >./punk-10179.png<...
==> (3/4) saving punk #10180 to >./punk-10180.png<...
==> (4/4) saving punk #10190 to >./punk-10190.png<...
```

And voila! Super rare - world's first female alien and much more.


![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10100.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10179.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10180.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10190.png)


And 4x:

![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10100x4.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10179x4.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10180x4.png)
![](https://github.com/cryptopunksnotdead/cryptopunks/raw/master/cryptopunks/i/punk-10190x4.png)


And so on.




### Flip Command

_Flip (vertically) all punk characters in all-in-one punk series composite (`./punks.png`)_


Let's generate an all new punk series by turning all punks
in the classic series
from right-looking to left-looking
by flipping vertically "one-by-one by hand [thanks to philip the intern]"
all punks. Phree the phunks! Let's give it a try:

```
$ punk flip
#  - same as -
$ punk --file ./punks.png flip
```

printing:

```
==> reading >./punks.png<...
     >ac39af4793119ee46bbff351d8cb6b5f23da60222126add4268e261199a2921b< SHA256 hash matching
         ✓ True Official Genuine CryptoPunks™ verified
   (1/10000) philip the intern flipping punk #0...
   (2/10000) philip the intern flipping punk #1...
   ...
==> saving phunks flipped one-by-one by hand to >./punks-flipped.png<...
```

And voila!

Yes, you can.  Use any all-in-one composite image in the 24x24 format. Use the `--file` option.
Example - let's flip the 1000 More Punks collection:

```
$ punk --file ./morepunks.png flip
```

And so on.




### Shuffle Command

_Shuffle all punk characters (randomly) in all-in-one punk series composite (`./punks.png`)_

Let's generate an all new punks series by randomly shuffling
"one-by-one by hand [thanks to philip the intern]" all punks.
Let's give it a try:

```
$ punk shuffle
#  - same as -
$ punk --file ./punks.png --seed 4142 shuffle
```

printing:

```
==> reading >./punks.png<...
     >ac39af4793119ee46bbff351d8cb6b5f23da60222126add4268e261199a2921b< SHA256 hash matching
         ✓ True Official Genuine CryptoPunks™ verified
   using random generation number seed >4142< for shuffle
     #1369 now #0
     #590  now #1
     #1635 now #2
     #3199 now #3
     ...
==> saving p(h)unks shuffled one-by-one by hand to >./punks-4142.png<...
```

And voila!

Note: The shuffle command also prints out
all new index numbers for easy reference (to reuse attributes and so on):

```
All 10000 index numbers (zero-based) for reference using seed 4142:

[1369,  590, 1635, 3199, 1887, 7719, 5747, 2146, 6671, 7144,
 1428, 7817, 1219,  163, 7186, 8488, 7191, 5240, 7226, 6574,
 1619, 1701, 3018, 4745, 2438, 6474, 4756, 9300, 9382, 9528,
  102, 1847, 2848, 8369, 7825,  842,   66, 1035, 2934, 2442,
  ...
 8789, 7299, 4403, 5972,  338, 5635, 7566,  828, 8987, 9777]
```



Yes, you can.  Use any all-in-one composite image in the 24x24 format. Use the `--file` option.
Example - let's shuffle the 1000 More Punks collection:

```
$ punk --file ./morepunks.png shuffle
```

And so on.




## Usage in Your Scripts


Yes, you can generate punks in your own scripts
and much more.
See the
[**Programming CryptoPunks & Copypastas Step-by-Step Booklet / Guide »**](https://github.com/cryptopunksnotdead/programming-cryptopunks)



## Install

Just install the gem:

    $ gem install cryptopunks


## License

The scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.
