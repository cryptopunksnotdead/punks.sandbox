###########
#  to run use:
#    ruby ./natural.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'



outdir = './i'    ## use ./tmp - why? why not?

alien_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . ^ ^ ^ ^ ^ ^ ^ . . . . . . . . .
. . . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . ^ ^ ^ ^ x @ ^ ^ ^ x @ ^ . . . . . . .
. . . . ^ ^ o ^ ^ @ o ^ ^ ^ @ o ^ . . . . . . .
. . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . ^ ^ ^ ^ ^ ^ ^ o ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ o ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ o ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ @ @ @ @ @ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ . . . . . . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ . . . . . . . . . . . . .
TXT

punk = Image.parse( alien_design, colors: ALIEN_COLORS )
punk.save( "#{outdir}/alien-male-natural.png")
punk.zoom(4).save( "#{outdir}/alien-male-natural4x.png" )


zombie_design =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . o o o o o o o . . . . . . . . .
. . . . . . . o o o o o o o o o . . . . . . . .
. . . . . . o o o ~ o o o o o o o . . . . . . .
. . . . . . o o ~ o o o o o o o o . . . . . . .
. . . . . . o o o o o o o o o o o . . . . . . .
. . . . . . o o o o o o o o o o o . . . . . . .
. . . . . . o o o x x o o o x x o . . . . . . .
. . . . . o o o o ^ @ o o o ^ @ o . . . . . . .
. . . . . o o o o x o o o o x o o . . . . . . .
. . . . . o o o o o o o o o o o o . . . . . . .
. . . . . . o o o o o o @ @ o o o . . . . . . .
. . . . . . o o o o o o o o o o o . . . . . . .
. . . . . . o o o o o o o o o o o . . . . . . .
. . . . . . o o o o o @ @ @ o o o . . . . . . .
. . . . . . o o o o o x o o o o o . . . . . . .
. . . . . . o o o o o o o o o o . . . . . . . .
. . . . . . o o o o o o o o o . . . . . . . . .
. . . . . . o o o o o . . . . . . . . . . . . .
. . . . . . o o o o o . . . . . . . . . . . . .
TXT

punk = Image.parse( zombie_design, colors: ZOMBIE_COLORS )
punk.save( "#{outdir}/zombie-male-natural.png")
punk.zoom(4).save( "#{outdir}/zombie-male-natural4x.png" )


ape_design =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . x x x x x x x . . . . . . . . .
. . . . . . . x x x x x x x x x . . . . . . . .
. . . . . . x x x x x x x x x x x . . . . . . .
. . . . . . x x x x x x x x x x x . . . . . . .
. . . . . . x x x @ @ @ @ @ @ x x . . . . . . .
. . . . . . x x ^ ^ ^ ^ ^ ^ ^ ^ x . . . . . . .
. . . . . . x x ^ o o ^ ^ ^ o o x . . . . . . .
. . . . . x x x ^ @ ~ ^ ^ ^ @ ~ x . . . . . . .
. . . . . x x x ^ ^ ^ ^ ^ ^ ^ ^ x . . . . . . .
. . . . . x x x ^ ^ ^ ^ ^ ^ ^ ^ x . . . . . . .
. . . . . . x x x ^ ^ @ ^ @ ^ ^ x . . . . . . .
. . . . . . x x x x ^ ^ ^ ^ ^ x x . . . . . . .
. . . . . . x x x ^ ^ ^ ^ ^ ^ ^ x . . . . . . .
. . . . . . x x x ^ @ @ @ @ @ ^ x . . . . . . .
. . . . . . x x x ^ ^ ^ ^ ^ ^ ^ x . . . . . . .
. . . . . . x x x x ^ ^ ^ ^ ^ x . . . . . . . .
. . . . . . x x x x x x x x x . . . . . . . . .
. . . . . . x x x x x . . . . . . . . . . . . .
. . . . . . x x x x x . . . . . . . . . . . . .
TXT

punk = Image.parse( ape_design, colors: APE_COLORS )
punk.save( "#{outdir}/ape-male-natural.png")
punk.zoom(4).save( "#{outdir}/ape-male-natural4x.png" )

ape_zombie_design =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . x x x x x x x . . . . . . . . .
. . . . . . . x x x x x x x x x . . . . . . . .
. . . . . . x x x ~ x x x x x x x . . . . . . .
. . . . . . x x ~ x x x x x x x x . . . . . . .
. . . . . . x x x @ @ @ @ @ @ x x . . . . . . .
. . . . . . x x ^ ^ ^ ^ ^ ^ ^ ^ x . . . . . . .
. . . . . . x x ^ o o ^ ^ ^ o o x . . . . . . .
. . . . . x x x ^ % @ ^ ^ ^ % @ x . . . . . . .
. . . . . x x x ^ o ^ ^ ^ ^ o ^ x . . . . . . .
. . . . . x x x ^ ^ ^ ^ ^ ^ ^ ^ x . . . . . . .
. . . . . . x x x ^ ^ @ ^ @ ^ ^ x . . . . . . .
. . . . . . x x x x ^ ^ ^ ^ ^ x x . . . . . . .
. . . . . . x x x ^ ^ ^ ^ ^ ^ ^ x . . . . . . .
. . . . . . x x x ^ @ @ @ @ @ ^ x . . . . . . .
. . . . . . x x x ^ o ^ ^ ^ ^ ^ x . . . . . . .
. . . . . . x x x x ^ ^ ^ ^ ^ x . . . . . . . .
. . . . . . x x x x x x x x x . . . . . . . . .
. . . . . . x x x x x . . . . . . . . . . . . .
. . . . . . x x x x x . . . . . . . . . . . . .
TXT
punk = Image.parse( ape_zombie_design, colors: ['000000', '7DA269', '5E7253', 'A1C18F', '91B080', 'FF0000'] )
punk.save( "#{outdir}/ape-zombie-male-natural.png")
punk.zoom(4).save( "#{outdir}/ape-zombie-male-natural4x.png" )


