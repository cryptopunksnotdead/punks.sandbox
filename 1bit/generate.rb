#####################
#  generate 1bit (black & white) punks; to run use:
#
#   $ ruby ./generate.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


punk = Punks::Image.generate( "Male White (F)",
                              "Eyes",
                              "Nose",
                              "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk0@4x.png" )

punk = Punks::Image.generate( "Female White (F)",
                              "Eyes",
                              "Nose Small",
                              "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk0b@4x.png" )


## try adding some black only attributes

punk = Punks::Image.generate( "Male White (F)",
                              "Small Shades",
                              "Nose",
                              "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk1@4x.png" )

punk = Punks::Image.generate( "Female White (F)",
                              "Small Shades",
                              "Nose",
                              "Mouth" )
punk.zoom(4).save( "./tmp/bitpunk1b@4x.png" )


punk = Punks::Image.generate( "Male White (F)",
                              "Regular Shades",
                              "Nose",
                              "Mouth",
                              "Smile",
                              "Top Hat 2" )
punk.zoom(4).save( "./tmp/bitpunk2@4x.png" )

punk = Punks::Image.generate( "Female White (F)",
                              "Regular Shades",
                              "Nose Small",
                              "Mouth",
                              ## "Smile",
                              ## "Top Hat 2"
                              )
punk.zoom(4).save( "./tmp/bitpunk2b@4x.png" )



punk = Punks::Image.generate( "Male White (F)",
                              "Eyes",
                              "Nose",
                              "Mouth",
                              "Smile",
                              "Mohawk Dark" )
punk.zoom(4).save( "./tmp/bitpunk3@4x.png" )

punk = Punks::Image.generate( "Female White (F)",
                              "Eyes",
                              "Nose Small",
                              "Mouth",
                              ## "Smile",
                              "Mohawk Dark" )
punk.zoom(4).save( "./tmp/bitpunk3b@4x.png" )


punk = Punks::Image.generate( "Male White (F)",
                              "Regular Shades",
                              "Nose",
                              "Mouth",
                              "Smile",
                              "Wild Hair" )
punk.zoom(4).save( "./tmp/bitpunk4@4x.png" )

punk = Punks::Image.generate( "Female White (F)",
                              "Regular Shades",
                              "Nose Small",
                              "Mouth",
                              ## "Smile",
                              "Wild Hair" )
punk.zoom(4).save( "./tmp/bitpunk4b@4x.png" )


punk = Punks::Image.generate( "Male White (F)",
                              "Eyes",
                              "Nose",
                              "Mouth",
                              "Smile",
                              "Clown Hair Black" )
punk.zoom(4).save( "./tmp/bitpunk5@4x.png" )

punk = Punks::Image.generate( "Female White (F)",
                              "Eyes",
                              "Nose Small",
                              "Mouth",
                              ## "Smile",
                              "Black Bob" )
punk.zoom(4).save( "./tmp/bitpunk5b@4x.png" )


__END__


############################
## try punk(ette) #0
punk =
punk = Punks::Image.generate( "Female 2",
                              "Green Eye Shadow",
                              "Blonde Bob" )
punk.zoom(4).save( "./tmp/faceless0(small)@4x.png" )



#############
## try punk #1
punk = Punks::Image.generate( "Male 1 (F)",
                              "Eyes",
                              "Eyebrows",
                              "Nose",
                              "Mouth",
                              "Smile",
                              "Mohawk" )
punk.zoom(4).save( "./tmp/faceless1@4x.png" )

## try "female" style  - w/ nose (small) and face (round)
punk = Punks::Image.generate( "Female 1 (F)",
                              "Eyes",
                              "Eyebrows",
                              "Nose Small",
                              "Mouth 1",
                              "Smile 1",
                              "Mohawk" )
punk.zoom(4).save( "./tmp/faceless1b@4x.png" )

punk = Punks::Image.generate( "Female 1",
                              "Mohawk" )
punk.zoom(4).save( "./tmp/faceless1b(small)@4x.png" )


#############################
## try punk(ette) #2
punk = Punks::Image.generate( "Female 3 (F)",
                              "Eyes",
                              "Eyebrows",
                              "Nose Small",
                              "Mouth 3",
                              "Wild Hair" )
punk.zoom(4).save( "./tmp/faceless2@4x.png" )

punk = Punks::Image.generate( "Female 3",
                              "Wild Hair" )
punk.zoom(4).save( "./tmp/faceless2(small)@4x.png" )


# try "male" style
punk = Punks::Image.generate( "Male 3 (F)",
                              "Eyes",
                              "Eyebrows",
                              "Nose",
                              "Mouth",
                              "Wild Hair" )
punk.zoom(4).save( "./tmp/faceless2b@4x.png" )




##############
## try punk #3
punk = Punks::Image.generate( "Male 1 (F)",
                              "Eyes",
                              "Eyebrows",
                              "Nose",
                              "Mouth",
                              "Wild Hair",
                              "Nerd Glasses",
                              "Pipe" )
punk.zoom(4).save( "./tmp/faceless3@4x.png" )


# try "female" style
punk = Punks::Image.generate( "Female 1 (F)",
                              "Eyes",
                              "Eyebrows",
                              "Nose Small",
                              "Mouth 1",
                              "Wild Hair",
                              "Nerd Glasses",
                              "Pipe" )
punk.zoom(4).save( "./tmp/faceless3b@4x.png" )

punk = Punks::Image.generate( "Female 1",
                              "Wild Hair",
                              "Nerd Glasses",
                              "Pipe" )
punk.zoom(4).save( "./tmp/faceless3b(small)@4x.png" )



##########################
## try punk #4
punk = Punks::Image.generate( "Male 2 (F)",
                              "Eyes",
                              "Eyebrows",
                              "Nose",
                              "Mouth",
                              "Wild Hair",
                              "Big Shades",
                              "Earring",
                              "Goat" )
punk.zoom(4).save( "./tmp/faceless4@4x.png" )

# try "female" style
punk = Punks::Image.generate( "Female 2 (F)",
                              "Eyes",
                              "Eyebrows",
                              "Nose Small",
                              "Mouth 2",
                              "Wild Hair",
                              "Big Shades",
                              "Earring" )
punk.zoom(4).save( "./tmp/faceless4b@4x.png" )

punk = Punks::Image.generate( "Female 2",
                              "Wild Hair",
                              "Big Shades",
                              "Earring" )
punk.zoom(4).save( "./tmp/faceless4b(small)@4x.png" )


puts "bye"
