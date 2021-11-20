##################
# to run use:
#    $ ruby 24px/download_images.rb


require_relative '../helper'



collection = '24px'

# range =  (6001..9899)   # (3001..6000)      ## (1000..3000)      # (0..999)
range = (0..9899)   # 9900 items



download_images( range, collection )  #  original: true

