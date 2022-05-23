####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'pixelart'


attributes = CsvHash.read( "./attributes.csv")
puts "  #{attributes.size} record(s)"  #=> ??


total = 1 + attributes.size

sheet = ImageComposite.new( 20, (total/20)+1, width:  32,
                                              height: 32 )


meta = []  ## output meta(data) records

## auto-expand some shortcuts - note: for now doesn't generate all permutations
##                                          if more than one match (always expands all words)
words  = [
  [ 'Diag', 'Diagonal' ],
  [ 'Vert', 'Vertical' ],
  [ 'Brwn', 'Brown' ],
  [ 'Blk',  'Black' ],
  [ 'Grey',  'Gray' ],        # -- allow "amercian" spelling
].map do |rec|
          [ %r{\b#{rec[0]}\b}, rec[0], rec[1] ]    # -- auto-convert to regex (w/ word boundary)
      end


####
#  add attributes
attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "./attributes/#{path}" )


  name       = rec['name']
  more_names = (rec['more_names'] || '').split( '|' )

  alt_count = 0
  alt_name = name
  words.each do |rec|
     alt_name = alt_name.gsub( rec[0] ) do |_|
       alt_count += 1
       puts "   expanding >#{rec[1]}< to >#{rec[2]}< in >#{name}< (#{alt_count})"
       rec[2]
     end
  end

  more_names  << alt_name     if alt_count > 0

  ## normalize spaces in more names
  names = [name] + more_names
  names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}

  meta << [meta.size,
            rec['type'],
            names[0],
            names[1..-1].join( ' | '),
          ]
end


sheet.save( "./tmp/spritesheet.png" )
sheet.zoom(2).save( "./tmp/spritesheet@2x.png" )


headers = ['id', 'type', 'name', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"