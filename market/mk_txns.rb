require 'json'
require 'pp'
require 'date'
require 'time'
require 'fileutils'


def get_prices
  text = File.open( './state.json', 'r:utf-8') { |f| f.read }
  state = JSON.parse( text )
  txn_details = state['txn_details']

  bids = {}
  offers = {}

  recs=[]
  txn_details.each do |txn|
      next  if txn['punk'].nil?

      if txn['punk']['purchase'].nil?
          puts "No sale:"
          pp txn
          next
      end

      # we have a punk field and punk[purchase] field
      punkid   = txn['punk']['id']
      purchase = txn['punk']['purchase']
      amount   = purchase[0]['amount'].to_i
      if amount == 0
         bid = txn['punk']['bid']
         if bid.size == 0  # These were weird transactions where the punk was offerd for 0(?)
            amount = 0
         else
            amount = bid[0]['bid'].to_i
         end
      end

      to   = txn['punk']['owner']['id']   ## use a different way to get new owner?
      from = purchase[0]['seller']    ## use a different way to get old owner (seller)?
      ##print("At {} on {} Punk {} sold for {}Ξ".format,thisdate,punkid,price))

      recs << [  txn['date'].to_i,
                 punkid.to_i,
                 amount,
                 from,
                 to,
                 txn['block'].to_i,
                 txn['id']
              ]
    end
    recs
end


recs = get_prices
pp recs[0..9]

puts " #{recs.size} record(s)"


events = {}   ## get recs by year / month / day

wei_per_eth = 1_000_000_000_000_000_000 ## wei (10^18)

recs.each_with_index do |old_rec,i|
   time = Time.at( old_rec[0].to_i ).utc

   year  = events[ time.year ] ||= { }
   month = year[ time.month] ||= {}
   day   = month[ time.day ] ||= []

   rec = []
   rec << time.to_s
   rec << old_rec[1]   ## id

   if old_rec[2] == 0   ## gift / donation transfer?
      rec << '-'
      rec << '-'
   else
      eth = Float(old_rec[2]) / Float(wei_per_eth)
      rec << ('%f' % eth)   ## price (in eth)
      rec << old_rec[2]     ## price (in wei)
   end

   rec << old_rec[3]   ## from
   rec << old_rec[4]   ## to
   rec << old_rec[5]   ## block (number)
   rec << old_rec[6]   ## txn (id)

   day << rec
end



def save_records( path, recs, columns: )
  FileUtils.mkdir_p( File.dirname( path ) ) unless Dir.exist?( File.dirname( path ) )

  File.open( path, 'w:utf-8') do |f|
    f.write( columns.join( ', ' ))
    f.write( "\n")

    recs.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n")
    end
  end
end


events.each do |year,months|
   puts "==> year: #{year}"
   months.each do |month, days|
     puts "    month: #{month}"
     days.each do |day, recs|

       puts "       #{day} -  #{recs.size} record(s)"

       path = "./o/sales/#{year}/#{'%02d' % month}/#{year}-#{'%02d' % month}-#{'%02d' % day}_(#{recs.size}).csv"
       save_records( path, recs,
                     columns: ['timestamp',
                               'id',
                               'price (in eth)',
                               'price (in wei)',
                               'from',
                               'to',
                               'block',
                               'tx'] )

       recs = recs.map {|rec| rec[0,4] }    ## kee first four columns; cut-off rest
       path = "./o/prices/#{year}/#{'%02d' % month}/#{year}-#{'%02d' % month}-#{'%02d' % day}_(#{recs.size}).csv"
       save_records( path, recs,
                     columns: ['timestamp',
                               'id',
                               'price (in eth)',
                               'price (in wei)'] )
     end
   end
 end


 puts "bye"
