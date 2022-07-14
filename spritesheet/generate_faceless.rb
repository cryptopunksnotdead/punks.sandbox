#####################
#  generate punks; to run use:
#
#   $ ruby ./generate_faceless.rb


require 'punks'


specs = Csv.parse( <<TXT )
############################
## try punk(ette) #0
  Female 2 (F), Eyes, Eyebrows, Nose Small, Mouth 2, Green Eye Shadow, Blonde Bob
  Female 2, Green Eye Shadow, Blonde Bob

#############
## try punk #1
  Male 1 (F), Eyes, Eyebrows, Nose, Mouth, Smile, Mohawk
## try "female" style  - w/ nose (small) and face (round)
  Female 1 (F), Eyes, Eyebrows, Nose Small, Mouth 1, Smile 1, Mohawk
  Female 1, Mohawk

#############################
## try punk(ette) #2
  Female 3 (F), Eyes, Eyebrows, Nose Small, Mouth 3, Wild Hair
  Female 3, Wild Hair
# try "male" style
  Male 3 (F), Eyes, Eyebrows, Nose, Mouth, Wild Hair

##############
## try punk #3
  Male 1 (F), Eyes, Eyebrows, Nose, Mouth, Wild Hair, Nerd Glasses, Pipe
# try "female" style
  Female 1 (F), Eyes, Eyebrows, Nose Small, Mouth 1, Wild Hair, Nerd Glasses, Pipe
  Female 1, Wild Hair, Nerd Glasses, Pipe

##########################
## try punk #4
  Male 2 (F), Eyes, Eyebrows, Nose, Mouth, Wild Hair, Big Shades, Earring, Goat
# try "female" style
  Female 2 (F), Eyes, Eyebrows, Nose Small, Mouth 2, Wild Hair, Big Shades, Earring
  Female 2, Wild Hair, Big Shades, Earring
TXT



specs.each_with_index do |attributes,i|
  punk = Punk::Image.generate( *attributes )
  punk.zoom(4).save( "./tmp/faceless/faceless#{i}@4x.png" )
end


puts "bye"
