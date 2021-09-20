##################################
#  generate all 133 assets as 24x24 images (archetypes 'n' attributes)
#     save male and female attributes in its own directories (m/f)
#
# to run use:
#     $ ruby ./assets_original.rb



require_relative '../punksdata/punksdata'


hex = COLORS_ENCODED
colors = decode_colors( hex )


ASSET_RENAMES = {
   ### rename archetypes
   'male1'    => 'human-male_darker',
   'male2'    => 'human-male_dark',
   'male3'    => 'human-male_light',
   'male4'    => 'human-male_lighter',
   'alien'    => 'alien-male',
   'ape'      => 'ape-male',
   'zombie'   => 'zombie-male',
   'female1'  => 'human-female_darker',
   'female2'  => 'human-female_dark',
   'female3'  => 'human-female_light',
   'female4'  => 'human-female_lighter',
}


ASSETS_ENCODED.each do |rec|
  hex  = rec[:hex]

  img = decode_image( hex, colors: colors )

  name      = rec[:name]
  num       = rec[:id]
  qualifier = rec[:qualifier]   # e.g. m/f

  slug = name.downcase.gsub( /[ _-]/, '' )

  ## check for renames
  slug = ASSET_RENAMES[ slug ] || slug

  path = if qualifier
            "#{qualifier}/#{slug}.png"
         else
            "#{slug}.png"
         end

  img.save( "tmp/#{path}" )
end


puts "bye"

