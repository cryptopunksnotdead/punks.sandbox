# Cool Punks Experiment - Draw Your Own Sun Glasses (from Scratch)

Mint Yourself Free Punks with Sun Glasses


Here's the experiment - let's draw some sun glasses (from scratch / from zero)
and let's turn zero-attribute "plain vanilla" punk archetypes
into cool punks with shades.


Let's use the online punk pixel drawing tool (see => [**cryptopunksnotdead.github.io**](https://cryptopunksnotdead.github.io) )
to draw all-black sun glasses in 12x3 size.


![](i/pixel-shades1.png)

Tip: Use the print button to export the sun glasses into
a ready-to-cut-n-paste pixel matrix.


Let's try:

``` ruby
shades1 = Image.parse( <<TXT, colors: ['000000'] )
1 1 1 1 1 1 1 1 1 1 1 1
0 0 1 1 1 1 0 1 1 1 1 0
0 0 0 1 1 0 0 0 1 1 0 0
TXT

shades1.save( './shades1.png' )
shades1.zoom(4).save( './shades1x4.png' )
```

Resulting in:

![](i/shades1.png)
![](i/shades1x4.png)




Let's add the shades to the four archetypes
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

  x, y = [6, 11]                 ## head offset
  punk.compose!( shades1, x, y )

  name = design.sub( '!', '_')   ## note: change human-male!lighter to human-male_lighter

  punk.save( "./i/coolpunk-#{name}_1.png" )
  punk.zoom(4).save( "./i/coolpunk-#{name}_1x4.png" )
end
```


Resulting in:

![](i/design-human-male_lighter_1.png)
![](i/design-human-male_light_1.png)
![](i/design-human-male_dark_1.png)
![](i/design-human-male_darker_1.png)
![](i/design-zombie-male_1.png)
![](i/design-ape-male_1.png)
![](i/design-alien-male_1.png)
![](i/design-demon-male_1.png)
![](i/design-vampire-male_1.png)
![](i/design-orc-male_1.png)
![](i/design-skeleton-male_1.png)

![](i/design-human-male_lighterx4_1.png)
![](i/design-human-male_lightx4_1.png)
![](i/design-human-male_darkx4_1.png)
![](i/design-human-male_darkerx4_1.png)
![](i/design-zombie-malex4_1.png)
![](i/design-ape-malex4_1.png)
![](i/design-alien-malex4_1.png)
![](i/design-demon-malex4_1.png)
![](i/design-vampire-malex4_1.png)
![](i/design-orc-malex4_1.png)
![](i/design-skeleton-malex4_1.png)



Let's draw and try another sunglasses design:

![](i/pixel-shades2.png)

``` ruby
shades2 = Image.parse( <<TXT, colors: ['000000', '690C45', '8C0D5B', 'AD2160'] )
0 1 1 1 1 1 0 1 1 1 1 1
0 1 2 2 2 1 1 1 2 2 2 1
1 1 3 3 3 1 0 1 3 3 3 1
0 1 4 4 4 1 0 1 4 4 4 1
0 0 1 1 1 0 0 0 1 1 1 0
TXT

shades2.save( './shades2.png' )
shades2.zoom(4).save( './shades2x4.png' )
```

Resulting in:

![](i/shades2.png)
![](i/shades2x4.png)

And


![](i/design-human-male_lighter_2.png)
![](i/design-human-male_light_2.png)
![](i/design-human-male_dark_2.png)
![](i/design-human-male_darker_2.png)
![](i/design-zombie-male_2.png)
![](i/design-ape-male_2.png)
![](i/design-alien-male_2.png)
![](i/design-demon-male_2.png)
![](i/design-vampire-male_2.png)
![](i/design-orc-male_2.png)
![](i/design-skeleton-male_2.png)

![](i/design-human-male_lighterx4_2.png)
![](i/design-human-male_lightx4_2.png)
![](i/design-human-male_darkx4_2.png)
![](i/design-human-male_darkerx4_2.png)
![](i/design-zombie-malex4_2.png)
![](i/design-ape-malex4_2.png)
![](i/design-alien-malex4_2.png)
![](i/design-demon-malex4_2.png)
![](i/design-vampire-malex4_2.png)
![](i/design-orc-malex4_2.png)
![](i/design-skeleton-malex4_2.png)



And let's draw and try another sunglasses design:

![](i/pixel-shades3.png)

``` ruby
shades3 = Image.parse( <<TXT, colors: ['000000', '000766', '0010e6'] )
1 1 1 1 1 1 1 1 1 1 1 1
0 0 1 2 2 1 0 1 2 2 1 0
0 0 1 3 3 1 0 1 3 3 1 0
0 0 0 1 1 0 0 0 1 1 0 0
TXT

shades3.save( './shades3.png' )
shades3.zoom(4).save( './shades3x4.png' )
```

Resulting in:

![](i/shades3.png)
![](i/shades3x4.png)

And


![](i/design-human-male_lighter_3.png)
![](i/design-human-male_light_3.png)
![](i/design-human-male_dark_3.png)
![](i/design-human-male_darker_3.png)
![](i/design-zombie-male_3.png)
![](i/design-ape-male_3.png)
![](i/design-alien-male_3.png)
![](i/design-demon-male_3.png)
![](i/design-vampire-male_3.png)
![](i/design-orc-male_3.png)
![](i/design-skeleton-male_3.png)

![](i/design-human-male_lighterx4_3.png)
![](i/design-human-male_lightx4_3.png)
![](i/design-human-male_darkx4_3.png)
![](i/design-human-male_darkerx4_3.png)
![](i/design-zombie-malex4_3.png)
![](i/design-ape-malex4_3.png)
![](i/design-alien-malex4_3.png)
![](i/design-demon-malex4_3.png)
![](i/design-vampire-malex4_3.png)
![](i/design-orc-malex4_3.png)
![](i/design-skeleton-malex4_3.png)



That's it for now.  Now design your own sunglasses. Yes, you can!




## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.
