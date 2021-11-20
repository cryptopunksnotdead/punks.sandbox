##################
# to run use:
#    $ ruby 24px/download_images.rb


require_relative '../helper'





# https://opensea.io/collection/weape24

collection = 'weape24'
# range =    (9801..9899)  # (100..1000)   ##(0..99)    # 9900 items
range = (0..9899)   # 9900 items


download_images( range, collection )  #  original: true

