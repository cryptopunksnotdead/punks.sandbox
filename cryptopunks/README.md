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
    2.0.0

GLOBAL OPTIONS
    -d, --dir,
    -o, --out, --outdir=DIR - Output directory (default: .)
    -f, --file=FILE         - True Official Genuine CryptoPunks™ all-in-one
                              composite image (default: ./punks.png)
    --offset=NUM            - Start counting at offset (default: 0)
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

    help             - Shows a list of commands or help for one command
```

### Generate Command

_Generate punk characters from text attributes (from scratch / zero) via builtin punk spritesheet_


### List Command

_List all punk archetype and attribute names from builtin punk spritesheet_



### Query Command

_Query (builtin off-chain) punk contract for punk text attributes by IDs - use 0 to 9999_





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
