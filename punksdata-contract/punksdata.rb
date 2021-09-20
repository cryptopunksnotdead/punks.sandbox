
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

