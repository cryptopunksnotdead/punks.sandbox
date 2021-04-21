# Cryptopunks GraphQL


cryptopunks-graphql - web client (helpers) for using Cryptopunks (HTTP JSON) GraphQL APIs


* home  :: [github.com/cryptopunksnotdead/cryptopunks](https://github.com/cryptopunksnotdead/cryptopunks)
* bugs  :: [github.com/cryptopunksnotdead/cryptopunks/issues](https://github.com/cryptopunksnotdead/cryptopunks/issues)
* gem   :: [rubygems.org/gems/cryptopunks-graphql](https://rubygems.org/gems/cryptopunks-graphql)
* rdoc  :: [rubydoc.info/gems/cryptopunks-graphql](http://rubydoc.info/gems/cryptopunks-graphql)




## Usage


A lite web client wrapper for the Cryptopunks open graph api
powered by the Graph.
See [**thegraph.com/explorer/subgraph/itsjerryokolo/cryptopunks »**](https://thegraph.com/explorer/subgraph/itsjerryokolo/cryptopunks).


``` ruby
require 'cryptopunks/graphql'

c = Cryptopunks::GraphQL::Client.new

data = c.query( <<GRAPHQL )
{
  transactions(first: 10, orderBy: date) {
    id
    date
    block
  }
}
GRAPHQL
```


resulting in:

``` ruby
{"data"=>
  {"transactions"=>
    [{"block"=>"3918216",
      "date"=>"1498225851",
      "id"=>
       "0xdcc2d338ae2a0154ac0c50b8836fe96e7e8f17a2ccc291dd418467d7022e3aa4"},
     {"block"=>"3918253",
      "date"=>"1498226485",
      "id"=>
       "0xcdfbe42b67adfc3234951c6795371380ba843554fef7612431750dcd874e34ee"},
     #...
    ]
  }
}
```


Or use pre-configured / built-in queries. Example:


``` ruby
data = c.query_txn_details(
            block: '3919706',
            date:  '1498251906',
            id:    '0xb28b5f2c186bf534e4fc4b8604b1496c9632e42269424f70ef1bdce61ea8ba52'
          )
```

resulting in:

``` ruby
[{"assigned"=>nil,
  "bid"=>nil,
  "block"=>"3919706",
  "ctoken"=>nil,
  "date"=>"1498251906",
  "id"=>"0xb28b5f2c186bf534e4fc4b8604b1496c9632e42269424f70ef1bdce61ea8ba52",
  "offer"=>nil,
  "owner"=>{"id"=>"0x0000000000000000000000000000000000000000", "punk"=>{}},
  "punk"=>
   {"assignedTo"=>{"id"=>"0xc352b534e8b987e036a93539fd6897f53488e56a"},
    "bid"=>[{"bid"=>"10000000000000000", "transaction"=>{"block"=>"3919706"}}],
    "id"=>"544",
    "offer"=>[{"amountOffered"=>nil, "id"=>"544"}],
    "owner"=>{"id"=>"0x0000000000000000000000000000000000000000"},
    "punkTransfer"=>[],
    "purchase"=>
     [{"amount"=>"0",
       "id"=>"544",
       "seller"=>"0xc352b534e8b987e036a93539fd6897f53488e56a"}],
    "purchasedBy"=>{"id"=>"0x0000000000000000000000000000000000000000"},
    "transferedTo"=>nil},
  "punkTransfers"=>nil}]
```



## New to Cryptopunks?

See the
[**Programming Programming CryptoPunks & Copypastas Step-by-Step Booklet / Guide »**](https://github.com/cryptopunksnotdead/programming-cryptopunks)




## Install

Just install the gem:

    $ gem install cryptopunks-graphql


## License

The scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.



