#####################
#  generate 1bit (black & white) punks; to run use:
#
#   $ ruby ./generate.rb


###
# todo/fix:
#   - change eyes small to eyes !!!  (delete eyes)
#   - up heart shades (remove  white frame!!!)
#   - up pipe and cigarette  (add smoke in black!!!)
#   - up clown eyes (add white pix)
#
#  redo skeleton
#  - add skeleton eyes
#    add skeleton mouth
# redo scream
#  - add scream eyes
#  - add scream mouth
#  - add scream nose


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



punk = generate( "Male 1-Bit",
                 "Eyes Small",
                 "Nose",
                 "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk0@4x.png" )

punk = generate( "Female 1-Bit",
                 "Eyes Small",
                 "Nose Small",
                 "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk0b@4x.png" )

punk = generate( "Male 1-Bit",
                 "Eyes",
                 "Nose",
                 "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk0(ii)@4x.png" )

punk = generate( "Female 1-Bit",
                 "Eyes",
                 "Nose",
                 "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk0b(ii)@4x.png" )




## try adding some black only attributes

punk = generate( "Male 1-Bit",
                 "Small Shades",
                 "Nose",
                 "Mouth",
                 "Cap Forward",
                 "Pipe" )
punk.zoom(4).save( "./tmp/bitpunk1@4x.png" )

punk = generate( "Female 1-Bit",
                  "Small Shades",
                  "Nose Small",
                 "Mouth",
                 "Cap Forward",
                 "Pipe" )
punk.zoom(4).save( "./tmp/bitpunk1b@4x.png" )


punk = generate( "Male 1-Bit",
                  "Regular Shades",
                  "Nose",
                  "Mouth",
                  "Smile",
                  "Top Hat" )
punk.zoom(4).save( "./tmp/bitpunk2@4x.png" )

punk = generate( "Female 1-Bit",
                  "Regular Shades",
                  "Nose Small",
                  "Mouth",
                  "Smile",
                  "Top Hat" )
punk.zoom(4).save( "./tmp/bitpunk2b@4x.png" )



punk = generate( "Male 1-Bit",
                 "Laser Eyes",
                 "Nose",
                 "Mouth",
                 "Smile",
                 "Earring",
                 "Mohawk" )
punk.zoom(4).save( "./tmp/bitpunk3@4x.png" )

punk = generate( "Female 1-Bit",
                 "Laser Eyes",
                 "Nose Small",
                 "Mouth",
                 "Smile",
                 "Earring",
                 "Mohawk" )
punk.zoom(4).save( "./tmp/bitpunk3b@4x.png" )


punk = generate( "Male 1-Bit",
                 "Eyes Small",
                 "Nose",
                 "Mouth",
                 "Smile",
                 "Wild Hair" )
punk.zoom(4).save( "./tmp/bitpunk4@4x.png" )

punk = generate( "Female 1-Bit",
                 "Eyes Small",
                 "Nose Small",
                 "Mouth",
                 "Smile",
                 "Wild Hair" )
punk.zoom(4).save( "./tmp/bitpunk4b@4x.png" )


punk = generate( "Male 1-Bit",
                 "Clown Eyes",
                 "Clown Nose",
                 "Mouth",
                 "Smile",
                 "Clown Hair Black" )
punk.save( "./tmp/bitpunk5.png" )
punk.zoom(4).save( "./tmp/bitpunk5@4x.png" )

punk = generate( "Female 1-Bit",
                 "Eyes",
                 "Heart Shades",
                 "Mouth",
                 "Nose Small",
                 "Smile" )
punk.zoom(4).save( "./tmp/bitpunk5b@4x.png" )




puts "bye"
