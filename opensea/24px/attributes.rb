####
# to run use:
#   ruby 24px/attributes.rb



require 'json'
require 'csvreader'



recs = []

(0..9899).each do |id|

  txt = File.open( "./24px/meta/#{id}.json", "r:utf-8") { |f| f.read }
  data = JSON.parse( txt )

  assets = data['assets']
  if assets.size != 1
     puts "!! error - expection one asset per file"
     exit 1
  end

  asset = assets[0]

  name = asset['name']

  # e.g.  PixelCat 1  => 1

  num  =  if m=name.match( /^PixelCat (?<num>[0-9]+)$/ )
                m[:num].to_i( 10 )   ## note: add base 10 (e.g. 015=>15)
          else
            puts "!! ERROR - cannot find cat id number:"
            pp asset
            exit 1
          end

  puts "==> #{id}  - #{name} => #{num}"

  rec = { 'id' => num }

  asset['traits'].each do |trait|
    trait_type  = trait['trait_type']
    trait_value = trait['value']

    next if ['id', 'collection'].include?( trait_type )

    rec[ trait_type ] = trait_value
  end
  recs << rec
end


puts "  #{recs.size} record(s)"


## sort by id
recs = recs.sort { |l,r|  l['id'] <=> r['id'] }



rows = recs.map do |rec|
                   ## convert to values
                   id      = rec.delete( 'id' )
                   face    = rec.delete( 'face' )

                   hat     = rec.delete( 'hat')
                   clothes = rec.delete( 'clothes' )

                   if rec.size > 0
                      puts "!! ERROR: unexpected trait types:"
                      pp rec
                      exit 1
                   end

                   ## note: dropped count for now - keep? why? why not?

                   ## note: start index zero-based 0..9899 (not with one e.g. 1..9900)
                   [id-1, face, hat, clothes]
                 end



headers = ['id',
           'face',
           'hat',
           'clothes']


batches = [
  ['0-999',     rows[0..999]],
  ['1000-1999', rows[1000..1999]],
  ['2000-2999', rows[2000..2999]],
  ['3000-3999', rows[3000..3999]],
  ['4000-4999', rows[4000..4999]],
  ['5000-5999', rows[5000..5999]],
  ['6000-6999', rows[6000..6999]],
  ['7000-7999', rows[7000..7999]],
  ['8000-8999', rows[8000..8999]],
  ['9000-9899', rows[9000..9899]]]


batches.each do |batch|
   path = "./data-24px/#{batch[0]}.csv"
   rows = batch[1]

   File.open( path, 'w:utf-8') do |f|
     f.write( headers.join( ', ') )
     f.write( "\n" )
     rows.each do |values|
       ## assert row ids match up
      f.write( values.join( ', ') )
      f.write( "\n" )
    end
  end
end


puts "bye"


