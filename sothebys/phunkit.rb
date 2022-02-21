#####
# to run use:
#
#   $ ruby ./phunkit.rb


require 'pixelart'


###
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


## read in right-facing punk composite
print "==> loading right-facing punk image..."
punks = ImageComposite.read( "../../awesome-24px/collection/punks.png" )
print "OK\n"



def make_lot( punks, ids, background: )
  ###
  #  generate a 104 punks composite in 10x11 grid (cols x rows)
  punkit = ImageComposite.new( 10, 11, background: background )

  ids.each do |id|
    punkit << punks[id].mirror
  end

  punkit
end


### make a 2x2 composite with 4 lots - Phunks V1, V2, V3, V4
phunks = ImageComposite.new( 2, 2, width: 24*10, height: 24*11 )

phunks << make_lot( punks, ids, background: '#a79aff' )  # V1 - lavender?
phunks << make_lot( punks, ids, background: '#638596' )  # V2 - larva gray?
phunks << make_lot( punks, ids, background: '#60a4f7' )  # V3 - baby blue?
phunks << make_lot( punks, ids, background: '#9b59b6' )  # V4



phunks.save( "./tmp/phunks.png" )
phunks.zoom(4).save( "./tmp/phunks@4x.png" )


puts "bye"
