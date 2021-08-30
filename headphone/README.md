# Headphone -  Attribute of the Day  -  Punk w/ Headphone


Let's get inspired by
[Bit Punk! #062 on Cardano](https://bitpunkcardano.com/bit/062/)
and let's design headphones from scratch:



``` ruby
headphone = Image.parse( <<TXT, colors: ['444444', 'CDCDCD'] )
. . . . x x x x x x x . . . .
. . . x . . . . . . . x . . .
. . x . . . . . . . . . x . .
. x . . . . . . . . . . . x .
. x . . . . . . . . . . . x .
. x . . . . . . . . . . . x .
. x . . . . . . . . . . . x .
. x @ . . . . . . . . . @ x .
. @ @ . . . . . . . . . @ @ .
x @ @ . . . . . . . . . @ @ x
. @ @ . . . . . . . . . @ @ .
. . @ . . . . . . . . . @ . .
TXT

headphone.save( 'headphone.png' )
headphone.zoom(4).save( 'headphone4x.png' )
```

Voila!

![](i/headphone.png) 4x ![](i/headphone4x.png)




And let's try the headphone ![](i/headphone.png)
on the punk archetypes
![](i/design-human-male_lighter.png)
![](i/design-human-male_light.png)
![](i/design-human-male_dark.png)
![](i/design-human-male_darker.png)
![](i/design-zombie-male.png)
![](i/design-ape-male.png)
![](i/design-alien-male.png):


``` ruby
designs = [
  'human-male!lighter',
  'human-male!light',
  'human-male!dark',
  'human-male!darker',
  'zombie-male',
  'ape-male',
  'alien-male',
 ]

designs.each do |design|
  punk = Punks::Image.new( design: design )

  punk[4,12] = 0   if design == 'alien-male'   ## quick hack/fix for alien ear

  punk.compose!( headphone, 4, 4 )

  name = design.sub( '!', '_')   ## note: change human-male!lighter to human-male_lighter

  punk.save( "punk_headphone-#{name}.png" )
  punk.zoom(4).save( "punk_headphone-#{name}x4.png" )
end
```


Voila!

![](i/punk_headphone-human-male_lighter.png)
![](i/punk_headphone-human-male_light.png)
![](i/punk_headphone-human-male_dark.png)
![](i/punk_headphone-human-male_darker.png)
![](i/punk_headphone-zombie-male.png)
![](i/punk_headphone-ape-male.png)
![](i/punk_headphone-alien-male.png)

4x
![](i/punk_headphone-human-male_lighterx4.png)
![](i/punk_headphone-human-male_lightv.png)
![](i/punk_headphone-human-male_darkx4.png)
![](i/punk_headphone-human-male_darkerx4.png)
![](i/punk_headphone-zombie-malex4.png)
![](i/punk_headphone-ape-malex4.png)
![](i/punk_headphone-alien-malex4.png)




Let's add hair ![](i/hair.png).
Voila!

![](i/punk_headphone_ii-human-male_lighter.png)
![](i/punk_headphone_ii-human-male_light.png)
![](i/punk_headphone_ii-human-male_dark.png)
![](i/punk_headphone_ii-human-male_darker.png)
![](i/punk_headphone_ii-zombie-male.png)
![](i/punk_headphone_ii-ape-male.png)
![](i/punk_headphone_ii-alien-male.png)

4x
![](i/punk_headphone_ii-human-male_lighterx4.png)
![](i/punk_headphone_ii-human-male_lightv.png)
![](i/punk_headphone_ii-human-male_darkx4.png)
![](i/punk_headphone_ii-human-male_darkerx4.png)
![](i/punk_headphone_ii-zombie-malex4.png)
![](i/punk_headphone_ii-ape-malex4.png)
![](i/punk_headphone_ii-alien-malex4.png)



That's it.  Now design and try your own attributes.
Yes, you can!



## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.



