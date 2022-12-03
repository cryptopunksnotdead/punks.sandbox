# Default Profile Pic(ture)s  - Default PFPs


The idea turn punks into default profile pic(ture)s via [**Image#silhouette**](https://github.com/learnpixelart)  - credit to [@piv_piv](https://twitter.com/piv_piv/status/1577641420881543175) and [@dumbnamenumbers](https://twitter.com/dumbnamenumbers/status/1582500383355654145)


![](i/default1-240x240.png)
![](i/default1-punk0@10x.png)
![](i/default1-punk1@10x.png)
![](i/default1-punk2@10x.png)
i[](i/default1-punk3@10x.png)



## Yes, You Can - Do-It-Yourself (DIT)


Let's try the first Matt & John's® punks
(re)generated from scratch (via text-to-image attributes)
turned into default profile pic(ture)s
with the foreground color in red/green/blue (rgb) hex `0x647785`
and the background color `0xCCD5DE`.


``` ruby
require 'punks'

background = '0xCCD5DE'
foreground = '0x647785'


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
TXT

specs.each_with_index do |attributes,i|
  img = YeOldePunk::Image.generate( *attributes )

  profilepic = img.silhouette( foreground ).background( background )
  profilepic.save( "profilepics/default1-punk#{i}.png" )
  profilepic.zoom(10).save( "profilepics/default1-punk#{i}@10x.png" )
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
![](i/default1-punk10.png)
![](i/default1-punk11.png)
![](i/default1-punk12.png)




## Questions? Comments?

Post them on the [D.I.Y. Punk (Pixel) Art reddit](https://old.reddit.com/r/DIYPunkArt). Thanks.
