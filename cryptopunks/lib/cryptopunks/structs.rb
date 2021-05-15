
module Cryptopunks
### wrap metadata (e.g. punk types, accessories, etc.
##     in structs for easy/easier access)



class Metadata

  ## nested class
  class Type     ## todo/check: use alias family or such?
     attr_reader :name,
                 :limit
     def initialize( name, limit )
       @name  = name
       @limit = limit
     end
     ## def to_s() @name; end

     def inspect
      %Q{<Type "#{@name}", limit: #{@limit}>}
    end



     def self.build
       TYPES.reduce( {} ) do |h, rec|
          type = Type.new( rec[:name], rec[:limit ] )
          h[ rec[:name].downcase ] = type
          h
       end
     end

     def self.registry
       ## auto-build registry (hash table) lookup (by name)
       @@types ||= build
       @@types
     end

     def self.all() registry.values; end

     def self.find( q ) registry[ q.to_s.downcase ]; end
  end  ## (nested) class Type



  ## nested class
  class AccessoryType
     attr_reader :name,
                 :accessories
     def initialize( name, accessories=[] )
       @name        = name
       @accessories = accessories
     end



     def self.build
       ACCESSORY_TYPES.reduce( {} ) do |h, rec|
         type = AccessoryType.new( rec[:name] )
         ## add all accessories
         rec[:accessories].each do |rec_acc|
           type.accessories << Accessory.new( rec_acc[:name],
                                              type,
                                              rec_acc[:limit].to_i )
         end
         h[ rec[:name].downcase ] = type
         h
       end
     end

     def self.registry
       ## auto-build registry (hash table) lookup (by name)
       @@types ||= build
       @@types
     end

     def self.all() registry.values; end

     def self.find( q ) registry[ q.to_s.downcase ]; end
  end  ## (nested) class AccessoryType


  ## nested class
  class Accessory

   attr_reader :name,
               :type,
               :limit
   def initialize( name, type, limit )
     @name  = name
     @type  = type
     @limit = limit
   end


   def inspect
     %Q{<Accessory "#{@name}", type: "#{@type.name}", limit: #{@limit}>}
   end



   def self.build
     AccessoryType.all.reduce( {} ) do |h, type|
                                      type.accessories.each do |acc|
                                        h[ acc.name.downcase ] = acc
                                      end
                                      h
                                    end
   end

   def self.registry
     ## auto-build registry (hash table) lookup (by name)
     @@types ||= build
     @@types
   end

   def self.all() registry.values; end

   def self.find( q ) registry[ q.to_s.downcase ]; end
end  ## (nested) class Accessory






  attr_reader :id,
              :type,
              :accessories,
              :birthday    ## todo/check: use minted or such?

  def initialize( id, type, accessories )
    @id          = id
    @type        = type
    @accessories = accessories
    @birthday    = Date.new( 2017, 6, 23)   ## all 10,000 minted on June 23, 2017
  end

  def is_type?( name ) @type.name == name; end
  alias_method :is?, :is_type?

  ## convenience helpers for "classic" (5) types
  def alien?()  is_type?( 'Alien'); end
  def ape?()    is_type?( 'Ape' ); end
  def zombie?() is_type?( 'Zombie' ); end
  def female?() is_type?( 'Female' ); end
  def male?()   is_type?( 'Male' ); end

  ## convenience helpers to lookup attributes
  def has_attribute?( name )
    accessories.each do |acc|
      return true  if acc.name == name
    end
    false
  end
  alias_method :has?,     :has_attribute?
  alias_method :include?, :has_attribute?
end # class Metadata

end  # module Cryptopunks
