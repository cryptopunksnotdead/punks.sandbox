require 'pixelart'


names =  %w[
  carmen_miranda
  edith_wharton
  elizabeth_taylor
  nina_simone

  jennifer_aniston
  jo_ann_robinson
  lucy_lady_houston
  montserrat_caballe

  esther_afua_ocloo
  rosa_parks
  shakira
  wangari_maathai
]


punks = ImageComposite.new( 4, 3, background: '#638596' )

names.each do |name|
  punk = Image.read( "./readymades-24x24/#{name}.png" )
  punks << punk
end

punks.save( "./tmp/readymades.png" )
punks.zoom(4).save( "./tmp/readymades@4x.png" )


puts "bye"
