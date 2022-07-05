require 'punks'


##
#  setup 10 monk skin tone archetypes

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



def derive_color_map( hex )
  color = Color.from_hex( hex )

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

  color_map = {
     '#ead9d9'  =>   color,
     '#ffffff'  =>   lighter,
     '#a58d8d'  =>   darkest,
     '#c9b2b2'  =>   darker
  }
  color_map
end




patch = {}

WHITE = Color.parse( '#ffffff')

base = Punk::Sheet.find_by( name: 'Male 4' )


colors.each do |name, hex|
  color_map = derive_color_map( hex )
  punk = base.change_colors( color_map )

  punk[10,12] = WHITE     # left eye dark-ish pixel to white
  punk[15,12] = WHITE     # right exe ---

  patch[ "malemst#{name}" ] = punk
end




specs = Csv.parse( <<TXT )
  Crazy Hair, Smile
  Wild Hair, Heart Shades
  Heart Shades, Birthday Hat, Bubble Gum
  Headband, Pipe
  Pipe, 3D Glasses, Cap Forward
  Nerd Glasses, Beanie
  Wild Hair, Horned Rim Glasses, Earring
  Mohawk Dark, VR
  Hoodie
TXT

pp specs


punks = ImageComposite.new( 10, 10 )

## note: start with a no-attribute (e.g. [[]]) punk
([[]]+specs).each do |more_attributes|
  %w[01 02 03 04 05 06 07 08 09 10].each do |type|
    attributes = ["Male MST#{type}"] + more_attributes
    pp attributes

    punk = Punk::Image.generate( *attributes, patch: patch )
    punks << punk.mirror
  end
end




punks.save( "./tmp/monks.png" )
punks.zoom(4).save( "./tmp/monks@4x.png" )


puts "bye"
