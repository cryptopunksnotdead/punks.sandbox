##################################
#  generate all 133 assets as 24x24 images (archetypes 'n' attributes)
#
# to run use:
#     $ ruby ./assets.rb



require_relative '../punksdata/punksdata'


hex = COLORS_ENCODED
colors = decode_colors( hex )



ASSETS_ENCODED.each do |rec|
  hex  = rec[:hex]

  img = decode_image( hex, colors: colors )

  slug = rec[:slug]

  img.save( "i/#{slug}.png" )
  img.zoom(4).save( "i/#{slug}x4.png" )
end


puts "bye"

