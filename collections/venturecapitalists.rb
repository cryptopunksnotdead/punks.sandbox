require 'pixelart'


names =  %w[
  marc_andreessen
  ben_horowitz

  adam_draper
  alexis_ohanian
  alex_taussig
  alfred_lin
  andrew_reed
  anirudh_pai
  arlan_hamilton
  balajis
  barry_silbert
  blake_robbins
  bobby_goodlatte
  brandon_jacoby
  brianne_kimmel
  bruno_faviero
  chris_cantino
  chris_quinn
  chris_sacca
  curtis_cheng
  darian_shirazi
  elizabeth_yin
  eric_bahn
  gaby_goldberg
  garry_tan
  geoff_lewis
  harry_hurst
  harry_stebbings
  hunter_walk
  ian_kar
  jake_chapman
  jamie_quint
  jason_calacanis
  jd
  jessica_livingston
  jmj
  josh_buckley
  josh_constine
  josh_elman
  josh_kopelman
  julian_shapiro
  justin_kan
  katie_jacobs_stanton
  li_jin
  lolita_taub
  mark_cuban
  masayoshi_son
  matt_mazzeo
  michael_dempsey
  michael_seibel
  michael_sidgmore
  mike_solana
  minal_hasan
  moshe_lifschitz
  naithan_jones
  napoleon_ta
  naval
  niv_sharma
  packy
  paul_graham
  peter_boyce_ii
  peter_thiel
  pomp
  rich_greenfield
  robin_chan
  ryan_hoover
  sahil
  sahil_bloom
  shaan_puri
  sriram_krishnan
  sumeet_singh
  tim_draper
  tim_ferriss
  turner_novak
  vinod_khosla
]


punks = ImageComposite.new( 10, 8 )

names.each do |name|
  punk = Image.read( "./business-I-venture_capitalists-24x24/#{name}.png" )
  punks << punk
end

punks.save( "./tmp/vcs.png" )
punks.zoom(2).save( "./tmp/vcs@2x.png" )
punks.zoom(4).save( "./tmp/vcs@4x.png" )



puts "bye"
