# Spots Punk Art Challenge #1 Experiment -  Dotty Spotty "Currency" Punks Inspired by Damien Hirst's "The Currency"


The [**Punk Art Challenge #1**](https://old.reddit.com/r/CryptoPunksDev/comments/pttf4s/punk_art_challenge_1_10_000_dotty_spotty_currency/) reads:


How does it work?
Let's pick a theme and then it's up to you - yes, you can - to put together a new punk collection
with your own artistic interpretation / generation script.

Let's kick off with a theme inspired by
 [Damien Hirst's "The Currency"](https://currency.nft.heni.com/) token art parody
or is that cash grab with a paper with a bunch of random circles starting at $2000 a piece?

> The original sale of the artworks worked like an initial public offering of shares.
> Aspiring buyers could register and say how many they wanted
> (but not nominate which individual work).
> The offering was over-subscribed, as more than 30,000 people wanted
> more than 60,000 tokens (that is, three time the available number).
>
> [...]
>
> The sale of all 10,000 works is worth $20 million.
> But over the past month, since the artworks went on sale,
> there have been more than 1,800 resales, for almost $40 million.
> The highest price paid so far is $120,000, for No. 6272, titled “Yes”.
>
> Source: [Damien Hirst’s dotty ‘currency’ art makes as much sense as Bitcoin](https://theconversation.com/damien-hirsts-dotty-currency-art-makes-as-much-sense-as-bitcoin-166958)

   Let's generate 10 000 free dotty spotty punks.
   For example - turn every colored pixel in the 24x24 bitmap into a circle and
   maybe use different-sized variants of circles and maybe
  use a random offset "distortion" for the circle placement and maybe use some blur or a texture and so on.


---

Okkie.
Let's give it a try using
the punks
alien ![](i/punk-3100.png) #3100,
zombie ![](i/punk-3393.png) #3393,
blondie ![](i/punk-0172.png) #172 and
beanie ![](i/punk-2964.png) #2964.


Let's start with 10px circles:

``` ruby
punk.spots( 10 )
```

![](i/punk-3100@spots10.png)
![](i/punk-3393@spots10.png)
![](i/punk-0172@spots10.png)
![](i/punk-2964@spots10.png)


Let's add a spacing of 5px between circles:

``` ruby
punk.spots( 10, spacing: 5 )
```


![](i/punk-3100@spots10+5.png)
![](i/punk-3393@spots10+5.png)
![](i/punk-0172@spots10+5.png)
![](i/punk-2964@spots10+5.png)


Let's try 10px:

``` ruby
punk.spots( 10, spacing: 10 )
```

![](i/punk-3100@spots10+10.png)
![](i/punk-3393@spots10+10.png)
![](i/punk-0172@spots10+10.png)
![](i/punk-2964@spots10+10.png)


Let's add some randomness. Let's try a random circle radius
between 3px and 5px
and a random x/y-offset from the circles center by +/-2px:

``` ruby
punk.spots( 10, center: [-2,2], radius: [3,5] )
```

![](i/punk-3100@spots10_random.png)
![](i/punk-3393@spots10_random.png)
![](i/punk-0172@spots10_random.png)
![](i/punk-2964@spots10_random.png)


Let's add back the 10px spacing
and let's make the random circle radius bigger
between 5px and 10px:

``` ruby
punk.spots( 10, spacing: 10,
                center: [-2,2], radius: [5,10] )
```


![](i/punk-3100@spots10+10_random.png)
![](i/punk-3393@spots10+10_random.png)
![](i/punk-0172@spots10+10_random.png)
![](i/punk-2964@spots10+10_random.png)


And bigger between 6px and 12px:


``` ruby
punk.spots( 10, spacing: 10,
                center: [-1,1], radius: [6,12] )
```

![](i/punk-3100@spots10+10+big_random.png)
![](i/punk-3393@spots10+10+big_random.png)
![](i/punk-0172@spots10+10+big_random.png)
![](i/punk-2964@spots10+10+big_random.png)




...








That's it for now to get you started.




## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.




