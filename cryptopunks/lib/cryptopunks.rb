## 3rd party
require 'pixelart/base'
require 'csvreader'



## extra stdlibs
require 'digest'     ## move/add to pixelart upstream - why? why not?
require 'optparse'
require 'gli'        ## used for command line tool



## our own code
require 'cryptopunks/version'    # note: let version always go first

## forward define superclass for image
module Cryptopunks
  class Image < Pixelart::Image; end
end


require 'cryptopunks/attributes'
require 'cryptopunks/structs'
require 'cryptopunks/composite'
## add old backwards compatible alias

module Cryptopunks
   class Image
      Composite = ImageComposite
   end
end


require 'cryptopunks/dataset'

require 'cryptopunks/colors'
require 'cryptopunks/image'

require 'cryptopunks/generator'

###
## add convenience pre-configurated generatored with build-in spritesheet (see config)

module Cryptopunks

  def self.generator
    @generator ||= Generator.new(  "#{root}/config/spritesheet.png",
                                   "#{root}/config/spritesheet.csv" )
  end

  class Image
     def self.generate( *values )
       img = Cryptopunks.generator.generate( *values )
       ## note: unwrap inner image before passing on to c'tor (requires ChunkyPNG image for now)
       new( img.image )
     end
  end # class Image


  class Spritesheet
    ## note: for now class used for "namespace" only
    def self.find_by( name:, gender: nil, size: nil )  ## return archetype/attribute image by name
       # note: pass along name as q (query string)
       Cryptopunks.generator.find( name,
                                   gender: gender,
                                   size:   size )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
end #  module Cryptopunks



####
# add CryptoPunksData (off-chain) contract
require 'cryptopunks/contract/punksdata-assets'
require 'cryptopunks/contract/punksdata-meta'
require 'cryptopunks/contract/punksdata-contract'
CryptoPunksData = CryptopunksData
PunksData       = CryptopunksData





require 'cryptopunks/tool'

### add tool convenience helper
module Cryptopunks
  def self.main( args=ARGV ) Tool.new.run( args ); end
end ## module Cryptopunks





### add some convenience shortcuts
CryptoPunks = Cryptopunks
Punks       = Cryptopunks


###
# note: for convenience auto include Pixelart namespace!!! - why? why not?
include Pixelart



puts Cryptopunks.banner    # say hello
