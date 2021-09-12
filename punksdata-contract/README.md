# Inside the CryptoPunksData Contract - The Decentralized Autonomous "Off-Chain" Offline Version - Generate Punks by ID (0 to 9999) in the Original 24x24 Format or with 2x, 4x, 8x Zoom or More, Query for Attributes by ID and More



Let's use an "off-chain" copy of the "on-chain" CryptoPunksData
and let's put together an
autonomous "contract" script that
let's you generate punks by ID or query for attributes by ID and more.
Example:

``` ruby
punks = CryptoPunksData.new     # start up the "offline" contract

# get punk #0 (as an image)
punk = punks[ 0 ]  #  same as punks.punk_image( 0 ) or punks.image( 0 )
punk.save( "punk-0000.png" )
punk.zoom(4).save( "punk-0000x4.png" )
```

Voila!
![](i/punk-0000.png)
4x  ![](i/punk-0000x4.png)


Lookup the meta (data record) and attributes:

``` ruby
punks.meta[ 0 ]               #=> [6, 125, 122, 126]
punks.punk_attributes( 0 )    #=> "Female 2, Earring, Blonde Bob, Green Eye Shadow"
```

And let's try some more punks:

``` ruby
# get punk #2890 (as an image)
punk = punks[ 2890 ]
punk.save( "punk-2890.png" )
punk.zoom(4).save( "punk-2890x4.png" )

punks.meta[ 2890 ]            #=> [11, 38]
punks.punk_attributes( 2890 ) #=> "Alien, Cap"

# get punk #2890 (as an image)
punk = punks[ 8219 ]
punk.save( "punk-8219.png" )
punk.zoom(4).save( "punk-8219x4.png" )

pp punks.meta[ 8219 ]            #=>  [10, 22]
pp punks.punk_attributes( 8219 ) #=> "Ape, Knitted Cap"
```

Voila!

![](i/punk-2890.png)
![](i/punk-8219.png)
4x  ![](i/punk-2890x4.png)
![](i/punk-8219x4.png)



To be continued...






## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.




