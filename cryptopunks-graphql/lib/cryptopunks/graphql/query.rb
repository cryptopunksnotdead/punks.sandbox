
module Cryptopunks
module GraphQL

  class Client < ::Cryptopunks::Client
    def initialize
      super( base_uri: 'https://api.thegraph.com/subgraphs/name/itsjerryokolo/cryptopunks' )
    end


    #####
    #  generic query via HTTP POST
    def query( query, includes: [] )
      if includes.size > 0
        ## check for end-of-line comments with @INCLUDES marker
         query = query.gsub( /[#]+[ ]+@INCLUDES[^\n\r]+/,
                               includes.join( ' ' ) )
      end

      post( query: query )
    end


  end # class Client
end # module GraphQL
end # module Cryptopunks


