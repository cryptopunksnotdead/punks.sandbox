####
# use:
#  $ ruby -I ./lib sandbox/test_query.rb


require 'cryptopunks/graphql'



c = Cryptopunks::GraphQL::Client.new


query = <<GRAPHQL
{
  transactions(first: 10, orderBy: date) {
    id
    date
    block
  }
}
GRAPHQL

data = c.query( query )
pp data
puts "---"
sleep(1)


data = c.query_txns( first: 10 )
pp data
puts "---"
sleep(1)


data = c.query_txn_details( block: '3919706',
                            id:    '0xb28b5f2c186bf534e4fc4b8604b1496c9632e42269424f70ef1bdce61ea8ba52',
                            date: '1498251906' )
pp data


puts "bye"