ape_alien_design =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . x x x x x x x . . . . . . . . .
. . . . . . . x x x x x x x x x . . . . . . . .
. . . . . . x x x ~ x x x x x x x . . . . . . .
. . . . . . x x ~ x x x x x x x x . . . . . . .
. . . . . . x x x @ @ @ @ @ @ x x . . . . . . .
. . . . . . x x ~ ~ ~ ~ ~ ~ ~ ~ x . . . . . . .
. . . . . x x x ~ o @ ~ ~ ~ o @ x . . . . . . .
. . . . x x ^ x ~ @ ^ ~ ~ ~ @ ^ x . . . . . . .
. . . . . x x x ~ ~ ~ ~ ~ ~ ~ ~ x . . . . . . .
. . . . . x x x ~ ~ ~ ~ ~ ~ ~ ~ x . . . . . . .
. . . . . . x x x ~ ~ ^ ~ ^ ~ ~ x . . . . . . .
. . . . . . x x x x ~ ~ ~ ~ ~ x x . . . . . . .
. . . . . . x x x ~ ~ ~ ~ ~ ~ ~ x . . . . . . .
. . . . . . x x x ~ @ @ @ @ @ ~ x . . . . . . .
. . . . . . x x x ~ ~ ~ ~ ~ ~ ~ x . . . . . . .
. . . . . . x x x x ~ ~ ~ ~ ~ x . . . . . . . .
. . . . . . x x x x x x x x x . . . . . . . . .
. . . . . . x x x x x . . . . . . . . . . . . .
. . . . . . x x x x x . . . . . . . . . . . . .
TXT
punk = Image.parse( ape_alien_design, colors: ['000000', 'C8FBFB', '75BDBD', '9BE0E0', 'F3FFFF'] )
punk.save( "#{outdir}/ape-alien-male-natural.png")
punk.zoom(4).save( "#{outdir}/ape-alien-male-natural4x.png" )

skeleton_design =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . x x x x x x x . . . . . . . . .
. . . . . . . x x x x x x x x x . . . . . . . .
. . . . . . x x x x x x x x x x x . . . . . . .
. . . . . . x x x x x x x x x x x . . . . . . .
. . . . . . x x x x x x x x x x x . . . . . . .
. . . . . . x x x x x x x x x x x . . . . . . .
. . . . . . x x x @ @ x x x @ @ x . . . . . . .
. . . . . x x x x @ @ x x x @ @ x . . . . . . .
. . . . . x x x x x x x x x x x x . . . . . . .
. . . . . x x x x x x x x x x x x . . . . . . .
. . . . . . x x x x x x @ @ x x x . . . . . . .
. . . . . . x x x x x x x x x x x . . . . . . .
. . . . . . x x x x @ x @ x @ x x . . . . . . .
. . . . . . x x x x @ @ @ @ @ x x . . . . . . .
. . . . . . x x x x @ x @ x @ x x . . . . . . .
. . . . . . x x x x x x x x x x . . . . . . . .
. . . . . . x x x x x x x x x . . . . . . . . .
. . . . . . x x x x x . . . . . . . . . . . . .
. . . . . . x x x x x . . . . . . . . . . . . .
TXT
punk = Image.parse( skeleton_design, colors: SKELETON_COLORS )
punk.save( "#{outdir}/skeleton-male-natural.png")
punk.zoom(4).save( "#{outdir}/skeleton-male-natural4x.png" )

demon_design =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . ^ ^ . . . . . ^ ^ . . . . . . . .
. . . . . . . ^ ^ ^ . . . ^ ^ ^ . . . . . . . .
. . . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . .
. . . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ x x ^ ^ ^ x x ^ . . . . . . .
. . . . . ^ ^ ^ ^ @ o ^ ^ ^ @ o ^ . . . . . . .
. . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ @ @ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ @ @ @ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ . . . . . . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ . . . . . . . . . . . . .
TXT
punk = Image.parse( demon_design, colors: DEMON_COLORS )
punk.save( "#{outdir}/demon-male-natural.png")
punk.zoom(4).save( "#{outdir}/demon-male-natural4x.png" )




human_male_design =<<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . ^ ^ ^ ^ ^ ^ ^ . . . . . . . . .
. . . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . .
. . . . . . ^ ^ ^ ~ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ~ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ x x ^ ^ ^ x x ^ . . . . . . .
. . . . . ^ ^ ^ ^ @ o ^ ^ ^ @ o ^ . . . . . . .
. . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ @ @ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ @ @ @ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ ^ ^ ^ . . . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ . . . . . . . . . . . . .
. . . . . . ^ ^ ^ ^ ^ . . . . . . . . . . . . .
TXT

males = {
  lighter: HUMAN_COLORS_LIGHTER,
  light:   HUMAN_COLORS_LIGHT,
  dark:    HUMAN_COLORS_DARK,
  darker:  HUMAN_COLORS_DARKER
}

males.each do |skintone, colors|
  punk = Image.parse( human_male_design, colors: colors )
  punk.save( "#{outdir}/human-male-#{skintone}-natural.png")
  punk.zoom(4).save( "#{outdir}/human-male-#{skintone}-natural4x.png" )
end



puts "bye"