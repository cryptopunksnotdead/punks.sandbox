###############################
#  to run use:
#
#  $ ruby ./archetypes.rb

## generate archetypes e.g.
##     - male 1/2/3    from (faceless) human
##     - female 1/2/3  from (faceless) human
##     - alien 1/2/3   from (faceless) alien


require 'pixelart'



idle            = Image.read( "../cyberpunks/attributes/04-mouth/idle.png")
nose_delicate   = Image.read( "../cyberpunks/attributes/05-nose/delicate.png" )
nose_downturned = Image.read( "../cyberpunks/attributes/05-nose/downturned.png" )
eyes_femme_wide = Image.read( "../cyberpunks/attributes/06-eyes/femme_wide.png" )
eyes_masc_wide  = Image.read( "../cyberpunks/attributes/06-eyes/masc_wide.png" )


base        = Image.read( "./i/alien.png" )
alien_nose1 = Image.read( "./i/alien-nose1.png" )


(1..3).each do |variant|
   alien_eyes = Image.read( "./i/alien-eyes#{variant}.png")

  alien = Image.new( 32, 32 )
  alien.compose!( base )
  alien.compose!( idle )
  alien.compose!( alien_nose1 )
  alien.compose!( alien_eyes )

  alien.zoom(4).save( "./tmp/alien#{variant}@4x.png" )
  alien.save( "./tmp/alien#{variant}.png" )
end


(1..3).each do |variant|
   base = Image.read( "./i/human#{variant}.png" )

   female = Image.new( 32, 32 )
   female.compose!( base )
   female.compose!( idle )
   female.compose!( nose_delicate )
   female.compose!( eyes_femme_wide )

   female.zoom(4).save( "./tmp/female#{variant}@4x.png" )
   female.save( "./tmp/female#{variant}.png" )


   male = Image.new( 32, 32 )
   male.compose!( base )
   male.compose!( idle )
   male.compose!( nose_downturned )
   male.compose!( eyes_masc_wide )

   male.zoom(4).save( "./tmp/male#{variant}@4x.png" )
   male.save( "./tmp/male#{variant}.png" )
end



puts "bye"