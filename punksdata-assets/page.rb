##################################
#  generate readme page
#
# to run use:
#     $ ruby ./page.rb



require 'pixelart'



require_relative '../punksdata/punksdata'



buf = String.new('')

ASSETS_ENCODED.each do |rec|
  num       = rec[:id]
  name      = rec[:name]
  slug      = rec[:slug]
  qualifier = rec[:qualifier]

  qname = "#{name}"
  qname << " (#{qualifier})"   if qualifier

  buf << "#{num} "
  buf << %Q{![](i/#{slug}.png "#{qname}")\n}
end



buf += <<TXT

In a Table

| No   |  24x24  | Name |
|------|---------|------|
TXT

ASSETS_ENCODED.each do |rec|
  num       = rec[:id]
  name      = rec[:name]
  slug      = rec[:slug]
  qualifier = rec[:qualifier]

  qname = "#{name}"
  qname << " (#{qualifier})"   if qualifier

  buf << "| #{num} | ![](i/#{slug}.png) |  #{qname} |\n"
end


buf << "\n\n4x\n\n"

ASSETS_ENCODED.each do |rec|
  num       = rec[:id]
  name      = rec[:name]
  slug      = rec[:slug]
  qualifier = rec[:qualifier]

  qname = "#{name}"
  qname << " (#{qualifier})"   if qualifier

  buf <<   "#{num} "
  buf <<   %Q{![](i/#{slug}x4.png "#{qname}")\n}
end



buf += <<TXT

Note:  Many attributes have two variants (male / female) - sometimes with a different
design and somtimes only with a different offset / placement:

TXT



#########################
## Bonus: check for duplicate name usage
assets_by_name = {}

ASSETS_ENCODED.each do |rec|
  num  = rec[:id]
  name = rec[:name]

  stat = assets_by_name[ name ] ||= []
  stat << rec
end

# pretty print duplicate names
assets_by_name.each do |name, assets|
   next if assets.size == 1

   buf <<  "#{'%-18s' % name} - "

   assets.each do |rec|
      num       = rec[:id]
      slug      = rec[:slug]

      buf <<  "#{num} "
      buf <<  "![](i/#{slug}.png) "
    end
    buf << "<br>\n"
end



header = <<TXT

![](i/archetypes-strip3x.png)


# Inside the CryptoPunksData Contract - All 133 Assets (11 Archetypes 'n' 122 Attributes) in the 24x24px Format For Easy (Re)Use "Off-Chain"

How does it work? See [**Inside the CryptoPunksData Contract - Decoding the On-Chain Assets 'n' Color Palette »**](../punksdata)

TXT


footer = <<TXT

## Questions? Comments?

Post them on the [CryptoPunksDev reddit](https://old.reddit.com/r/CryptoPunksDev). Thanks.

TXT


File.open( './README.md', 'w:utf-8') do |f|
    f.write( header )
    f.write( "\n\n")
    f.write( buf )
    f.write( "\n\n")
    f.write( footer )
end

puts "bye"
