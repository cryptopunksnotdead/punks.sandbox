#######
#  to run use:
#    ruby ./sandbox/convert.rb


require 'pixelart'

###
#  see  https://github.com/chain-runners/data-exports
text = File.open( './traits.json', 'r:utf-8') { |f| f.read }

data = JSON.parse( text )

puts "#{data.size} record(s)"


data = data.sort { |l,r|  l['id'] <=> r['id'] }



## number trait type by order (starting with 1)

TYPE_SLUG = {
  'Background'     => '01-background',
  'Race'           => '02-race',
  'Face'           => '03-face',
  'Mouth'          => '04-mouth',
  'Nose'           => '05-nose',
  'Eyes'           => '06-eyes',
  'EarAccessory'   => '07-ear_accessory',
  'FaceAccessory'  => '08-face_accessory',
  'Mask'           => '09-mask',
  'HeadBelow'      => '10-head_below',
  'EyeAccessory'   => '11-eye_accessory',
  'HeadAbove'      => '12-head_above',
  'MouthAccessory' => '13-mouth_accessory',
}

TYPE_NAME = {
  'Background'     => 'Background',
  'Race'           => 'Race',
  'Face'           => 'Face',
  'Mouth'          => 'Mouth',
  'Nose'           => 'Nose',
  'Eyes'           => 'Eyes',
  'EarAccessory'   => 'Ear Accessory',
  'FaceAccessory'  => 'Face Accessory',
  'Mask'           => 'Mask',
  'HeadBelow'      => 'Head (Below)',
  'EyeAccessory'   => 'Eye Accessory',
  'HeadAbove'      => 'Head (Above)',
  'MouthAccessory' => 'Mouth Accessory',
}



def make_path( type, name )
  type_slug = TYPE_SLUG[ type ]
  if type_slug.nil?
    puts "!! ERROR - slug mapping for type not found"
    exit 1
  end

  name_slug = name.downcase.gsub( ' ', '_' ).gsub( "'", '' )

  outpath = "#{type_slug}/#{name_slug}.png"
  outpath
end



## convert traits
steps = Image.calc_sample_steps( 500, 32 )  ## from 500x500 to 32x32


meta = []   ## output meta(data) records

data.each do |rec|
  id   = rec['id']     ## int number
  type = rec['type'].strip
  name = rec['name'].strip     # note: remove trailing spaces
  # displayName = rec['displayName']
  #   note:  only human 1 to 10  have a differntdisplay name, that is,
  #                 a "generic" human 1 => human, human 2 => human, etc.
  #

  print "==> #{id} #{type} / #{name}\n"

  outpath = make_path( type, name )
  puts "   #{outpath}"

  img = Image.read( "./dl/#{id}.png" )
  if img.width != 500 || img.height != 500
    puts "!! ERROR - expected 500x500 image"
    exit 1
  end

  img = img.pixelate( steps )
  img.zoom(4).save( "./tmp/#{id}@4x.png" )
  img.save( "./tmp/#{id}.png" )
  img.save( "./attributes/#{outpath}" )

  meta << [  outpath,
             TYPE_NAME[type],
             name,
             ''
          ]
end


headers = ['path', 'type', 'name', 'more_names']
File.open( "./tmp/attributes.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"
