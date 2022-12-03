# Do-It-Yourself (DIY) - Yes, You Can - Generate Your Own Default Profile Pictures (PFPs)


The idea -  turn punk pixel heads into default profile pic(ture)s via [**Image#silhouette**](https://github.com/learnpixelart). (Credit to [@piv_piv](https://twitter.com/piv_piv/status/1577641420881543175) and [@dumbnamenumbers](https://twitter.com/dumbnamenumbers/status/1582500383355654145).)


![](i/default1-240x240.png)
![](i/default1-punk0@10x.png)
![](i/default1-punk1@10x.png)
![](i/default1-punk2@10x.png)
![](i/default1-punk3@10x.png)



Let's try the first Matt & John's® pixel punk heads
(re)generated from scratch (via text-to-image attributes)
turned into default profile pic(ture)s
with the foreground color in red/green/blue (rgb) hex `0x647785`
and the background color `0xCCD5DE`.


``` ruby
require 'punks'

specs = parse_data( <<TXT )
  Female 2, Earring, Blonde Bob, Green Eye Shadow
  Male 1, Smile, Mohawk
  Female 3, Wild Hair
  Male 1, Wild Hair, Pipe, Nerd Glasses
  Male 2, Goat, Earring, Wild Hair, Big Shades
  Female 2, Earring, Half Shaved, Purple Eye Shadow
  Male 2, Do-rag
  Female 2, Spots, Wild White Hair, Clown Eyes Blue
  Male 1, Luxurious Beard, Messy Hair
  Male 2, Big Beard, Police Cap, Clown Nose
  Female 1, Mohawk, Blue Eye Shadow
  Female 2, Black Lipstick, Straight Hair Dark, Clown Eyes Green
  Female 1, Purple Lipstick, Blonde Short
  # ...
TXT

specs.each_with_index do |attributes,i|
  img = YeOldePunk::Image.generate( *attributes )

  profilepic = img.silhouette( '0x647785' ).background( '0xCCD5DE' )
  profilepic.save( "punk#{i}.png" )
  profilepic.zoom(10).save( "punk#{i}@10x.png" )
end
```


Resulting in:

![](i/default1-punk0.png)
![](i/default1-punk1.png)
![](i/default1-punk2.png)
![](i/default1-punk3.png)
![](i/default1-punk4.png)
![](i/default1-punk5.png)
![](i/default1-punk6.png)
![](i/default1-punk7.png)
![](i/default1-punk8.png)
![](i/default1-punk9.png)
![](i/default1-punk10.png)
![](i/default1-punk11.png)
![](i/default1-punk12.png)
![](i/default1-punk13.png)
![](i/default1-punk14.png)
![](i/default1-punk15.png)
![](i/default1-punk16.png)
![](i/default1-punk17.png)
![](i/default1-punk18.png)
![](i/default1-punk19.png)
![](i/default1-punk20.png)
![](i/default1-punk21.png)
![](i/default1-punk22.png)
![](i/default1-punk23.png)
![](i/default1-punk24.png)




## Is Blue The New Gray?  Yes, You Can - Try More Colors

![](i/default2-240x240.png)
![](i/default2-punk0@10x.png)
![](i/default2-punk1@10x.png)
![](i/default2-punk2@10x.png)
![](i/default2-punk3@10x.png)


With the new foreground color in red/green/blue (rgb) hex `0x4474E0`
and the background color `0xA0C2FF`. Re-run the script
resulting:

![](i/default2-punk0.png)
![](i/default2-punk1.png)
![](i/default2-punk2.png)
![](i/default2-punk3.png)
![](i/default2-punk4.png)
![](i/default2-punk5.png)
![](i/default2-punk6.png)
![](i/default2-punk7.png)
![](i/default2-punk8.png)
![](i/default2-punk9.png)
![](i/default2-punk10.png)
![](i/default2-punk11.png)
![](i/default2-punk12.png)
![](i/default2-punk13.png)
![](i/default2-punk14.png)
![](i/default2-punk15.png)
![](i/default2-punk16.png)
![](i/default2-punk17.png)
![](i/default2-punk18.png)
![](i/default2-punk19.png)
![](i/default2-punk20.png)
![](i/default2-punk21.png)
![](i/default2-punk22.png)
![](i/default2-punk23.png)
![](i/default2-punk24.png)


---

![](i/default3-240x240.png)
![](i/default3-punk0@10x.png)
![](i/default3-punk1@10x.png)
![](i/default3-punk2@10x.png)
![](i/default3-punk3@10x.png)


Or with the new foreground color in red/green/blue (rgb) hex `0xFFFFFF` (also known as white)
and the background color `0xB5C3DE`. Re-run the script
resulting:

![](i/default3-punk0.png)
![](i/default3-punk1.png)
![](i/default3-punk2.png)
![](i/default3-punk3.png)
![](i/default3-punk4.png)
![](i/default3-punk5.png)
![](i/default3-punk6.png)
![](i/default3-punk7.png)
![](i/default3-punk8.png)
![](i/default3-punk9.png)
![](i/default3-punk10.png)
![](i/default3-punk11.png)
![](i/default3-punk12.png)
![](i/default3-punk13.png)
![](i/default3-punk14.png)
![](i/default3-punk15.png)
![](i/default3-punk16.png)
![](i/default3-punk17.png)
![](i/default3-punk18.png)
![](i/default3-punk19.png)
![](i/default3-punk20.png)
![](i/default3-punk21.png)
![](i/default3-punk22.png)
![](i/default3-punk23.png)
![](i/default3-punk24.png)



## Bonus: Is Circle The New Square?  Yes, You Can - Try More Shapes

![](i/default4-240x240.png)
![](i/default4-punk0@10x.png)
![](i/default4-punk1@10x.png)
![](i/default4-punk2@10x.png)
![](i/default4-punk3@10x.png)


Tip:  Use [**Image#circle**](https://github.com/learnpixelart) to turn the square image (e.g. 240×240) into a circle (that is, pixels outside the inner circle get changed to transparent in the square image).






## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.
