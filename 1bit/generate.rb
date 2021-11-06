#####################
#  generate 1bit (black & white) punks; to run use:
#
#   $ ruby ./generate.rb



$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


## little convenience helper
##   auto-add b&w (black&white) to all attribute names e.g.
##      Eyes   =>  Eyes B&W
##      Smile  =>  Smile B&W
##      ....
def generate( archetype, *more_attributes )

   attributes = [archetype] + more_attributes.map do |attribute|
    if ['Wild Hair'].include?( attribute )   ## pass through known b&w attributes by "default"
      attribute
    elsif attribute.index( "Black" )
      attribute ## pass through as-is
    else
      "#{attribute} B&W"
    end
  end

   pp attributes

   Punks::Image.generate( *attributes )
end




composite = ImageComposite.new( 6, 4 )



punk = generate( "Male 1-Bit",
                 "Eyes",
                 "Nose",
                 "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk0@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Eyes",
                 "Nose Small",
                 "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk0b@4x.png" )
composite << punk



## try adding some black only attributes

punk = generate( "Male 1-Bit",
                 "Small Shades",
                 "Nose",
                 "Mouth",
                 "Cap Forward",
                 "Pipe" )
punk.zoom(4).save( "./tmp/bitpunk1@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                  "Small Shades",
                  "Nose Small",
                 "Mouth",
                 "Cap Forward",
                 "Pipe" )
punk.zoom(4).save( "./tmp/bitpunk1b@4x.png" )
composite << punk


punk = generate( "Male 1-Bit",
                  "Regular Shades",
                  "Nose",
                  "Mouth",
                  "Smile",
                  "Top Hat" )
punk.zoom(4).save( "./tmp/bitpunk2@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                  "Regular Shades",
                  "Nose Small",
                  "Mouth",
                  "Smile",
                  "Top Hat" )
punk.zoom(4).save( "./tmp/bitpunk2b@4x.png" )
composite << punk


punk = generate( "Male 1-Bit",
                 "Laser Eyes",
                 "Nose",
                 "Mouth",
                 "Smile",
                 "Earring",
                 "Mohawk" )
punk.zoom(4).save( "./tmp/bitpunk3@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Laser Eyes",
                 "Nose Small",
                 "Mouth",
                 "Smile",
                 "Earring",
                 "Mohawk" )
punk.zoom(4).save( "./tmp/bitpunk3b@4x.png" )
composite << punk


punk = generate( "Male 1-Bit",
                 "Eyes",
                 "Nose",
                 "Mouth",
                 "Smile",
                 "Wild Hair" )
punk.zoom(4).save( "./tmp/bitpunk4@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Eyes",
                 "Nose Small",
                 "Mouth",
                 "Smile",
                 "Wild Hair" )
punk.zoom(4).save( "./tmp/bitpunk4b@4x.png" )
composite << punk


punk = generate( "Male 1-Bit",
                 "Clown Eyes",
                 "Clown Nose",
                 "Mouth",
                 "Smile",
                 "Clown Hair Black" )
punk.save( "./tmp/bitpunk5.png" )
punk.zoom(4).save( "./tmp/bitpunk5@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Heart Eyes",
                 "Mouth",
                 "Nose Small",
                 "Smile" )
punk.zoom(4).save( "./tmp/bitpunk5b@4x.png" )
composite << punk


## try zombie-like
punk = generate( "Male 1-Bit",
                 "Zombie Eyes",
                 "Nose",
                 "Zombie Mouth" )
punk.zoom(4).save( "./tmp/bitpunk6@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Zombie Eyes",
                 "Nose Small",
                 "Zombie Mouth" )
punk.zoom(4).save( "./tmp/bitpunk6b@4x.png" )
composite << punk


## try skeleton-like
punk = generate( "Male 1-Bit",
                 "Skeleton Eyes",
                 "Nose",
                 "Skeleton Mouth" )
punk.zoom(4).save( "./tmp/bitpunk7@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Skeleton Eyes",
                 "Nose Small",
                 "Skeleton Mouth" )
punk.zoom(4).save( "./tmp/bitpunk7b@4x.png" )
composite << punk

## try scream-like
punk = generate( "Male 1-Bit",
                 "Scream Eyes",
                 "Scream Nose",
                 "Scream Mouth" )
punk.zoom(4).save( "./tmp/bitpunk8@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Scream Eyes",
                 "Nose Small",
                 "Scream Mouth" )
punk.zoom(4).save( "./tmp/bitpunk8b@4x.png" )
composite << punk


## try ape-like
punk = generate( "Male 1-Bit",
                 "Ape Front",
                 "Eyes",
                 "Ape Nose",
                 "Ape Mouth" )
punk.zoom(4).save( "./tmp/bitpunk9@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Ape Front",
                 "Eyes",
                 "Ape Nose",
                 "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk9b@4x.png" )
composite << punk

## try alien-like
punk = generate( "Male 1-Bit",
                 "Alien Eyes",
                 "Alien Nose",
                 "Alien Mouth" )
punk.zoom(4).save( "./tmp/bitpunk10@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Alien Eyes",
                 "Nose Up",
                 "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk10b@4x.png" )
composite << punk


punk = generate( "Male 1-Bit",
                 "Headband",
                 "Alien Eyes",
                 "Alien Nose",
                 "Alien Mouth",
                 "Smile Big" )
punk.zoom(4).save( "./tmp/bitpunk11@4x.png" )
composite << punk

punk = generate( "Female 1-Bit",
                 "Headband",
                 "Alien Eyes",
                 "Nose Up",
                 "Mouth",
                 "Smile" )
punk.zoom(4).save( "./tmp/bitpunk11b@4x.png" )
composite << punk






composite.save( "./tmp/bitpunks.png" )
composite.zoom(4).save( "./tmp/bitpunks@4x.png" )


puts "bye"
