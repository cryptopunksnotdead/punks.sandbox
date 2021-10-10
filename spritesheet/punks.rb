#####################
#  generate punks; to run use:
#
#   $ ruby ./generate.rb

require 'pixelart'
require 'csvreader'


class Generator

def initialize( image_path="./spritesheet.png",
                meta_path="./spritesheet.csv" )
   @sheet = ImageComposite.read( image_path )
   @recs  = CsvHash.read( meta_path )
end


def spritesheet() @sheet; end
alias_method  :sheet, :spritesheet




def normalize_key( str )
   str.downcase.gsub(/[ ()°_-]/, '').strip
end

def normalize_gender( str )
   ## e.g. Female => f
   ##      F => f
   ##  always return f or m
   str.downcase[0]
end



def build_attributes_by_name
   h = {}
   @recs.each_with_index do |rec, index|
     name   = rec['name']
     gender = rec['gender']
     type   = rec['type']
     id     = rec['id']

     key = normalize_key( name )
     key << "_(#{normalize_gender( gender )})"  if type.downcase.start_with?( 'attribute')

     ## todo/fix: check for unique - make sure key does not exit!!!
     if h[ key ]
       puts "!!! ERROR - attribute name is not unique:"
       pp rec
       puts "duplicate:"
       pp rec[ h[key] ]
       exit 1
     end
     h[ key ] = index   ## fix!!! change to rec!!!!!

     ## add lookup by number too!!!
     if h[ id ]
       puts "!!! ERROR - attribute id is not unique:"
       pp rec
       puts "duplicate:"
       pp rec[ h[id] ]
       exit 1
     end
     h[ id ] = index      ## fix!!! change to rec!!!!!
   end
   pp h
   h
end


def find_meta( q, gender: nil )  ## gender (m/f) required for attributes!!!
   @@attributes_by_name ||= build_attributes_by_name

   key = normalize_key( q )  ## normalize q(uery) string/symbol
   key << "_(#{normalize_gender( gender )})"  if gender

   rec = nil
   index = @@attributes_by_name[ key ]
   if index
      rec = @recs[ index ]
      puts " lookup >#{key}< => #{index}:"
      pp rec
   else
      puts "!! WARN - no lookup found for key >#{key}<"
   end
   rec
end


def find( q, gender: nil )  ## gender (m/f) required for attributes!!!
   rec = find_meta( q, gender: gender )

   img = if rec
           ## note:
           @sheet[ rec['id'].to_i(10) ]
         else
           nil
         end

   img
end




def to_recs( *values )
     archetype_name  = values[0]

     ### todo/fix:  check for nil/not found!!!!
     archetype  = find_meta( archetype_name )
     recs       = [archetype]

     attribute_names  = values[1..-1]
     ## note: attribute lookup requires gender from archetype!!!!
     attribute_gender = normalize_gender( archetype['gender'] )

     attribute_names.each do |attribute_name|
       ### todo/fix:  check for nil/not found!!!!
       attribute = find_meta( attribute_name, gender: attribute_gender )
       recs << attribute
     end

     recs
end




def generate_image( *values, background: nil )

   ids = if values[0].is_a?( Integer )  ## assume integer number (indexes)
             values
         else ## assume strings (names)
             to_recs( *values ).map { |rec| rec['id'].to_i(10) }
         end


   punk = Image.new( 24, 24 )

   if background    ## for now assume background is (simply) color
      punk.compose!( Image.new( 24, 24, background ) )
   end

   ids.each do |id|
     punk.compose!( @sheet[ id ] )
   end

   punk
end
alias_method :generate, :generate_image

end # class Generator



g = Generator.new( './tmp/spritesheet.png',
                   './tmp/spritesheet.csv' )




sprite = g.spritesheet[ 0 ]
sprite.zoom(4).save( "./tmp/sprite0@4x.png" )

sprite = g.sheet[ 9 ]
sprite.zoom(4).save( "./tmp/sprite9@4x.png" )


## archetypes lookup
sprite = g.find( 'Male 1' )
sprite.zoom(4).save( "./tmp/male1@4x.png" )

sprite = g.find( 'Alien' )
sprite.zoom(4).save( "./tmp/alien@4x.png" )

sprite = g.find( 'Alien 0°' )
sprite.zoom(4).save( "./tmp/alien_0@4x.png" )

## attribute lookup - note: requires gender m/f qualifier!!!!
sprite = g.find( 'Birthday Hat', gender: 'f' )
sprite.zoom(4).save( "./tmp/birthdayhat_(f)@4x.png" )



### punks
punk = g.generate( "Male 1", "Beanie", "Smile" )
punk.zoom(4).save( "./tmp/gen1@4x.png" )

punk = g.generate( "Female 4", "Birthday Hat", "Big Shades" )
punk.zoom(4).save( "./tmp/gen2@4x.png" )

punk = g.generate( "Alien 0°", "Sombrero", "Classic Shades" )
punk.zoom(4).save( "./tmp/gen3@4x.png" )


puts
puts "to_recs:"
pp g.to_recs(  "Male 1", "Beanie", "Smile" )

punk = g.generate( 0, 68, 175 )   # 0=>Male 1, 68=>Beanie (m), 175=>Smile (m)
punk.zoom(4).save( "./tmp/gen1b@4x.png" )


puts "bye"
