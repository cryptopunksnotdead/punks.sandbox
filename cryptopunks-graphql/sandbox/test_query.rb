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



puts "bye"


__END__

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
     {"block"=>"3918258",
      "date"=>"1498226579",
      "id"=>
       "0x1296a717cd01024fbc5ab9be34bafd86d27c53a87ee0fc875419207c1252f0cc"},
     {"block"=>"3918260",
      "date"=>"1498226595",
      "id"=>
       "0x43ed5747e7b109ca1a11cc69345009d924e094dc38589024383009c2c120e711"},
     {"block"=>"3918285",
      "date"=>"1498226938",
      "id"=>
       "0x8fd559af5b4e6db983d8661bc4a15197f805d1cca46ed937d63a10db131c2062"},
     {"block"=>"3918294",
      "date"=>"1498227130",
      "id"=>
       "0x7c77aa751db2fa037e915cca050dbc349aba8ec4a476cc3c02dfde74a611ac93"},
     {"block"=>"3918314",
      "date"=>"1498227488",
      "id"=>
       "0xebb26f5f531c5035114c605167ff88ecbe9738721b4b6b2e6bcf99edf3fde79d"},
     {"block"=>"3918322",
      "date"=>"1498227649",
      "id"=>
       "0x952e2ff61957be5dcc6a68b9ee073157623c4349a48adfd4922545191d8f4589"},
     {"block"=>"3918384",
      "date"=>"1498228895",
      "id"=>
       "0x249bc6fdf97979676d2ddb66eae8f01520fa4307761544be3506d38394c8edd6"},
     {"block"=>"3918393",
      "date"=>"1498229019",
      "id"=>
       "0xf94470b0dbf88bdf074a27b72959b96181d234bb5d66788e0b7e446cc52c9bc4"}]}}