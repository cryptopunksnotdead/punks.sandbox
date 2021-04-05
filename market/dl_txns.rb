require 'cryptopunks/graphql'


def load_state
  if File.exist?( './state.json' )   # Starting from existing transaction list"
    text = File.open( './state.json', 'r:utf-8') { |f| f.read }
    state = JSON.parse( text )
  else
    puts "Initializing new transaction list"
    state = {
      'd'           =>  '1498017600',    # approximate time of the first cryptopunk transaction
      'txns'        => [],
      'txn_details' => []
    }
  end
end

def save_state( state )
  File.open( './state.json', 'w:utf-8') do |f|
    f.write( JSON.pretty_generate( state ))
  end
end



def dedup( txns )
  clean_txns = []
  all_ids = {}

  txns.each do |txn|
     id = txn['id']
     next if all_ids.has_key?( id )

     clean_txns << txn
     all_ids[ id ] = true
  end
  clean_txns
end



def get_latest_txns
  state = load_state
  d     = state['d']
  txns  = state['txns']

  puts "So far have %d txns. Getting all new txns since %d" % [txns.size ,d]

  c = Cryptopunks::GraphQL::Client.new

  first = 1000    ## in batches of 1000 or such (using first: query param)
  loop do
      # Note: using gte here can result in duplicates since we will probably get
      # the final transaction at t-1 at the beginning of our query at time t.
      # but if we use gt, then there is a very small chance we can miss transactions.
      # this would happen if a block has multiple punk transactions and
      # and it so happens that this block occupies the last block in a group of 1000 txns

      data = c.query_txns( first:     first,
                           last_date: d      ## note: date is defined as BigInt in GraphQL schema (returned in json as string)
                         )

      d = data[-1]['date']
      puts "First date was %s and last date was %s" % [data[0]['date'], d]

      txns += data

      puts "Extended txns by %d for a total of %d" % [data.size, txns.size]
      break  if data.size <  1000

      sleep(1)   # avoid being throttled
  end

  txns = dedup( txns )

  puts "After deduplication, got %d transactions" % txns.size

  state['d']    = d
  state['txns'] = txns
  save_state( state )

  txns
end



def get_latest_txn_details
  state = load_state
  txns        = state['txns']
  txn_details = state['txn_details']

  puts "We have details on %d of %d txns. Getting new ones" % [txn_details.size, txns.size]


   c = Cryptopunks::GraphQL::Client.new

   ## for i in range(len(txn_details),len(txns))
   ##   note: use ... (three dots NOT two dots) - excludes (not includes) LAST element e.g. 0..4 (0/1/2/3 BUT NOT 4)
   (txn_details.size...txns.size).each do |i|
      txn = txns[i]

      data = c.query_txn_details( block: txn['block'],
                                  id:    txn['id'],     ## note: id is defined as BigInt in GraphQL schema (returned in json as string)
                                  date:  txn['date']    ## note: date is defined as BigInt in GraphQL schema (returned in json as string)
                                )
      ## puts "response:"
      ## puts JSON.pretty_generate( data )[0..400]
      ## puts

      if i % 200 == 0
          puts "Checkpointing at %d" % i
          state['txn_details'] = txn_details
          save_state( state )
      end

      if data.size != 1
        puts "!! ERROR: expected only one transaction in query result; got #{data.size}:"
        pp data
        exit 1
      end

      txn_details << data[0]
      puts "  #{txn_details.size} - block: #{txn['block']}, date: #{txn['date']}"

      sleep(1)   # avoid being throttled
  end

  state['txn_details'] = txn_details
  save_state( state )

  txn_details
end


get_latest_txns
get_latest_txn_details


puts "bye"


