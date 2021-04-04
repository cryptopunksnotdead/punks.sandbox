
module Cryptopunks
  class Client


    def initialize( base_uri: )
      @base_uri = base_uri
    end

    def post( **params )

      uri = URI.parse( @base_uri )
      res = Net::HTTP.start( uri.host, uri.port,
                             use_ssl: true) do |http|
              req = Net::HTTP::Post.new( uri )
              req['Content-Type'] = 'application/json'

              # note: the body needs to be a JSON string
              req.body = JSON.generate( params )

              # puts
              # puts "graphql post:"
              # puts req.body
              # puts "---"

              http.request( req )
           end

        if res.code.to_i != 200
            puts "!! ERROR: HTTP #{res.code} #{res.message}:"
            pp res
            exit 1
        end

      body = res.body.to_s
      ## note: assumes ascii-8bit/binary encoding (by default)
      ##   change to utf-8  (as always required by json )
      body = body.force_encoding( Encoding::UTF_8 )

      data = JSON.parse( body )
  end
end # class Client
end # module Cryptopunks
