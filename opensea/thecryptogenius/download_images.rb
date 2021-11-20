##################
# to run use:
#    $ ruby thecryptogenius/download_images.rb


require_relative '../helper'



collection = 'thecryptogenius'

range = (0..89)   # 90 items



###
## todo/fix: change extension to .jpg  (defaults to png!!!!)
##     collection images are in jpg!!!

download_images( range, collection )

