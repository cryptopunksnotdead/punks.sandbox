#########
#  flip vertically (turn upside down)
#
#  ruby ./flip.rb




require 'cryptopunks'


### todo/fix:
##   more this flip code into pixelart gem!!!

module Pixelart
class Image

  def flip
    img = @img.flip
    Image.new( img.width, img.height, img )
  end
  alias_method :flip_horizontally, :flip

end # class Image
end # module Pixelart




print "==> loading image..."
punks = Punks::Image::Composite.read( '../../programming-cryptopunks/punks.png' )
print "OK\n"



ids = [
 3393,   # zombie
 172,    # blondie
 2964,   # beanie
]
ids.each do |id|
  name = '%04d' % id
  punk = punks[id]
  punk_flipped = punk.flip

  punk_flipped.save( "./i/punk-#{name}_flipped.png" )
  punk_flipped.zoom(4).save( "./i/punk-#{name}_flipped4x.png" )
end


ids.each do |id|
  name = '%04d' % id
  punk = punks[id]
  phunk_flipped = punk.flip.mirror

  phunk_flipped.save( "./i/phunk-#{name}_flipped.png" )
  phunk_flipped.zoom(4).save( "./i/phunk-#{name}_flipped4x.png" )
end


puts "bye"

