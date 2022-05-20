####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'pixelart'
require 'csvreader'



attributes = CsvHash.read( "./attributes.csv")
puts "  #{attributes.size} record(s)"  #=> ??


total = 1 + attributes.size

sheet = ImageComposite.new( 20, (total/20)+1, width: 32,
                                              height: 32 )


meta = []  ## output meta(data) records

####
#  add attributes
attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "./attributes/#{path}" )

  name       = rec['name']
  more_names = (rec['more_names'] || '').split( '|' )

  if name.nil? || name.empty?
    ## try to auto-fill name for path
    basename   = File.basename(path, File.extname(path))
    name = basename
  end


  names =  [name] + more_names

  ## normalize spaces in more names
  names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}

  meta << [meta.size,
           names[0],
           '?',   ## note: type to done (later)
           names[1..-1].join( ' | '),
          ]
end



sheet.save( "./tmp/spritesheet.png" )
sheet.zoom(2).save( "./tmp/spritesheet@2x.png" )


headers = ['id', 'name', 'type', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"