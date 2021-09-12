################
# test meta data about 10000 punks in CryptoPunksData format
#
#  to run use:
#    ruby ./meta.rb


require_relative '../punksdata/punksdata-meta'


hex = META_ENCODED
recs = decode_meta( hex )

puts " #{recs.size} record(s)"

pp recs[0]     #=> [6, 125, 122, 126]
pp recs[9999]  #=> [5, 123, 89]


##################
##  statistics example 1 - count by head type (male, female, zombie, ape, alien)

count = Hash.new(0)
recs.each do |rec|
   type = rec[0]
   count[ type ] += 1
end


puts "count:"
pp count
#=> {  1 => 1723,
#      2 => 1857,
#      3 => 1861,
#      4 => 598,
#      5 => 1101,
#      6 => 1174,
#      7 => 1145,
#      8 => 420,
#      9 => 88,
#     10 => 24,
#     11 => 9 }

puts
puts "males: #{count[1]+count[2]+count[3]+count[4]}"    #=> males: 6039
puts "females: #{count[5]+count[6]+count[7]+count[8]}"  #=> females: 3840
puts "zombies: #{count[9]}"                             #=> zombies: 88
puts "apes: #{count[10]}"                               #=> apes: 24
puts "aliens: #{count[11]}"                             #=> aliens: 9


########################
## statistics example 2-  count by attribute count (0,1,2,3,...)

count = Hash.new(0)
recs.each do |rec|
   attributes = rec[1..-1]
   count[ attributes.size ] += 1
end

puts "count:"
pp count
#=> { 0 => 8,
#     1 => 333,
#     2 => 3560,
#     3 => 4501,
#     4 => 1420,
#     5 => 166,
#     6 => 11,
#     7 => 1 }

puts "bye"
