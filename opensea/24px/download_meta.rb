#####
# to run use:
#   $ ruby 24px/download_meta.rb


require_relative '../helper'



# https://opensea.io/collection/24px   - 24px cool cats
#   9900 algorithmically composed unique pixelcats i

collection = '24px'
range = (0..9899)   # 9900 items


download_meta( range, collection )

puts "bye"

