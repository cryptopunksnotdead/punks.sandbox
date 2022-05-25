####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'pixelart'



attributes = CsvHash.read( "./attributes.csv")
puts "  #{attributes.size} record(s)"  #=> ??


total = 1 + attributes.size

sheet = ImageComposite.new( 10, (total/10)+1 )


meta = []  ## output meta(data) records


####
#  add attributes
attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "./attributes/#{path}" )

  name       = rec['name']
  more_names = (rec['more_names'] || '').split( '|' )


  ## auto-fill name if missing
  if name.nil? || name.empty?
      name = File.basename( path, File.extname( path ))
  end

  ## normalize spaces in more names
  names = [name] + more_names
  names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}

  meta << [meta.size,
            '?',
            names[0],
            names[1..-1].join( ' | '),
          ]
end



sheet.save( "./tmp/spritesheet.png" )
sheet.zoom(2).save( "./tmp/spritesheet@2x.png" )


headers = ['id',  'category', 'name', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"