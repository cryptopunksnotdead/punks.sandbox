###############################
#  to run use:
#
#  $ ruby ./generate.rb


require 'cryptopunks'


human1 = Image.read( "./attributes/human1.png" )
human2 = Image.read( "./attributes/human2.png" )
human3 = Image.read( "./attributes/human3.png" )

idle            = Image.read( "../cyberpunks/attributes/04-mouth/idle.png")
nose_delicate   = Image.read( "../cyberpunks/attributes/05-nose/delicate.png" )
nose_downturned = Image.read( "../cyberpunks/attributes/05-nose/downturned.png" )
eyes_femme_wide = Image.read( "../cyberpunks/attributes/06-eyes/femme_wide.png" )
eyes_masc_wide  = Image.read( "../cyberpunks/attributes/06-eyes/masc_wide.png" )


males   = []
females = []

(1..3).each do |variant|
   base = Image.read( "./attributes/human#{variant}.png" )

   female = Image.new( 32, 32 )
   female.compose!( base )
   female.compose!( idle )
   female.compose!( nose_delicate )
   female.compose!( eyes_femme_wide )

   female.zoom(4).save( "./tmp/female#{variant}@4x.png" )
   female.save( "./tmp/female#{variant}.png" )

   females << female


   male = Image.new( 32, 32 )
   male.compose!( base )
   male.compose!( idle )
   male.compose!( nose_downturned )
   male.compose!( eyes_masc_wide )

   male.zoom(4).save( "./tmp/male#{variant}@4x.png" )
   male.save( "./tmp/male#{variant}.png" )

   males << male
end



ATTRIBUTES = {
 'Female 1' => females[0],
 'Female 2' => females[1],
 'Female 3' => females[2],
 'Male 1'   => males[0],
 'Male 2'   => males[1],
 'Male 3'   => males[2],

 'Blonde Bob'       => Image.read( "./attributes/blonde_bob.png" ),
 'Wild Hair'         => Image.read( "./attributes/wild_hair.png" ),
 'Half Shaved'       => Image.read( "./attributes/half_shaved.png" ),
 'Mohawk'            => Image.read( "./attributes/mohawk.png" ),
 'Hot Lipstick'      => Image.read( "./attributes/hot_lipstick.png" ),
 'Green Eye Shadow' => Image.read( "./attributes/green_eye_shadow.png" ),
 'Purple Eye Shadow' => Image.read( "./attributes/purple_eye_shadow.png" ),
 'Nerd Glasses'      => Image.read( "./attributes/nerd_glasses.png" ),
 'Big Shades'        => Image.read( "./attributes/big_shades.png" ),
 'Goat'              => Image.read( "./attributes/goat.png" ),
 'Earring'           => Image.read( "./attributes/earring.png" ),
 'Pipe'              => Image.read( "./attributes/pipe.png" ),
}


def generate_xl( *attributes )
  punk = Image.new( 32, 32, '#638596' )
  attributes.each do |attribute|
    punk.compose!( ATTRIBUTES[ attribute ] )
  end
  punk
end


punks = [
  ['Female 1'],
  ['Female 2'],
  ['Female 3'],
  ['Male 1'],
  ['Male 2'],
  ['Male 3'],
  ['Female 2', 'Blonde Bob', 'Green Eye Shadow', 'Hot Lipstick'],
  ['Male 1', 'Mohawk'],
  ['Female 3', 'Wild Hair', 'Hot Lipstick'],
  ['Male 1', 'Wild Hair', 'Nerd Glasses', 'Pipe'],
  ['Male 2', 'Goat', 'Earring', 'Wild Hair', 'Big Shades'],
  ['Female 2', 'Earring', 'Purple Eye Shadow', 'Half Shaved', 'Hot Lipstick'],
]


composite = ImageComposite.new( 6, 4, width: 32,
                                      height: 32 )


punks.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes )
  punk.save( "./tmp/punk#{i}.png" )
  punk.zoom(4).save( "./tmp/punk#{i}@4x.png" )

  punk_xl = Image.new( 32, 32, '#638596' )
  punk_xl.compose!( punk, 4, 4 )     # center (24x24) in bigger xl (32x32) format
  composite << punk_xl

  punk_xl = generate_xl( *attributes )

  punk_xl.save( "./tmp/punk#{i}_xl.png" )
  punk_xl.zoom(4).save( "./tmp/punk#{i}_xl@4x.png" )
  composite << punk_xl
end


composite.save( "./tmp/punks-xl.png" )
composite.zoom(4).save( "./tmp/punks-xl@4x.png" )


puts "bye"