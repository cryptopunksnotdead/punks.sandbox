###############################
# to run use:
#    $  ruby ./skintones.rb



require 'punks'


###
#  (dr.) monk's skin tones (harvard university)
#            sponsored / funded by google a.i. research
#    see https://skintone.google/get-started


colors = {
 '01' => '#f6ede4',    ## lightest
 '02' => '#f3e7db',
 '03' => '#f7ead0',
 '04' => '#eadaba',
 '05' => '#d7bd96',
 '06' => '#a07e56',
 '07' => '#825c43',
 '08' => '#604134',
 '09' => '#3a312a',
 '10' => '#292420',    ## darkest
}


composite = ImageComposite.new( 10, 6 )


## first row add 8 "classic" plus two empties
(1..4).to_a.reverse.each do |type|
  composite << Punk::Sheet.find_by( name: "Male #{type}" )
  composite << Punk::Sheet.find_by( name: "Female #{type}" )
end

composite << Image.new( 24, 24 )
composite << Image.new( 24, 24 )




base_m = Punk::Sheet.find_by( name: 'Male 4' )
base_f = Punk::Sheet.find_by( name: 'Female 4' )


def derive_color_map( hex, name: )
  color = Color.from_hex( hex )

  print "==> %-20s" % name
  print " - "
  print Color.format( color )
  print "\n"

  hsl  = Color.to_hsl( color )
  pp hsl

  h, s, l = hsl
  h = h % 360   # make always positive (might be -50 or such)
  pp [h,s,l]

  darker   = Color.from_hsl(
    h,
    [0.0, s-0.05].max,
    [0.14, l-0.1].max)

  ## sub one degree on hue on color wheel (plus +10% on lightness??)
  darkest = Color.from_hsl(
                 (h-1) % 360,
                 s,
                 [0.05, l-0.1].max)


  lighter = Color.from_hsl(
                  (h+1) % 360,
                  s,
                  [1.0, l+0.1].min)

  puts "  color    #{Color.format( Color.from_hsl(h,s,l,255))}"
  puts "  darker   #{Color.format( darker )}"
  puts "  darkest  #{Color.format( darkest )}"
  puts "  lighter   #{Color.format( lighter )}"

  color_map = {
     '#ead9d9'  =>   color,
     '#ffffff'  =>   lighter,
     '#a58d8d'  =>   darkest,
     '#c9b2b2'  =>   darker
  }
  color_map
end


colors.each do |name, hex|
  color_map = derive_color_map( hex, name: name )
  punk = base_m.change_colors( color_map )

  composite << punk

  name = name.gsub( ' ', '_')
  punk.save( "./tmp/attributes/male_#{name}.png" )
  punk.zoom(4).save( "./tmp/male_#{name}@4x.png" )


  ## for female - change lips to all black (like in male for now) - why? why not?
  color_map[ '#711010' ] = '#000000'
  punk = base_f.change_colors( color_map )

  composite << punk

  name = name.gsub( ' ', '_')
  punk.save( "./tmp/attributes/female_#{name}.png" )
  punk.zoom(4).save( "./tmp/female_#{name}@4x.png" )
end



WHITE = Color.parse( '#ffffff')

def patch_male( punk )
   punk[10,12] = WHITE     # left eye dark-ish pixel to white
   punk[15,12] = WHITE     # right exe ---
   punk
end

def patch_female( punk )
  punk[10,13] = WHITE     # left eye dark-ish pixel to white
  punk[15,13] = WHITE     # right exe ---
  punk
end



## first row add 8 "classic" plus two empties
(1..4).to_a.reverse.each do |type|
  punk = Punk::Sheet.find_by( name: "Male #{type}" )
  composite << patch_male( punk )

  punk = Punk::Sheet.find_by( name: "Female #{type}" )
  composite << patch_female( punk )
end

composite << Image.new( 24, 24 )
composite << Image.new( 24, 24 )



colors.each do |name, hex|
  color_map = derive_color_map( hex, name: name )
  punk = base_m.change_colors( color_map )

  composite << patch_male( punk )

  name = name.gsub( ' ', '_')
  punk.save( "./tmp/attributes/male_#{name}-ii.png" )
  punk.zoom(4).save( "./tmp/male_#{name}-ii@4x.png" )


  ## for female - change lips to all black (like in male for now) - why? why not?
  color_map[ '#711010' ] = '#000000'
  punk = base_f.change_colors( color_map )

  composite << patch_female( punk )

  name = name.gsub( ' ', '_')
  punk.save( "./tmp/attributes/female_#{name}-ii.png" )
  punk.zoom(4).save( "./tmp/female_#{name}-ii@4x.png" )
end








composite.save( "./tmp/skintones.png" )
composite.zoom(2).save( "./tmp/skintones@2x.png" )
composite.zoom(4).save( "./tmp/skintones@4x.png" )



puts "bye"
