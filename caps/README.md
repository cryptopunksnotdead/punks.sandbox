# All Caps Experiment - Choose Your Own (Baseball) Cap Color


Here's the experiment - let's (re)draw
the (baseball) cap (from scratch / from zero)
and let's put the cap
with your own colors of choice onto any
zero-attribute "plain vanilla" punk archetype.


Let's use the online punk pixel drawing tool (see => [**cryptopunksnotdead.github.io**](https://cryptopunksnotdead.github.io) )
to draw the (baseball) cap in 14x5 size.


![](i/pixel-cap.png)

Tip: Use the print button to export the (baseball) cap into
a ready-to-cut-n-paste pixel matrix.


Let's try:

``` ruby
cap = Image.parse( <<TXT, colors: ['8119b7', 'b261dc'] )
. . @ @ @ @ @ @ @ . . . . .
. @ @ @ @ @ @ x @ @ . . . .
@ @ @ @ @ @ @ @ x @ . . . .
@ @ @ @ @ @ @ @ @ @ @ @ @ .
@ @ @ @ @ @ @ @ @ @ @ @ @ @
TXT

cap.save( './cap.png' )
cap.zoom(4).save( './capx4.png' )
```

Resulting in:

![](i/cap.png)
![](i/capx4.png)




Let's put the cap onto the four archetypes
(human, zombie, ape, alien)  with the human in the four
variants (lighter, light, dark, darker)
and let's add four more archetypes
(demon, vampire, orc, skeleton) for fun.

![](i/design-human-male_lighter.png)
![](i/design-human-male_light.png)
![](i/design-human-male_dark.png)
![](i/design-human-male_darker.png)
![](i/design-zombie-male.png)
![](i/design-ape-male.png)
![](i/design-alien-male.png)
![](i/design-demon-male.png)
![](i/design-vampire-male.png)
![](i/design-orc-male.png)
![](i/design-skeleton-male.png)

![](i/design-human-male_lighterx4.png)
![](i/design-human-male_lightx4.png)
![](i/design-human-male_darkx4.png)
![](i/design-human-male_darkerx4.png)
![](i/design-zombie-malex4.png)
![](i/design-ape-malex4.png)
![](i/design-alien-malex4.png)
![](i/design-demon-malex4.png)
![](i/design-vampire-malex4.png)
![](i/design-orc-malex4.png)
![](i/design-skeleton-malex4.png)


``` ruby
designs = [
  'human-male!lighter',
  'human-male!light',
  'human-male!dark',
  'human-male!darker',
  'zombie-male',
  'ape-male',
  'alien-male',
  'demon-male',
  'vampire-male',
  'orc-male',
  'skeleton-male',
]


designs.each do |design|
  punk = Punks::Image.new( design: design )

  x, y = [6, 4]                  ## head offset
  punk.compose!( cap, x, y )

  name = design.sub( '!', '_')   ## note: change human-male!lighter to human-male_lighter

  punk.save( "./i/#{name}_279.png" )
  punk.zoom(4).save( "./i/#{name}_279x4.png" )
end
```


Resulting in:

![](i/human-male_lighter_279.png)
![](i/human-male_light_279.png)
![](i/human-male_dark_279.png)
![](i/human-male_darker_279.png)
![](i/zombie-male_279.png)
![](i/ape-male_279.png)
![](i/alien-male_279.png)
![](i/demon-male_279.png)
![](i/vampire-male_279.png)
![](i/orc-male_279.png)
![](i/skeleton-male_279.png)

![](i/human-male_lighter_279x4.png)
![](i/human-male_light_279x4.png)
![](i/human-male_dark_279x4.png)
![](i/human-male_darker_279x4.png)
![](i/zombie-male_279x4.png)
![](i/ape-male_279x4.png)
![](i/alien-male_279x4.png)
![](i/demon-male_279x4.png)
![](i/vampire-male_279x4.png)
![](i/orc-male_279x4.png)
![](i/skeleton-male_279x4.png)






That's it for now.  Now use your own colors
or design your own caps. Yes, you can!



## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.
