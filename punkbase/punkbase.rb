###
##
# tip: how to run a local webserver with ruby
#     $ ruby -run -e httpd . -p 8080


require 'cocos'

$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'cryptopunks'


require 'active_record'
require 'sqlite3'


module Database
class CreateDb
  def up
    ActiveRecord::Schema.define do

  create_table :metadata do |t|

    ####
    # -- general

    ## note: CANNOT use type (use kind) instead (type is used/reserved for table inheritance)
    t.string  :base,     null: false   ## e.g. Human, Zombie, Ape, etc.
    t.string  :gender,   null: false   ## todo/check: restrict to m/f - why? why not?
    t.string  :skin_tone              ## e.g. uses Dark/Mid/Light/Albino for now -why? why not?

    ## attribute count  (note: CANNOT use attributes - used by AR models)
    t.integer :count, null: false    ## e.g. 0,1,2,3,4,etc.

    ###############
    #  -- attributes
    t.string :blemishes   ## note: incl. rosy cheeks
    t.string :head    ## hair or/and headwear  - split into two - why? why not?
    t.string :beard
    t.string :eyes    ## eyes (make-up)  or eyewear - split into two - why? whynot?
    t.string :nose   ## nose accessory
    t.string :mouth
    t.string :mouth_prop
    t.string :ears
    t.string :neck


    t.string  :image, null: false

    t.timestamps
  end
  end  # Schema.define
end # method up

end # class CreateDb




def self.connect

      config =   { adapter:  'sqlite3',
                   database: 'punkbase.db',
                    }

    puts "Connecting to db using settings: "
    pp config
    ActiveRecord::Base.establish_connection( config )
    # ActiveRecord::Base.logger = Logger.new( STDOUT )

    ## if sqlite3 add (use) some pragmas for speedups
      ## note: if in memory database e.g. ':memory:' no pragma needed!!
      ## try to speed up sqlite
      ##   see http://www.sqlite.org/pragma.html
      con = ActiveRecord::Base.connection
      con.execute( 'PRAGMA synchronous=OFF;' )
      con.execute( 'PRAGMA journal_mode=OFF;' )
      con.execute( 'PRAGMA temp_store=MEMORY;' )

end

def self.auto_migrate!
  # first time? - auto-run db migratation, that is, create db tables
  unless Metadata.table_exists?
    CreateDb.new.up
  end
end


class Metadata < ActiveRecord::Base
  self.table_name = "metadata"
end
end # module Database



Database.connect
Database.auto_migrate!




def to_metadata( *attributes )
  archetype = attributes[0]
  more_attributes = attributes[1..-1]

  h = {}
  h[:count] = more_attributes.count   ## e.g. 0,1,2,etc.

  base, gender, skin_tone = case archetype
                            when 'Zombie'  then ['Zombie', 'm', nil]
                            when 'Ape'     then ['Ape',    'm', nil]
                            when 'Alien'   then ['Alien',  'm', nil]
                            when 'Male 1'  then ['Human',  'm', 'Dark']
                            when 'Male 2'  then ['Human',  'm', 'Mid']
                            when 'Male 3'  then ['Human',  'm', 'Light']
                            when 'Male 4'  then ['Human',  'm', 'Albino']
                            when 'Female 1'  then ['Human',  'f', 'Dark']
                            when 'Female 2'  then ['Human',  'f', 'Mid']
                            when 'Female 3'  then ['Human',  'f', 'Light']
                            when 'Female 4'  then ['Human',  'f', 'Albino']
                            else
                               raise ArgumentError, "unknown archetype >#{archetype}<; sorry"
                            end

  h[:base]      = base
  h[:gender]    = gender
  h[:skin_tone] = skin_tone


  more_attributes.each do |attribute|
    category = case attribute
               when 'Rosy Cheeks', 'Mole', 'Spots' then :blemishes
               when  'Shaved Head', 'Peak Spike', 'Vampire Hair', 'Purple Hair',
                     'Mohawk', 'Mohawk Dark', 'Mohawk Thin', 'Wild Hair',
                     'Crazy Hair', 'Messy Hair', 'Frumpy Hair',
                     'Stringy Hair', 'Clown Hair Green', 'Straight Hair',
                     'Straight Hair Dark', 'Straight Hair Blonde',
                     'Blonde Short', 'Blonde Bob', 'Wild Blonde',
                     'Wild White Hair', 'Orange Side',
                     'Dark Hair', 'Pigtails', 'Pink With Hat',
                     'Half Shaved', 'Red Mohawk',
                     'Cowboy Hat', 'Fedora', 'Hoodie', 'Beanie',
                      'Top Hat', 'Do-rag', 'Police Cap',  'Cap Forward',
                      'Cap', 'Knitted Cap', 'Bandana', 'Headband', 'Pilot Helmet',
                      'Tassle Hat', 'Tiara'  then :head
               when 'Shadow Beard', 'Normal Beard', 'Normal Beard Black',
                    'Big Beard', 'Luxurious Beard', 'Mustache', 'Goat',   'Handlebars', 'Front Beard', 'Front Beard Dark',
                    'Chinstrap', 'Muttonchops' then :beard
               when 'Small Shades', 'Regular Shades', 'Classic Shades',
                     'Big Shades', 'Nerd Glasses', 'Horned Rim Glasses',
                     '3D Glasses', 'VR', 'Eye Mask', 'Eye Patch',
                     'Welding Goggles',
                     'Clown Eyes Green', 'Clown Eyes Blue', 'Green Eye Shadow',
                    'Blue Eye Shadow', 'Purple Eye Shadow'   then :eyes
               when  'Clown Nose'  then :nose
               when 'Smile', 'Frown', 'Buck Teeth', 'Hot Lipstick',
                     'Black Lipstick', 'Purple Lipstick' then :mouth
               when  'Cigarette', 'Vape', 'Pipe', 'Medical Mask' then :mouth_prop
               when  'Earring' then :ears
               when  'Silver Chain', 'Gold Chain', 'Choker' then :neck
               else
                 raise ArgumentError, "unknown attribute >#{attribute}<; sorry"
               end

    ## check / assert that category is empty (no duplicates allowed!)
    raise ArgumentError, "duplicate attribute category use >#{category}<; sorry"  if h[category]

    h[category] = attribute
  end

  h
end



(0..9999).each do |id|
  attributes = CryptopunksData.punk_attributes( id )

  h = to_metadata( *attributes )
  h[:id] = id    ##  use id (zero-based,that is, starting 0,1,2,etc.)

  puts "==> #{id}"
  pp h


   img =  YeOldePunk::Image.generate( *attributes )
   ## img.zoom(4).save( "./tmp/punk#{id}.png")

   image = "data:image/png;base64, "
   image += Base64.strict_encode64( img.to_blob )

   puts "image:"
   puts image

   rec = Database::Metadata.new( h )
   rec.image = image
   rec.save!
end


# ActiveRecord::Base.connection.execute( 'VACUUM;' )


# Database::Metadata.all.each do |o|
#   puts "o: #{o.inspect}"
# end


puts "bye"
