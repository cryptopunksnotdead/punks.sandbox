####################
#  assemble spritesheet (all-in-one composite image with attributes); to run use:
#
#   $ ruby ./spritesheet.rb


require 'pixelart'



archetypes = CsvHash.read( "./32px_archetypes.csv")
puts "  #{archetypes.size} record(s)"   #=> ???  - was: 64 records


# attributes = CsvHash.read( "./32px_attributes.csv")
# puts "  #{attributes.size} record(s)"  #=> ???  - was: 133


total = archetypes.size
# total = archetypes.size + attributes.size

cols = 10
rows = (total/10)
rows += 1    if total % 10 != 0

sheet = ImageComposite.new( cols, rows, width: 32,
                                        height: 32 )


meta = []  ## output meta(data) records


####
#  add archetypes first


archetypes.each do |rec|
  path = rec['path']
  sheet << Image.read( "../../punks.bodies/#{path}" )


  name_i      = rec['name']
  names_ii    = (rec['name_ii'] || '').split( '|' )
  gender     = rec['gender']
  size       = rec['size']
  type       = rec['type']
  more_names = (rec['more_names'] || '').split( '|' )

  ###
  ## assert required fields
  ##  size - u (unisize/universal), l (arge), s (small)
  unless ['u', 'l', 's'].include?( size )
    puts "!! ERROR - unknown size value - expected u/l/s - got #{size}:"
    pp rec
    exit 1
  end


  ## note: auto-add more names
  ##   1)  name_i + gender + name_ii        (e.g.   Human Male 1 | Human 1
  ##                                             or Human Female 1)
  ##   2)  name_i + name_ii + gender_symbol (e.g. Human 1 ♂    or Human 1 ♀)

  names = []

  if gender == 'm'
    if names_ii.size > 0
      names_ii.each do |name_ii|
        names << "#{name_i} #{name_ii}"
        names << "#{name_i} Male #{name_ii}"
        names << "#{name_i} #{name_ii} ♂"
      end
    else
      names << "#{name_i}"
      names << "#{name_i} Male"
      names << "#{name_i} ♂"
    end
  elsif gender == 'f'
    if names_ii.size > 0
      names_ii.each do |name_ii|
        names << "#{name_i} Female #{name_ii}"
        names << "#{name_i} #{name_ii} ♀"
      end
    else
      names << "#{name_i} Female"
      names << "#{name_i} ♀"
    end
  else
    puts "!! ERROR - unknown gender #{gender}:"
    pp rec
    exit 1
  end

  names += more_names   ## add more_names if any
  names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}  ## normalize spaces in more names


  ### special case hacks
  ##   to auto-add qualifiers e.g. (U) for unisize
  ##                            or (F) for faceless
  if path.index( 'unisize/' )
    ## hack - always auto-add u (e.g. Female 1 (U) or such)
    names = names.map { |name| name + " (U)"  }
  end

  if path.index( 'faceless/' )
    ## hack - always auto-add f (e.g. Male 1 (F) or such)
    names = names.map { |name| name + " (F)"  }
  end

  if path.index( 'natural/' )
    ## note:  use (N2) marker for v2 archetypes
    ##         and (N)  for "regular"
    key = path.index( "v2" ) ? 'N2' : 'N'

    ## hack - always auto-add n (e.g. Female 1 (N) or such)
    names = names.map { |name| name + " (#{key})"  }
  end



  meta << [meta.size,
           names[0],
           gender,
           size,
           "Archetype - #{type}",
           names[1..-1].join( ' | '),
          ]
end



=begin
####
#  add attributes


attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "../../punks.blocks/#{path}" )


  gender = rec['gender']
  size   = rec['size']

  ## auto-fill for now if set to ?
  ##   for female set to s(mall)
  ##   and otherwise to l(arge)
  size = (gender == 'f' ? 's' : 'l')  if size.nil? || size.empty?


  meta << [meta.size,
            rec['name'],
            gender,
            size,
            "Attribute",     ## add type e.g. Hair, Hat, Glasses, etc later - why? why not?
            rec['more_names'],
          ]
end
=end



headers = ['id', 'name', 'gender', 'size', 'type', 'more_names']
File.open( "./tmp/spritesheets/punks-32x32.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end


sheet.save( "./tmp/spritesheets/punks-32x32.png" )
sheet.zoom(2).save( "./tmp/spritesheets/punks-32x32@2x.png" )
sheet.zoom(4).save( "./tmp/spritesheets/punks-32x32@4x.png" )


puts "bye"