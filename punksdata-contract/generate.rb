############
#  generate punks using the CryptoPunksData (offline and offchain)
#
#  to run use:
#    $ ruby ./generate.rb



require 'pixelart'

require_relative '../punksdata/punksdata'        ## pull in colors & assets
require_relative '../punksdata/punksdata-meta'   ## pull in meta (data records)



 class CryptoPunksData

   def meta
     ## get all meta data records for all 10 000 punks
     @@meta ||= decode_meta( META_ENCODED )
   end

   def colors
     ## get all 120 colors
     @@colors ||= decode_colors( COLORS_ENCODED )
   end

   def asset_image( id )
     ## generate assets on-demand (and cache on first use)
     ##   note: ASSETS_ENCODED array is zero-based; subtract -1 to start with zero (not one)
     @@assets ||= {}
     @@assets[ id ] ||= decode_image( ASSETS_ENCODED[ id-1 ][:hex], colors: colors )
   end


    def generate_image( *ids_or_attributes )
      ids = if ids_or_attributes.size == 1 &&
               ids_or_attributes[0].is_a?( String )  ## assume comma-separated attribute string
              parse( ids_or_attributes[0] )
            else
               ids_or_attributes   ## assume array of ids
            end

      punk = Image.new( 24, 24 )

      ids.each do |id|
        punk.compose!( asset_image( id ))
      end

      punk
    end
    alias_method :generate, :generate_image


    def punk_image( id_or_hex )
      asset_nums = if id_or_hex.is_a?( String )
                     decode( id_or_hex )  ## assume hexstring e.g. '0x067d7a7e00000000'
                   else
                     meta[ id_or_hex ]  ## assume id - integer number e.g. 0,1,2,
                   end
      generate_image( *asset_nums )
    end
    alias_method :image, :punk_image
    alias_method :[],    :punk_image


    #####
    # Bonus: add punk_attributes

    def asset_name( id )
      ##   note: ASSETS_ENCODED array is zero-based; subtract -1 to start with zero (not one)
      ASSETS_ENCODED[ id-1 ][:name]
    end

    def punk_attributes( id_or_hex )
      ## comma-separated values / attribute list in a string
      asset_nums = if id_or_hex.is_a?( String )
                     decode( id_or_hex )  ## assume hexstring e.g. '0x067d7a7e00000000'
                   else
                     meta[ id_or_hex ]  ## assume id - integer number e.g. 0,1,2,
                   end

      asset_nums.map { |num| asset_name( num ) }.join( ', ' )
    end
    alias_method :attributes, :punk_attributes


    ###
    # more helpers
    def decode( hex )    ## pass in 8-byte hexstring for meta data record
       ## note: allow spaces and newlines in hexstring for formatting
        hex = hex.gsub( /[ \n]/, '' )
        hex = hex.sub( /^0x/i, '' )  #  note allow optional leading 0x | 0X

        ## convert hex string to byte array, that is, array of integer numbers
        ##   e.g.  067d7a7e00000000    (0x06 / 0x7d / 0x7a / 0x7e / 0x00 / 0x00 ..)
        ##     =>  [6, 125, 122, 126, 0, 0, 0, 0]
        a = [hex].pack("H*").unpack('C*')

        ## filter out (trailing) zeros (0)
        a = a.filter { |num| num != 0 }
        a
    end

    def to_id( hex_or_attributes )  ## reverse lookup; find id (index); note: returns nil if not found
       a =  if hex_or_attributes =~ /^[0-9a-fx]+$/i
                  decode( hex_or_attributes )
               else
                 parse( hex_or_attributes )
               end
      meta.index( a )
    end


    def normalize_key( str )
      str.downcase.gsub(/[ _-]/, '').strip
    end

    def build_assets_by_name
      h = {}
      ASSETS_ENCODED.each do |rec|
        id        = rec[:id]
        name      = rec[:name]
        qualifier = rec[:qualifier]

        key = normalize_key( name )
        key << "_(#{qualifier})"  if qualifier

        h[ key ] = id
      end
      pp h
      h
    end

    def to_asset_id( q, qualifier: nil )  ## qualifier (m/f) required for attributes!!!
      @@assets_by_name ||= build_assets_by_name

      key = normalize_key( q )  ## normalize q(uery) string/symbol
      key << "_(#{qualifier.downcase[0]})"  if qualifier

      id = @@assets_by_name[ key ]
      puts " lookup >#{key}< => #{id}"
      id
    end


    def parse( str )
       # try "Male 1, Mole, Gold Chain, Luxurious Beard, Headband, Eye Patch"
       values = str.split( "," )

       type = values[0]
       type_id = to_asset_id( normalize_key( type ))
       qualifier = if [5,6,7,8].include?( type_id )
                     'f'
                   else
                     'm'
                   end

       ids = [type_id]

       attributes = values[1..-1]
       attributes.each do |attribute|
         ids << to_asset_id( normalize_key( attribute ), qualifier: qualifier )
       end

       ids
    end

end  # class  CryptoPunksData



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

