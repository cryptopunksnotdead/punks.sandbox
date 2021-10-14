

class CryptopunksData    ## check - change class to a module - why? why not?


  def self.meta
    ## get all meta data records for all 10 000 punks
    @meta ||= decode_meta( META_ENCODED )
  end

  def self.assets
    @assets ||= ASSETS_ENCODED.sort { |l,r|  l[:id] <=> r[:id] }
  end



   def self.punk_attributes( id )
     ## comma-separated values / attribute list in a string
     asset_nums = meta[ id ]  ## id - integer number e.g. 0,1,2,

     asset_nums.map do |num|
        ##   note: ASSETS_ENCODED array is zero-based; subtract -1 to start with zero (not one)
        assets[ num-1 ][:name]
     end
   end

   class << self
     alias_method :attributes, :punk_attributes
   end


   ###
   # more helpers
   def self.decode_meta( hex )
    recs = []

    ## note: allow spaces and newlines in hexstring for formatting
    hex = hex.gsub( /[ \n]/, '' )

    ## convert hex string to byte array, that is, array of integer numbers
    ##   e.g.  067d7a7e00000000    (0x06 / 0x7d / 0x7a / 0x7e / 0x00 / 0x00 ..)
    ##     =>  [6, 125, 122, 126, 0, 0, 0, 0]
    a = [hex].pack("H*").unpack('C*')

    a.each_slice( 8 ).with_index do |attributes,i|
      ## filter out (trailing) zeros (0)
      attributes = attributes.filter { |num| num != 0 }
      ## puts "#{i} => #{attributes.inspect}"

      recs << attributes
    end
    recs
  end
end  # class  CryptopunksData

