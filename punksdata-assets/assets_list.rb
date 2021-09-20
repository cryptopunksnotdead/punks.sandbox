##################################
#  generate a text in markdown list of all attributes
#
# to run use:
#     $ ruby ./assets_list.rb



require_relative '../punksdata/punksdata'


assets_by_name = {}

## note: skip 0..10 (11 archetypes)
ASSETS_ENCODED[11..-1].each do |rec|
  num  = rec[:id]
  name = rec[:name]

  stat = assets_by_name[ name ] ||= []
  stat << rec
end

assets_by_name.each do |name, assets|

   print "#{name} "

   qualifiers = assets.map { |rec| rec[:qualifier] }
   print "(#{qualifiers.join('/')})"
   print "\n"

   assets.each_with_index do |rec,i|
      name       = rec[:name]
      qualifier  = rec[:qualifier]

      slug = name.downcase.gsub( /[ _+-]/, '' ).strip
      print "  ![](original/#{qualifier}/#{slug}.png)"
      print ","    if (i+1) == assets.size  ## last entry (add trailing comma)
      print "\n"
    end
end


puts "bye"

