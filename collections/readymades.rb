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

punks.save( "./tmp/readymades-vol1.png" )
punks.zoom(4).save( "./tmp/readymades-vol1@4x.png" )



names =  %w[
  oprah_winfrey
  jane_goodall
  joan_baez
  mary_j_blige

  diane_keaton
  michelle_obama
  susan_sontag
  shonda_rhimes

  toni_morrison
  virginia_woolf
  zora_neale_hurston
  vanessa_redgrave
]

punks = ImageComposite.new( 4, 3, background: '#638596' )

names.each do |name|
  punk = Image.read( "./readymades-24x24/#{name}.png" )
  punks << punk
end

punks.save( "./tmp/readymades-vol2.png" )
punks.zoom(4).save( "./tmp/readymades-vol2@4x.png" )


puts "bye"
