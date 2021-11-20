#####
# to run use:
#   $ ruby thecryptogenius/download_meta.rb


require_relative '../helper'





# https://opensea.io/collection/thecryptogenius

collection = 'thecryptogenius'
range = (0..89)   # 90 items


download_meta( range, collection )

puts "bye"

