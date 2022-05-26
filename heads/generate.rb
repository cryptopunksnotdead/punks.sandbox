###############################
#  to run use:
#
#  $ ruby ./generate.rb


require 'pixelart'


## build lookup map for pre-loaded attribute images
ATTRIBUTES = [
  ['Head 1',       'tan1'],
  ['Head 2',       'nude1'],
  ['Staring',      'eyes/staring'],
  ['Raised',       'eyes/raised'],
  ['Shades Dark',  'eyewear/shades-dark'],
  ['Shades Large Dark',  'eyewear/shades_large-dark'],
  ['Shades Yellow',  'eyewear/shades-yellow'],
  ['Daft',         'more/daft'],
  ['Earring',      'more/earring'],
  ['Cigarette',      'more/cigarette'],
  ['Elvish Black', 'hair/elvish-black'],
  ['Elvish Golden', 'hair/elvish-golden'],
  ['Side Parting Black', 'hair/side_parting-black'],
  ['Side Parting Golden', 'hair/side_parting-golden'],
  ['Dreads Black',  'hair/dreads-black'],
  ['Dreads Chestnut',  'hair/dreads-chestnut'],
  ['Pig Tails Peach',  'hair/pig_tails-peach'],
  ['Pig Tails Golden',  'hair/pig_tails-golden'],
  ['Pony Tail Silver Fox',  'hair/pony_tail-silver_fox'],
  ['Fringe Peach',  'hair/fringe-peach'],
  ['Fringe Golden',  'hair/fringe-golden'],
  ['Top Knot Peach',  'hair/top_knot-peach'],
  ['Top Knot Golden',  'hair/top_knot-golden'],
  ['Buzz Cut Black',   'hair/buzz_cut-black'],
  ['Buzz Cut Chestnut',  'hair/buzz_cut-chestnut'],
  ['Buzz Cut Peach',   'hair/buzz_cut-peach'],
  ['Buzz Cut Golden',  'hair/buzz_cut-golden'],
  ['Mohawk Black', 'hair/mohawk-black'],
  ['Mohawk Chestnut',  'hair/mohawk-chestnut'],
  ['Mohawk Peach',   'hair/mohawk-peach'],
  ['Mohawk Golden',  'hair/mohawk-golden'],
  ['Snap Back Black', 'headwear/snap_back-black'],
  ['Snap Back Pink', 'headwear/snap_back-pink'],
  ['Beanie Yellow', 'headwear/beanie-yellow'],
  ['Beret Rust', 'headwear/beret-rust'],
  ['Idle 1',       'mouth/idle-tan'],
  ['Idle 2',       'mouth/idle-nude'],
  ['Pout 1',       'mouth/pout-tan'],
  ['Pout 2',       'mouth/pout-nude'],
  ['Teeth 1',       'mouth/teeth-tan'],
  ['Teeth 2',       'mouth/teeth-nude'],
  ['Chain',        'clothes-ii/chain'],
  ['Suspenders',        'clothes-ii/suspenders'],
  ['Leather Jacket', 'clothes-ii/leather_jacket'],
  ['Turtleneck Rust', 'clothes/turtleneck-rust'],
  ['Turtleneck Violet', 'clothes/turtleneck-violet'],
  ['Turtleneck Army', 'clothes/turtleneck-army'],
  ['Turtleneck Blue', 'clothes/turtleneck-blue'],
  ['Turtleneck Pink', 'clothes/turtleneck-pink'],
  ['Turtleneck Black', 'clothes/turtleneck-black'],
  ['Turtleneck White', 'clothes/turtleneck-white'],
  ['Turtleneck Yellow', 'clothes/turtleneck-yellow'],
  ['Turtleneck Gray', 'clothes/turtleneck-gray'],
  ['Shirt', 'clothes/shirt'],
  ['Tank Top', 'clothes/tank_top'],
  ['Full Beard Chestnut', 'beard/full_beard-chestnut'],
  ['Full Beard Black', 'beard/full_beard-black'],
  ['Goatee Black', 'beard/goatee-black'],
  ['Goatee Chestnut', 'beard/goatee-chestnut'],
  ['Moustache Black',  'beard/moustache-black'],
  ['Moustache Chestnut',  'beard/moustache-chestnut'],
  ['Moustache Silver Fox',  'beard/moustache-silver_fox'],

  ['Head 1B',            'plus/tan2'],
  ['Head 2B',            'plus/nude2'],
  ['Staring Brown',      'plus/eyes_staring-brown'],
  ['Staring Blue',       'plus/eyes_staring-blue'],
  ['Raised Brown',       'plus/eyes_raised-brown'],
  ['Raised Blue',        'plus/eyes_raised-blue'],
  ['Big Staring Brown',      'plus/eyes_staring_big-brown'],
  ['Big Staring Blue',       'plus/eyes_staring_big-blue'],
  ['Big Raised Brown',       'plus/eyes_raised_big-brown'],
  ['Big Raised Blue',       'plus/eyes_raised_big-blue'],
  ['Hot Lipstick',             'plus/lipstick-red'],
  ['Purple Lipstick',           'plus/lipstick-purple'],
  ['Pink Lipstick',           'plus/lipstick-pink'],
  ['Black Lipstick',           'plus/lipstick-black'],

  ['Frown 1',       'plus/frown-tan'],
  ['Frown 2',       'plus/frown-nude'],
  ['Smile 1',       'plus/smile-tan'],
  ['Smile 2',       'plus/smile-nude'],
  ['Smile w/ Hot Lipstick',       'plus/smile_lipstick-red'],
  ['Smile w/ Purple Lipstick',   'plus/smile_lipstick-purple'],
  ['Teeth w/ Smile 1',       'plus/teeth_smile-tan'],
  ['Teeth w/ Smile 2',       'plus/teeth_smile-nude'],
  ['Teeth w/ Smile w/ Hot Lipstick',  'plus/teeth_smile_lipstick-red'],


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
      ##  quick hack for headwear
      ##   cut-off/clean top overflow hair/head
      if attribute_name.start_with?( 'Beret' ) ||
         attribute_name.start_with?( 'Snap Back' )
          img[6,4] = 0
          img[7,3] = 0
      elsif attribute_name.start_with?( 'Beanie' ) ||
            attribute_name.start_with?( 'Dreads' )
          img[6,4] = 0
      else
      end
      img.compose!( attribute )
    end
  end
  img
end


heads = Csv.parse( <<TXT )
 Head 1, Staring Brown, Earring, Mohawk Black, Pout 1, Chain
 Head 2, Staring Brown, Turtleneck Rust, Snap Back Black, Idle 2
 Head 2, Raised Blue, Turtleneck Violet, Elvish Golden, Idle 2, Cigarette
 Head 1, Staring Brown, Turtleneck Army, Leather Jacket, Goatee Black, Dreads Black, Beanie Yellow, Teeth 1
 Head 2, Shades Dark,  Beret Rust, Shirt, Full Beard Chestnut, Moustache Chestnut
 Head 2, Daft, Turtleneck Blue
TXT

pp heads


composite = ImageComposite.new( 3, 2, width: 24,
                                      height: 24,
                                      background: '#638596' )


heads.each_with_index do |attributes,i|

  img = generate( *attributes )

  img.save( "./tmp/head.#{i}.png" )
  img.zoom(4).save( "./tmp/head.#{i}@4x.png" )

  composite << img
end

composite.save( "./tmp/heads.png" )
composite.zoom(4).save( "./tmp/heads@4x.png" )
composite.zoom(8).save( "./tmp/heads@8x.png" )



heads = Csv.parse( <<TXT )
 Head 1, Shades Large Dark, Earring, Beanie Yellow, Pout 1, Turtleneck Rust
 Head 2B, Big Staring Brown, Black Lipstick, Turtleneck Rust, Suspenders, Elvish Black, Beret Rust
 Head 2, Staring Brown,  Side Parting Golden, Snap Back Pink, Idle 2,   Cigarette, Tank Top
 Head 2, Shades Large Dark, Mohawk Chestnut, Goatee Chestnut, Teeth 2, Cigarette, Tank Top
 Head 2B, Big Staring Blue, Top Knot Peach, Hot Lipstick, Earring, Turtleneck Army, Suspenders, Chain
 Head 2, Shades Large Dark, Moustache Silver Fox, Pony Tail Silver Fox, Turtleneck Black
# Head 2,  Mohawk Peach, Shades Yellow, Idle 2, Turtleneck Blue, Suspenders
TXT

pp heads


composite = ImageComposite.new( 3, 2, width: 24,
                                      height: 24,
                                      background: '#638596' )


heads.each_with_index do |attributes,i|

  img = generate( *attributes )

  img.save( "./tmp/head-vol2.#{i}.png" )
  img.zoom(4).save( "./tmp/head-vol2.#{i}@4x.png" )

  composite << img
end

composite.save( "./tmp/heads_vol2.png" )
composite.zoom(4).save( "./tmp/heads_vol2@4x.png" )
composite.zoom(8).save( "./tmp/heads_vol2@8x.png" )





heads = Csv.parse( <<TXT )
 Head 1, Staring Brown, Idle 1
 Head 1B, Big Staring Brown, Idle 1
 Head 1, Raised Brown, Frown 1
 Head 1B, Big Raised Brown, Frown 1

 Head 1, Staring Brown, Idle 1, Turtleneck Black, Dreads Black, Goatee Black
 Head 1B, Big Staring Brown, Teeth w/ Smile w/ Hot Lipstick, Top Knot Peach, Tank Top
 Head 1, Raised Brown, Smile 1, Buzz Cut Black, Shirt
 Head 1B, Big Raised Brown, Hot Lipstick, Buzz Cut Peach, Turtleneck Black, Earring, Cigarette

 ## row 2
 Head 2, Staring Brown, Teeth 2
 Head 2B, Big Staring Brown, Teeth 2
 Head 2, Raised Brown, Pout 2
 Head 2B, Big Raised Brown, Pout 2

 Head 2, Staring Brown, Idle 2, Turtleneck Gray, Dreads Chestnut, Goatee Chestnut
 Head 2B, Big Staring Brown, Teeth w/ Smile w/ Hot Lipstick, Top Knot Golden, Tank Top
 Head 2, Raised Brown, Smile 2,  Buzz Cut Chestnut, Shirt
 Head 2B, Big Raised Brown, Black Lipstick, Buzz Cut Golden, Turtleneck Rust, Earring, Cigarette

 ## row 3
 Head 1, Staring Blue, Smile 1
 Head 1B, Big Staring Blue, Smile 1
 Head 1, Raised Blue, Teeth w/ Smile 1
 Head 1B, Big Raised Blue, Teeth w/ Smile 1

 Head 1, Staring Blue, Mohawk Black, Earring, Turtleneck Army, Leather Jacket, Full Beard Black, Moustache Black
 Head 1B, Big Staring Blue, Hot Lipstick, Earring, Mohawk Peach, Turtleneck Black
 Head 1, Raised Blue, Frown 1, Turtleneck Black, Elvish Black
 Head 1B, Big Raised Blue, Black Lipstick,  Turtleneck Black, Chain, Side Parting Black

 ## row 4
 Head 2, Staring Blue, Smile 2
 Head 2B, Big Staring Blue, Smile 2
 Head 2, Raised Blue, Teeth w/ Smile 2
 Head 2B, Big Raised Blue, Teeth w/ Smile 2

 Head 2, Staring Blue, Mohawk Chestnut, Turtleneck White, Leather Jacket, Full Beard Chestnut, Moustache Chestnut, Earring
 Head 2B, Big Staring Blue, Pink Lipstick, Mohawk Golden, Earring, Turtleneck Gray
 Head 2, Raised Blue, Frown 2, Turtleneck Violet, Elvish Golden
 Head 2B, Big Raised Blue, Smile w/ Purple Lipstick, Turtleneck Pink, Chain, Side Parting Golden
TXT

pp heads


composite = ImageComposite.new( 8, 4, width: 24,
                                      height: 24,
                                      background: '#ffbf00' )

heads.each_with_index do |attributes,i|

  img = generate( *attributes )

  img.save( "./tmp/head-ii.#{i}.png" )
  img.zoom(4).save( "./tmp/head-ii.#{i}@4x.png" )

  composite << img
end

composite.save( "./tmp/heads_plus.png" )
composite.zoom(4).save( "./tmp/heads_plus@4x.png" )
composite.zoom(8).save( "./tmp/heads_plus@8x.png" )


puts "bye"