###
##
# tip: how to run a local webserver with ruby
#     $ ruby -run -e httpd . -p 8080


require 'cocos'
require 'punks'

require 'active_record'
require 'sqlite3'


module Database
class CreateDb
  def up
    ActiveRecord::Schema.define do

  create_table :metadata do |t|
    ## note: CANNOT use type (use kind) instead (type is used/reserved for table inheritance)
    t.string  :kind,   null: false
    t.string  :gender, null: false
    t.string  :skin,   null: false

    t.string  :hair
    t.string  :headwear
    t.string  :eyewear
    t.string  :mouth_prop

    t.string  :image

    t.timestamps
  end
  end  # Schema.define
end # method up

end # class CreateDb




def self.connect

      config =   { adapter:  'sqlite3',
                   database: 'artbase.db',
                    }


    ## todo/check/fix: move jruby "hack" to attic - why? why not?
    ## todo/check: use if defined?( JRUBY_VERSION ) instead ??
    ## if RUBY_PLATFORM =~ /java/ && config[:adapter] == 'sqlite3'
      # quick hack for JRuby sqlite3 support via jdbc
    ##  puts "jruby quick hack - adding jdbc libs for jruby sqlite3 database support"
    ##  require 'jdbc/sqlite3'
    ##  require 'active_record/connection_adapters/jdbc_adapter'
    ##  require 'active_record/connection_adapters/jdbcsqlite3_adapter'
    ## end

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


specs = parse_csv( <<TXT )

kind, gender, skin, hair, headwear, eyewear, mouth_prop

Ape,  Male,   ,  , Do-rag,   Eye Mask,   Vape
Ape,  Female, ,  , Do-rag,   Eye Mask,   Vape

Zombie, Male,   ,   Stringy Hair, , Regular Shades,
Zombie, Female, ,  Stringy Hair, , Regular Shades,

Human,   Male,   3,  , Beanie
Human,   Female, 3,  , Beanie

Human,   Female,   2, Wild Hair, , Big Shades, Cigarette
Human,   Male,     2, Wild Hair, , Big Shades, Cigarette
TXT

pp specs


specs.each_with_index do |attributes,i|

    spec = []
    type = "#{attributes['kind']} #{attributes['gender']} #{attributes['skin']}"

    spec << type
    spec +=  attributes.values[3..-1]

    ## remove all empties
    spec = spec.filter { |str| str && str.size > 0 }
    pp spec

   img =  Punk::Image.generate( *spec )
   img.zoom(4).save( "./tmp/punk#{i}.png")

   image = "data:image/png;base64, "
   image += Base64.strict_encode64( img.to_blob )

   puts "image:"
   puts image

   rec = Database::Metadata.new( attributes )
   rec.image = image
   rec.save!
end


Database::Metadata.all.each do |o|
  puts "o: #{o.inspect}"
end


puts "bye"