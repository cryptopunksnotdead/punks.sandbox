
module Cryptopunks

  class Metadata
    ### todo/fix:
    ##    move into Punks::Metadata or such
    class Sprite
      attr_reader :id, :name, :type, :gender, :size, :more_names


      def initialize( id:,
                      name:,
                      type:,
                      gender:,
                      size:,
                      more_names: [] )
         @id         = id      # zero-based index eg. 0,1,2,3, etc.
         @name       = name
         @type       = type
         @gender     = gender
         @size       = size
         @more_names = more_names
      end

      ## todo/check - find better names for type attribute/archetypes?
      ##     use (alternate name/alias) base or face  for archetypes? any others?
      def attribute?()  @type.downcase.start_with?( 'attribute' ); end
      def archetype?()  @type.downcase.start_with?( 'archetype' ); end

      def small?()     @size == 's'; end
      def large?()     @size == 'l'; end
      def universal?() @size == 'u'; end
      alias_method  :unisize?, :universal?   ## add unisize or allsizes or such - why? why not?

      def male?()      @gender == 'm'; end
      def female?()    @gender == 'f'; end
      def unisex?()    @gender == 'u'; end
   end  # class Metadata::Sprite
  end # class Metadata




  class Generator

 ######
 # static helpers  - (turn into "true" static self.class methods - why? why not?)
 #
 def self.normalize_key( str )
   ## add & e.g. B&W
    str.downcase.gsub(/[ ()&°_-]/, '').strip
 end

 def self.normalize_gender( str )
    ## e.g. Female => f
    ##      F => f
    ##  always return f/m
    str.downcase[0]
 end

 def self.normalize_size( str )
    ## e.g. U or Unisize or Univeral => u
    ##      S or Small               => s
    ##      L or Large               => l
    ##   always return u/l/s
    str.downcase[0]
 end

 def self.normalize_name( str )
   ## normalize spaces in more names
   str.strip.gsub( /[ ]{2,}/, ' ' )
 end

 def normalize_key( str )     self.class.normalize_key( str ); end
 def normalize_gender( str )  self.class.normalize_gender( str ); end
 def normalize_size( str )    self.class.normalize_size( str ); end
 def normalize_name( str )    self.class.normalize_name( str ); end






 def build_attributes_by_name( recs )
    h = {}
    recs.each_with_index do |rec|
      names = [rec.name] + rec.more_names

      names.each do |name|
        key = normalize_key( name )
        key << "_(#{rec.gender}+#{rec.size})"  if rec.attribute?

        if h[ key ]
          puts "!!! ERROR - attribute name is not unique:"
          pp rec
          puts "duplicate:"
          pp h[key]
          exit 1
        end
        h[ key ] = rec
      end
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
             id         = rec['id'].to_i( 10 )
             name       = normalize_name( rec['name'] )
             gender     = normalize_gender( rec['gender'] )
             size       = normalize_size( rec['size'] )
             type       = rec['type']

             more_names = (rec['more_names'] || '').split( '|' )
             more_names = more_names.map {|str| normalize_name( str ) }

             Metadata::Sprite.new(
               id:         id,
               name:       name,
               type:       type,
               gender:     gender,
               size:       size,
               more_names: more_names )
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


 def records() @recs; end
 alias_method :meta, :records




 def find_meta( q, gender: nil,
                   size: nil,
                   style: nil )   ## note: gender (m/f) required for attributes!!!

    key = normalize_key( q )  ## normalize q(uery) string/symbol

    keys = []    ## note allow lookup by more than one keys
                    ##  e.g. if gender set try   f/m first and than try unisex as fallback
    if gender
       gender = normalize_gender( gender )
       ## auto-fill size if not passed in
       ##    for f(emale)  =>   s(mall)
       ##        m(ale)    =>   l(arge)
       size =  if size.nil?
                 gender == 'f' ? 's' : 'l'
               else
                 normalize_size( size )
               end

       ###
       #  try (auto-add) style-specific version first (fallback to "regular" if not found)
       if style
         ## for now only support natural series
         style_key =  if style.downcase.start_with?( 'natural' )
                          'natural'
                      else
                        puts "!! ERROR - unknown attribute style #{style}; sorry"
                        exit 1
                      end

         keys << "#{key}#{style_key}_(#{gender}+#{size})"
         ## auto-add (u)niversal size as fallback
         keys << "#{key}#{style_key}_(#{gender}+u)"  if size == 's' || size == 'l'
         ## auto-add u(nisex) as fallback
         keys << "#{key}#{style_key}_(u+#{size})"    if gender == 'f' || gender == 'm'
       end


       keys << "#{key}_(#{gender}+#{size})"
       ## auto-add (u)niversal size as fallback
       keys << "#{key}_(#{gender}+u)"  if size == 's' || size == 'l'
       ## auto-add u(nisex) as fallback
       keys << "#{key}_(u+#{size})"    if gender == 'f' || gender == 'm'
    else
       keys << key
    end


    rec = nil
    keys.each do |key|
       rec = @attributes_by_name[ key ]
       if rec
         puts " lookup >#{key}< => #{rec.id}: #{rec.name} / #{rec.type} (#{rec.gender}+#{rec.size})"
         # pp rec
         break
       end
    end

    if rec.nil?
       puts "!! WARN - no lookup found for #{keys.size} key(s) >#{keys.inspect}<"
    end

    rec
 end


 def find( q, gender: nil, size: nil, style: nil )  ## gender (m/f) required for attributes!!!
    rec = find_meta( q, gender: gender, size: size, style: style )

    ## return image if record found
    rec ? @sheet[ rec.id ] : nil
 end




 def to_recs( *values, style: nil )
      archetype_name  = values[0]

      ### todo/fix:  check for nil/not found!!!!
      ## todo/check/fix:  assert meta record returned is archetype NOT attribute!!!!
      archetype  = find_meta( archetype_name )
      if archetype.nil?
        puts "!! ERROR -  archetype >#{archetype}< not found; sorry"
        exit 1
      end

      recs       = [archetype]

      attribute_names  = values[1..-1]
      ## note: attribute lookup requires gender from archetype!!!!
      attribute_gender = archetype.gender
      attribute_size   = archetype.size

      attribute_names.each do |attribute_name|
        attribute = find_meta( attribute_name,
                               gender: attribute_gender,
                               size:   attribute_size,
                               style:  style )
        if attribute.nil?
           puts "!! ERROR - attribute >#{attribute_name}< for (#{attribute_gender}+#{attribute_size}) not found; sorry"
           exit 1
        end
        recs << attribute
      end

      recs
 end




 def generate_image( *values, style: nil,
                              background: nil )

    ids = if values[0].is_a?( Integer )  ## assume integer number (indexes)
              values
          else ## assume strings (names)
              to_recs( *values, style: style ).map { |rec| rec.id }
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
