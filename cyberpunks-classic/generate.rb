###############################
#  to run use:
#
#  $ ruby ./generate.rb


require 'cryptopunks'



ATTRIBUTES = {
 'Female 1' => Image.read( "./attributes/female1.png" ),
 'Female 2' => Image.read( "./attributes/female2.png" ),
 'Female 3' => Image.read( "./attributes/female3.png" ),
 'Male 1'   => Image.read( "./attributes/male1.png" ),
 'Male 2'   => Image.read( "./attributes/male2.png" ),
 'Male 3'   => Image.read( "./attributes/male3.png" ),
 'Alien 1'  => Image.read( "./attributes/alien1.png" ),
 'Alien 2'  => Image.read( "./attributes/alien2.png" ),
 'Alien 3'  => Image.read( "./attributes/alien3.png" ),

 'Blonde Bob'       => Image.read( "./attributes/blonde_bob.png" ),
 'Wild Hair'         => Image.read( "./attributes/wild_hair.png" ),
 'Half Shaved'       => Image.read( "./attributes/half_shaved.png" ),
 'Mohawk'            => Image.read( "./attributes/mohawk.png" ),

 'Hot Lipstick'      => Image.read( "./attributes/hot_lipstick.png" ),
 'Green Eye Shadow' => Image.read( "./attributes/green_eye_shadow.png" ),
 'Purple Eye Shadow' => Image.read( "./attributes/purple_eye_shadow.png" ),

 'Nerd Glasses'      => Image.read( "./attributes/nerd_glasses.png" ),
 'Big Shades'        => Image.read( "./attributes/big_shades.png" ),
 'Small Shades'      => Image.read( "./attributes/small_shades.png" ),
 '3D Glasses'        => Image.read( "./attributes/3D_glasses.png" ),

 'Goat'              => Image.read( "./attributes/goat.png" ),
 'Headband'          => Image.read( "./attributes/headband.png" ),
 'Medical Mask'      => Image.read( "./attributes/medical_mask.png" ),
 'Knitted Cap'       => Image.read( "./attributes/knitted_cap.png" ),
 'Earring'           => Image.read( "./attributes/earring.png" ),
 'Cap Forward'       => Image.read( "./attributes/cap_forward.png" ),
 'Pipe'              => Image.read( "./attributes/pipe.png" ),
}




def generate_xl( *attributes )
  punk = Image.new( 32, 32, '#638596' )
  attributes.each do |attribute|
    punk.compose!( ATTRIBUTES[ attribute ] )
  end
  punk
end





punks = Csv.parse( <<TXT )
  Female 1
  Female 2
  Female 3
  Male 1
  Male 2
  Male 3
  Female 2, Blonde Bob, Green Eye Shadow, Hot Lipstick
  Male 1, Mohawk
  Female 3, Wild Hair, Hot Lipstick
  Male 1, Wild Hair, Nerd Glasses, Pipe
  Male 2, Goat, Earring, Wild Hair, Big Shades
  Female 2, Earring, Purple Eye Shadow, Half Shaved, Hot Lipstick
TXT


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




aliens = Csv.parse( <<TXT )
  Alien
  Alien, Knitted Cap, Earring
  Alien, Knitted Cap, Earring, Medical Mask
  Alien, Headband
  Alien, Cap Forward, Small Shades, Pipe
TXT

composite = ImageComposite.new( 4, aliens.size, width: 32,
                                      height: 32 )


aliens.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes )
  punk.save( "./tmp/alien#{i}.png" )
  punk.zoom(4).save( "./tmp/alien#{i}@4x.png" )

  punk_xl = Image.new( 32, 32, '#638596' )
  punk_xl.compose!( punk, 4, 4 )     # center (24x24) in bigger xl (32x32) format
  composite << punk_xl

  (1..3).each do |variant|
    ## change first attribute e.g. Alien to Alien 1/2/3 etc.
    attributes_variant = ["#{attributes[0]} #{variant}"] + attributes[1..-1]

    if i == 4    ## use "slow motion"
      attributes_variant = attributes_variant[0..1]  if variant == 1
      attributes_variant = attributes_variant[0..2]  if variant == 2
    end

    pp attributes_variant
    punk_xl = generate_xl( *attributes_variant )

    punk_xl.save( "./tmp/alien#{i}.#{variant}_xl.png" )
    punk_xl.zoom(4).save( "./tmp/alien#{i}.#{variant}_xl@4x.png" )
    composite << punk_xl
  end
end


composite.save( "./tmp/aliens-xl.png" )
composite.zoom(4).save( "./tmp/aliens-xl@4x.png" )


puts "bye"