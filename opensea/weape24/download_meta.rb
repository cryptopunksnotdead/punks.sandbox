#####
# to run use:
#   $ ruby weape24/download_meta.rb


require_relative '../helper'





# https://opensea.io/collection/weape24

collection = 'weape24'
# range =  (8001..9899) # (5001..8000)   # (911..999) ##(0..999)   # 9900 items
range = (0..9899)   # 9900 items


download_meta( range, collection )

puts "bye"

