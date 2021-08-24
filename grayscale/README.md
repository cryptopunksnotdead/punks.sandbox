# Inside the CryptoPunks Bubble - Greyscale / Grayscale Punks Collection Case Study - Conceptual Art (Parody)? (Get-Rich-Quick) Cash Grab? Greater Fools (Financial) Fraud?


Let's have a looksie at the Grey Scale Punks collection or is that greater fools get-rich-quick fraud?


> RECORD SALE
>
> Greyscale Punk #2243 ![](i/punk2243_grayscale.png) just resold for a whopping 1.2 ETH (~$4000)!  4000% profit!
>
> -- [August 22, 2021](https://twitter.com/GreyscalePunks/status/1429315962910740481)


Is this a conceptual art parody? Or is this a (get-rich-quick) cash grab? Or a greater fools (financial) fraud?


Let's look at the Greyscale collection on the web, see [**greyscalepunks.com**](https://greyscalepunks.com) - on the Open Sea [digital token market],
see [**collection/greyscalepunks**](https://opensea.io/collection/greyscalepunks) - or follow updates on Twitter, see [**@greyscalepunks**](https://twitter.com/greyscalepunks).


The blurb reads:

> Greyscale Punks is an art token collection of Punks with a unique twist! Every day,
> at no specific time, new Greyscale Punks will be created,
> (with a supply cap of 10,000) starting at a price of just .02 ETH (\~$66).
> Every week, however, the starting price of each Greyscale Punk created
> will increase by .005 ETH (\~$15),
> raising the floor to protect your previous investments
> and add value to the project as it grows. This will cap at .05 ETH (\~$170),
> and when that happens the base price of a new Greyscale Punk will no longer rise.
> Each Greyscale Punk created is a 1 of 1, meaning there will never be any duplicates created!


As of August/24, 2021  - two days (?) after launching the analytics summary reads:

1 300 / 10 000 Items, 557 Owners, 0.04 ETH (\~$130) Floor Price, 60.8 ETH (\~$200 000) Traded



So what?

Here's the formula / script to turn all 10 000 original punks into grayscale
in less than ten seconds.
Let's try:



``` ruby
require 'cryptopunks'


print "==> loading image..."
punks = Punks::Image::Composite.read( 'punks.png' )
print "OK\n"


## change all 10 000 punks to grayscale
punks_grayscale = punks.grayscale
punks_grayscale.save( "punks_grayscale.png" )
```

Voila!

![](i/punks_grayscale_preview.png)  (a 10x10 preview).  Download [**punks_grayscale.png**](i/punks_grayscale.png) (~800k) for all 10 000 grayscale punks.


And let's have a looksie at the first five grayscale punks and let's generate 8x versions.


``` ruby
## reload as a composite image (with easy tile access via [])
punks_grayscale =  Punks::Image::Composite.read( 'punks_grayscale.png' )

## let's have a looksie at the first five grayscale punks
(0..5).each do |id|
  punk = punks_grayscale[id]

  punk.save( "punk#{id}_grayscale.png" )
  punk.zoom(8).save( "punk#{id}_grayscalex8.png" )
end
```


Voila!

![](i/punk0_grayscale.png)
![](i/punk1_grayscale.png)
![](i/punk2_grayscale.png)
![](i/punk3_grayscale.png)
![](i/punk4_grayscale.png)

8x

![](i/punk0_grayscale8x.png)
![](i/punk1_grayscale8x.png)
![](i/punk2_grayscale8x.png)
![](i/punk3_grayscale8x.png)
![](i/punk4_grayscale8x.png)



What's Next?
Let's try another round with ye olde' sepia vintage colors - ready to sell off to greater fools.

``` ruby
## change all 10 000 punks to sepia
punks_sepia = punks.change_palette8bit( Palette8bit::SEPIA )
punks_sepia.save( "punks_sepia.png" )
```


Voila!

![](i/punks_sepia_preview.png)  (a 10x10 preview).  Download [**punks_sepia.png**](i/punks_sepia.png) (~800k) for all ye 10 000 olde' sepia vinatage punks.


And again let's have a looksie at the first five sepia punks and let's generate 8x versions.


``` ruby
## reload as a composite image (with easy tile access via [])
punks_sepia =  Punks::Image::Composite.read( 'punks_sepia.png' )

## let's have a looksie at the first five sepia punks
(0..5).each do |id|
  punk = punks_sepia[id]

  punk.save( "punk#{id}_sepia.png" )
  punk.zoom(8).save( "punk#{id}_sepiax8.png" )
end
```


Voila!

![](i/punk0_sepia.png)
![](i/punk1_sepia.png)
![](i/punk2_sepia.png)
![](i/punk3_sepia.png)
![](i/punk4_sepia.png)

8x

![](i/punk0_sepia8x.png)
![](i/punk1_sepia8x.png)
![](i/punk2_sepia8x.png)
![](i/punk3_sepia8x.png)
![](i/punk4_sepia8x.png)



What's Next?
Let's try a blue color scheme or a false color scheme. Yes, you can.



## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.



