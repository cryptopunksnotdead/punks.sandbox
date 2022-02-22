
require_relative './punksdata'


punks = CryptoPunksData.new      # start up the "offline" contract


###
# write out meta data for sotheby's punk it! lot - 104 punks
#
#  see https://cryptopunksnotdead.github.io/punkweek/2022-02-08-sothebys-punk-it-historic-conart-fraud
#  see https://www.sothebys.com/en/buy/auction/2022/punk-it/104-cryptopunks


## 104 punks in 1 lot
ids = [
  239,   352,  729,

  1054, 1563, 1645, 1761, 1769, 1804,

  2008, 2046, 2127, 2174, 2235, 2401, 2517, 2529, 2547, 2697,
  2699, 2710, 2714, 2727, 2782, 2822, 2956, 2959, 2994,

  3003, 3103, 3315, 3568, 3662, 3667, 3753, 3762, 3853, 3864,
  3877, 3912, 3949, 3965,

  4152, 4171, 4190, 4204, 4399, 4634, 4756, 4824, 4826, 4950,
  4994, 4996,

  5117, 5338, 5441, 5481, 5629, 5731, 5751,

  6004, 6008, 6379, 6506, 6509, 6688, 6698, 6734, 6777, 6888,
  6933,

  7080, 7104, 7165, 7350, 7351, 7377, 7509, 7556, 7646, 7662,
  7919, 7989,

  8199, 8237, 8372, 8399, 8408, 8436, 8495, 8501, 8548, 8798,
  8807,

  9065, 9087, 9301, 9319, 9353, 9451, 9521, 9616, 9795,
]


puts "  #{ids.size} id(s)"   #=> 104 id(s)


##
## note: lot includes NO 7-attribute, 6-attribut,  5-attribute punks
##          at most 4-attribute punks


ids.each do |id|
  values = punks.punk_attributes( id ).split( /[ ]*,[ ]*/ )

  print id
  print ", "
  print values.join(', ')
  print "," * (5-values.size)
  print "\n"
end

puts "bye"


