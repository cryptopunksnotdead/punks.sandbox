############
#  generate punks using the CryptoPunksData (offline and offchain)
#
#  to run use:
#    $ ruby ./generate.rb


require_relative './punksdata'




punks = CryptoPunksData.new      # start up the "offline" contract


# get punk #0 (as an image)
punk = punks[ 0 ]  #  same as punks.punk_image( 0 ) or punks.image( 0 )
punk.save( "./i/punk-0000.png" )
punk.zoom(4).save( "./i/punk-0000x4.png" )

# lookup meta (data record) and attributes
pp punks.meta[ 0 ]               #=> [6, 125, 122, 126]
pp punks.punk_attributes( 0 )    #=> "Female 2, Earring, Blonde Bob, Green Eye Shadow"


# get punk #2890 (as an image)
punk = punks[ 2890 ]
punk.save( "./i/punk-2890.png" )
punk.zoom(4).save( "./i/punk-2890x4.png" )

pp punks.meta[ 2890 ]            #=> [11, 38]
pp punks.punk_attributes( 2890 ) #=> "Alien, Cap"


# get punk #2890 (as an image)
punk = punks[ 8219 ]
punk.save( "./i/punk-8219.png" )
punk.zoom(4).save( "./i/punk-8219x4.png" )

pp punks.meta[ 8219 ]            #=>  [10, 22]
pp punks.punk_attributes( 8219 ) #=> "Ape, Knitted Cap"


###
# more - use 8-byte hexstring
pp punks.decode( '0x067d7a7e00000000' ) #=> [6, 125, 122, 126]
pp punks.punk_attributes( '0x067d7a7e00000000' )  #=> "Female 2, Earring, Blonde Bob, Green Eye Shadow"

pp punks.decode( '0117261400000000' )
pp punks.punk_attributes( '0117261400000000' )


punk = punks.punk_image( '0x067d7a7e00000000' )
punk.zoom(4).save( "./tmp/punk-067d7a7e00000000x4.png" )


pp punks.punk_attributes( '011b440d3f2c0000' )
#=> "Male 1, Mole, Gold Chain, Luxurious Beard, Headband, Eye Patch"
punk = punks.punk_image( '011b440d3f2c0000' )
punk.zoom(4).save( "./tmp/punk-011b440d3f2c0000x4.png" )

punk = punks.punk_image( '0117261400000000' )
punk.zoom(4).save( "./tmp/punk-0117261400000000x4.png" )



punk = punks.generate( 6, 125, 122, 126 )
punk.zoom(4).save( "./tmp/punk-6-125-122-126x4.png" )

punk = punks.generate( 11, 38 )
punk.zoom(4).save( "./tmp/punk-11-38x4.png" )


## reverse lookup to find index
pp punks.to_id( '0x067d7a7e00000000' )   #=> 0
pp punks.to_id( '011b440d3f2c0000' )     #=> 9819
pp punks.to_id( '0117261400000000' )     #=> 9993


## find assset ids by name
pp punks.to_asset_id( 'MALE 1' ) #=> 1
pp punks.to_asset_id( 'MALE 2' ) #=> 2

pp punks.to_asset_id( 'FEMALE 1' ) #=> 5
pp punks.to_asset_id( 'FEMALE 2' ) #=> 6


pp punks.to_asset_id( 'ZOMBIE' ) #=> 9
pp punks.to_asset_id( 'APE' )    #=> 10
pp punks.to_asset_id( 'ALIEN' )  #=> 11


### note: attributes require f/m qualifier (first letter only counts)
pp punks.to_asset_id( 'HEADBAND', qualifier: 'F' ) #=> 110
pp punks.to_asset_id( 'HEADBAND', qualifier: 'M' ) #=> 63

pp punks.to_asset_id( 'HEADBAND', qualifier: 'FEMALE' ) #=> 110
pp punks.to_asset_id( 'HEADBAND', qualifier: 'MALE' )   #=> 63

pp punks.to_asset_id( 'Earring',   qualifier: 'f' ) #=> 125
pp punks.to_asset_id( 'Blonde Bob', qualifier: 'f' ) #=> 122

pp punks.parse( "Male 1, Mole, Gold Chain, Luxurious Beard, Headband, Eye Patch" )
#=> [1, 27, 68, 13, 63, 44]

pp punks.parse( "Male 2, Silver Chain, Luxurious Beard, Headband, Eye Patch" )
#=> [2, 33, 13, 63, 44]

punk = punks.generate( "Male 1, Mole, Gold Chain, Luxurious Beard, Headband, Eye Patch" )
punk.zoom(4).save( "./tmp/punk-gen1x4.png" )

punk = punks.generate( "Male 2, Silver Chain, Luxurious Beard, Headband, Eye Patch" )
punk.zoom(4).save( "./tmp/punk-gen2x4.png" )

punk = punks.generate( "Ape, Knitted Cap, Regular Shades" )
punk.zoom(4).save( "./tmp/punk-gen3x4.png" )

punk = punks.generate( "Alien, Knitted Cap, Regular Shades" )
punk.zoom(4).save( "./tmp/punk-gen5x4.png" )


## reverse lookup to find index
##   note: MUST use same attribute order to make it work!!!!!
pp punks.to_id( "Male 1, Mole, Gold Chain, Luxurious Beard, Headband, Eye Patch" )   #=> 9819
pp punks.to_id( "Ape, Knitted Cap" )     #=> 8219
pp punks.to_id( "Ape, Knitted Cap, Regular Shades" )     #=> nil (not found)


puts "bye"
