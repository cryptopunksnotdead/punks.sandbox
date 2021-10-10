
module Cryptopunks

  class Metadata
    ### todo/fix:
    ##    move into Punks::Metadata or such
    class Sprite
      attr_reader :id, :name, :type, :gender


      def initialize( id:,
                      name:,
                      type:,
                      gender: )
         @id     = id      # zero-based index eg. 0,1,2,3, etc.
         @name   = name
         @type   = type
         @gender = gender
      end

      ## todo/check - find better names for type attribute/archetypes?
      ##     use (alternate name/alias) base or face  for archetypes? any others?
      def attribute?()  @type.downcase.start_with?( 'attribute' ); end
      def archetype?()  @type.downcase.start_with?( 'archetype' ); end
   end  # class Metadata::Sprite
  end # class Metadata




  class Generator

 ######
 # static helpers  - (turn into "true" static self.class methods - why? why not?)
 #
 def normalize_key( str )
    str.downcase.gsub(/[ ()°_-]/, '').strip
 end

 def normalize_gender( str )
    ## e.g. Female => f
    ##      F => f
    ##  always return f or m
    str.downcase[0]
 end


 def build_attributes_by_name( recs )
    h = {}
    recs.each_with_index do |rec|
      key = normalize_key( rec.name )
      key << "_(#{rec.gender})"  if rec.attribute?

      if h[ key ]
        puts "!!! ERROR - attribute name is not unique:"
        pp rec
        puts "duplicate:"
        pp h[key]
        exit 1
      end
      h[ key ] = rec
    end
    ## pp h
    h
 end


 def build_recs( recs )   ## build and normalize (meta data) records

    ## sort by id
    recs = recs.sort do |l,r|
                       l['id'].to_i( 10 ) <=> r['id'].to_i( 10 )   # use base10 (decimal)
                     end

    ## assert all recs are in order by id (0 to size)
    recs.each_with_index do |rec, exp_id|
       id = rec['id'].to_i(10)
       if id != exp_id
          puts "!! ERROR -  meta data record ids out-of-order - expected id #{exp_id}; got #{id}"
          exit 1
       end
    end

    ## convert to "wrapped / immutable" kind-of struct
    recs = recs.map do |rec|
             id     = rec['id'].to_i( 10 )
             name   = rec['name']
             gender = normalize_gender( rec['gender'] )
             type   = rec['type']

             Metadata::Sprite.new(
               id:     id,
               name:   name,
               type:   type,
               gender: gender)
           end
    recs
 end  # method build_recs




 def initialize( image_path="./spritesheet.png",
                 meta_path="./spritesheet.csv" )
    @sheet = Pixelart::ImageComposite.read( image_path )
    recs  = CsvHash.read( meta_path )

    @recs = build_recs( recs )

    ## lookup by "case/space-insensitive" name / key
    @attributes_by_name = build_attributes_by_name( @recs )
 end


 def spritesheet() @sheet; end
 alias_method  :sheet, :spritesheet





 def find_meta( q, gender: nil )  ## gender (m/f) required for attributes!!!

    key = normalize_key( q )  ## normalize q(uery) string/symbol
    key << "_(#{normalize_gender( gender )})"  if gender

    rec = @attributes_by_name[ key ]
    if rec
       puts " lookup >#{key}< => #{rec.id}: #{rec.name} / #{rec.type} (#{rec.gender})"
       # pp rec
    else
       puts "!! WARN - no lookup found for key >#{key}<"
    end
    rec
 end


 def find( q, gender: nil )  ## gender (m/f) required for attributes!!!
    rec = find_meta( q, gender: gender )

    ## return image if record found
    rec ? @sheet[ rec.id ] : nil
 end




 def to_recs( *values )
      archetype_name  = values[0]

      ### todo/fix:  check for nil/not found!!!!
      archetype  = find_meta( archetype_name )
      if archetype.nil?
        puts "!! ERROR -  archetype >#{archetype}< not found; sorry"
        exit 1
      end

      recs       = [archetype]

      attribute_names  = values[1..-1]
      ## note: attribute lookup requires gender from archetype!!!!
      attribute_gender = archetype.gender

      attribute_names.each do |attribute_name|
        attribute = find_meta( attribute_name, gender: attribute_gender )
        if attribute.nil?
           puts "!! ERROR - attribute >#{attribute_name}< for (#{attribute_gender}) not found; sorry"
           exit 1
        end
        recs << attribute
      end

      recs
 end




 def generate_image( *values, background: nil )

    ids = if values[0].is_a?( Integer )  ## assume integer number (indexes)
              values
          else ## assume strings (names)
              to_recs( *values ).map { |rec| rec.id }
          end


    punk = Pixelart::Image.new( 24, 24 )

    if background    ## for now assume background is (simply) color
       punk.compose!( Pixelart::Image.new( 24, 24, background ) )
    end

    ids.each do |id|
      punk.compose!( @sheet[ id ] )
    end

    punk
 end
 alias_method :generate, :generate_image

 end # class Generator

end # module Cryptopunks
