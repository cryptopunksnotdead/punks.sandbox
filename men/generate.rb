###############################
#  to run use:
#
#  $ ruby ./generate.rb


require 'pixelart'


## build lookup map for pre-loaded attribute images
ATTRIBUTES = [
  ['Male 1',       'tan1'],
  ['Male 1B',       'tan2'],    ## note:   if headwear use ("smaller" base head variant)
  ['Male 2',       'nude1'],
  ['Male 2B',       'nude2'],
  ['Staring',      'eyes/staring'],
  ['Raised',       'eyes/raised'],
  ['Shades Dark',  'eyewear/shades-dark'],
  ['Daft',         'more/daft'],
  ['Earring',      'more/earring'],
  ['Cigarette',      'more/cigarette'],
  ['Goatee Black', 'beard/goatee-black'],
  ['Mohawk Black', 'hair/mohawk-black'],
  ['Elvish Golden', 'hair/elvish-golden'],
  ['Dreads Black',  'hair/dreads-black'],
  ['Snap Back Black', 'headwear/snap_back-black'],
  ['Beanie Yellow', 'headwear/beanie-yellow'],
  ['Beret Rust', 'headwear/beret-rust'],
  ['Lips',       'mouth/lips'],
  ['Pout 1',       'mouth/pout-tan'],
  ['Pout 2',       'mouth/pout-nude'],
  ['Teeth',       'mouth/teeth'],
  ['Chain',        'clothes-ii/chain'],
  ['Leather Jacket', 'clothes-ii/leather_jacket'],
  ['Turtleneck Rust', 'clothes/turtleneck-rust'],
  ['Turtleneck Violet', 'clothes/turtleneck-violet'],
  ['Turtleneck Army', 'clothes/turtleneck-army'],
  ['Turtleneck Blue', 'clothes/turtleneck-blue'],
  ['Shirt', 'clothes/shirt'],
  ['Moustache Chestnut',  'beard/moustache-chestnut'],
  ['Full Beard Chestnut', 'beard/full_beard-chestnut'],
].reduce({}) {|h,rec| h[rec[0]]=Image.read("./attributes/#{rec[1]}.png"); h }


def generate( *attributes )
  img = Image.new( 24, 24 )
  attributes.each do |attribute_name|
    attribute = ATTRIBUTES[ attribute_name ]
    if attribute.nil?
       puts "!! ERROR - attribute >#{attribute_name}< not found; sorry"
       pp attributes
       exit 1
    else
      img.compose!( attribute )
    end
  end
  img
end



men = Csv.parse( <<TXT )
 Male 1, Staring, Earring, Mohawk Black, Pout 1, Chain
 Male 2B, Staring, Snap Back Black, Lips, Turtleneck Rust
 Male 2, Raised, Elvish Golden, Lips, Cigarette, Turtleneck Violet
 Male 1B, Staring, Goatee Black, Dreads Black, Beanie Yellow, Turtleneck Army, Leather Jacket, Teeth
 Male 2B, Shades Dark,  Beret Rust, Shirt, Full Beard Chestnut, Moustache Chestnut
 Male 2, Daft, Turtleneck Blue
TXT

pp men


composite = ImageComposite.new( 3, 2, width: 24,
                                      height: 24,
                                      background: '#638596' )


men.each_with_index do |attributes,i|

  img = generate( *attributes )

  img.save( "./tmp/man#{i}.png" )
  img.zoom(4).save( "./tmp/man#{i}@4x.png" )

  composite << img
end

composite.save( "./tmp/men.png" )
composite.zoom(4).save( "./tmp/men@4x.png" )
composite.zoom(8).save( "./tmp/men@8x.png" )


puts "bye"