###############################
# to run use:
#    $  ruby ./skintones.rb



require 'cryptopunks'


colors = {
'ivory'     => '#E9CBA9',
'porcelain'  =>  '#EFD1B7',
'pale ivory' =>  '#F7DDC2',
'warm ivory' =>  '#F7E2AB',
'sand'       =>  '#EEC695',
'rose beige' =>  '#F1C088',

'limestone'  =>  '#E5BB91',
'beige'      =>  '#ECBF84',
'sienna'     =>  '#D19C7C',
'honey'      =>  '#CD9564',
'band'      =>  '#AD8B65',
'almond'     =>  '#94603B',

'chestnut'   =>  '#895434',
'bronze'     =>  '#78441F',
'umber'      =>  '#B06949',
'golden'     =>  '#7F4829',
'espresso'   =>  '#623A17',
'chocolate'  =>  '#321F11',

----------------------

'orange'     => '#F05423',
'warm red'   => '#EF483E',
'red'        => '#EE3342',
'rubine red' => '#D51B5E',
'pink'        => '#da1884',       # Barbie pink

'purple'      => '#AA4399',
'blue'        => '#462E8D',
'violet'      => '#BC9BC9',

'yellow'     => '#F8DE08',

 'gold 1' => '#ffd700',  # gold
 'gold 2' =>  '#daa520',  # goldenrod
 'gold 3' => '#b8860b',  # darkgoldenrod
}


composite = ImageComposite.new( 12, 5 )

base_m = Punks::Sheet.find_by( name: 'Male 4' )
base_f = Punks::Sheet.find_by( name: 'Female 4' )

colors.each do |name, hex|
  color = Color.from_hex( hex )

  print "%-20s" % name
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



composite.save( "./tmp/skintones.png" )
composite.zoom(2).save( "./tmp/skintones@2x.png" )



puts "bye"
