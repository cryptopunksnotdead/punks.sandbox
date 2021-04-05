
module Cryptopunks
module GraphQL

  class Client

def query_transactions( first: 1000,
                        last_date: '1498017600'    # approximate time of the first cryptopunk transaction
                      )
  query = <<GRAPHQL
   {
      transactions(  first:   $first,
                     orderBy: date,
                     where: { date_gte: $last_date,
                              punk_not: "" } )
         {
             id
             date
             block    # done
         }
   }
GRAPHQL
  query = query.gsub( '$first',     first.to_s )
  query = query.gsub( '$last_date',  %Q<"#{last_date}"> )  ## note: date is defined as BigInt in GraphQL schema (returned in json as string)

   data = query( query )
   data['data']['transactions']
end
alias_method :query_txns, :query_transactions


def query_transaction_details( block:, id:, date: )
  query = <<GRAPHQL
  {
      transactions( block: { number: $block},
                    orderBy: date,
                    where: { id: $id,
                             date: $date,
                             punk_not: ""})
      {
            id
            owner{
             id
             punk
            }
            ctoken
            punkTransfers
            punk {
             id
             owner{
               id
             }
             transferedTo
             assignedTo{
               id
             }
             purchasedBy{
               id
             }
             bid{
              bid
              transaction{
                  block
              }
             }
             offer{
               id
               amountOffered
             }
             purchase{
              amount
              seller
              id
             }
             punkTransfer
            }
            assigned
            offer
            {
             id
             offeredBy
             amountOffered
            }

            bid #done
            {
             id
             owner
             punk
             bidder
             bid
             transaction{
                  block
              }
            }
            date   # done
            block  # done
        }
  }
GRAPHQL
  query = query.gsub( '$block', block.to_s )
  query = query.gsub( '$id',    %Q<"#{id}"> )    ## note: id is defined as BigInt in GraphQL schema (returned in json as string)
  query = query.gsub( '$date',  %Q<"#{date}"> )  ## note: date is defined as BigInt in GraphQL schema (returned in json as string)

  data = query( query )
  data['data']['transactions']
end
alias_method :query_txn_details, :query_transaction_details




    #####
    #  generic query via HTTP POST
    BASE_URL = 'https://api.thegraph.com/subgraphs/name/itsjerryokolo/cryptopunks'

    def query( query, includes: [] )
      if includes.size > 0
        ## check for end-of-line comments with @INCLUDES marker
         query = query.gsub( /[#]+[ ]+@INCLUDES[^\n\r]+/,
                               includes.join( ' ' ) )
      end

      res = Webclient.post( BASE_URL, json: {
                                        query: query } )

      if res.status.nok?   ## e.g. != 200
        puts "!! ERROR: HTTP #{res.status.code} #{res.status.message}:"
        pp res.raw ## note: dump inner (raw) response (NOT the wrapped)
        exit 1
      end

      res.json  ## return body (utf-8 enconded text) parsed as json
    end
  end # class Client
end # module GraphQL
end # module Cryptopunks


