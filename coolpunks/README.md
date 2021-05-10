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

![](i/design-human_lighter.png)
![](i/design-human_light.png)
![](i/design-human_dark.png)
![](i/design-human_darker.png)
![](i/design-zombie.png)
![](i/design-ape.png)
![](i/design-alien.png)
![](i/design-demon.png)
![](i/design-vampire.png)
![](i/design-orc.png)
![](i/design-skeleton.png)

![](i/design-human_lighterx4.png)
![](i/design-human_lightx4.png)
![](i/design-human_darkx4.png)
![](i/design-human_darkerx4.png)
![](i/design-zombiex4.png)
![](i/design-apex4.png)
![](i/design-alienx4.png)
![](i/design-demonx4.png)
![](i/design-vampirex4.png)
![](i/design-orcx4.png)
![](i/design-skeletonx4.png)



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

![](i/design-human_lighter_1.png)
![](i/design-human_light_1.png)
![](i/design-human_dark_1.png)
![](i/design-human_darker_1.png)
![](i/design-zombie_1.png)
![](i/design-ape_1.png)
![](i/design-alien_1.png)
![](i/design-demon_1.png)
![](i/design-vampire_1.png)
![](i/design-orc_1.png)
![](i/design-skeleton_1.png)

![](i/design-human_lighterx4_1.png)
![](i/design-human_lightx4_1.png)
![](i/design-human_darkx4_1.png)
![](i/design-human_darkerx4_1.png)
![](i/design-zombiex4_1.png)
![](i/design-apex4_1.png)
![](i/design-alienx4_1.png)
![](i/design-demonx4_1.png)
![](i/design-vampirex4_1.png)
![](i/design-orcx4_1.png)
![](i/design-skeletonx4_1.png)



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


![](i/design-human_lighter_2.png)
![](i/design-human_light_2.png)
![](i/design-human_dark_2.png)
![](i/design-human_darker_2.png)
![](i/design-zombie_2.png)
![](i/design-ape_2.png)
![](i/design-alien_2.png)
![](i/design-demon_2.png)
![](i/design-vampire_2.png)
![](i/design-orc_2.png)
![](i/design-skeleton_2.png)

![](i/design-human_lighterx4_2.png)
![](i/design-human_lightx4_2.png)
![](i/design-human_darkx4_2.png)
![](i/design-human_darkerx4_2.png)
![](i/design-zombiex4_2.png)
![](i/design-apex4_2.png)
![](i/design-alienx4_2.png)
![](i/design-demonx4_2.png)
![](i/design-vampirex4_2.png)
![](i/design-orcx4_2.png)
![](i/design-skeletonx4_2.png)



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


![](i/design-human_lighter_3.png)
![](i/design-human_light_3.png)
![](i/design-human_dark_3.png)
![](i/design-human_darker_3.png)
![](i/design-zombie_3.png)
![](i/design-ape_3.png)
![](i/design-alien_3.png)
![](i/design-demon_3.png)
![](i/design-vampire_3.png)
![](i/design-orc_3.png)
![](i/design-skeleton_3.png)

![](i/design-human_lighterx4_3.png)
![](i/design-human_lightx4_3.png)
![](i/design-human_darkx4_3.png)
![](i/design-human_darkerx4_3.png)
![](i/design-zombiex4_3.png)
![](i/design-apex4_3.png)
![](i/design-alienx4_3.png)
![](i/design-demonx4_3.png)
![](i/design-vampirex4_3.png)
![](i/design-orcx4_3.png)
![](i/design-skeletonx4_3.png)



That's it for now.  Now design your own sunglasses. Yes, you can!




## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.
