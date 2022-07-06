###############################
# to run use:
#    $  ruby ./generate_10000.rb

$LOAD_PATH.unshift( "../../cryptopunks/punks/lib" )
require 'cryptopunks'


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

base_m = Punk::Sheet.find_by( name: 'Male 4' )
base_f = Punk::Sheet.find_by( name: 'Female 4' )


colors.each do |name, hex|
  color_map = derive_color_map( hex )
  punk = base_m.change_colors( color_map )

  punk[10,12] = WHITE     # left eye dark-ish pixel to white
  punk[15,12] = WHITE     # right eye ---

  patch[ "malemst#{name}" ] = punk


  ## for female - change lips to all black (like in male for now) - why? why not?
  color_map[ '#711010' ] = '#000000'
  punk = base_f.change_colors( color_map )

  punk[10,13] = WHITE     # left eye dark-ish pixel to white
  punk[15,13] = WHITE     # right eye ---

  patch[ "femalemst#{name}" ] = punk
end




############
#  mapping classic to all human & monk skin type

monks_male = ['Male MST 10', 'Male MST 09', 'Male MST 08',
              'Male MST 07', 'Male MST 06', 'Male MST 05',
              'Male MST 04', 'Male MST 03',
              'Male MST 02', 'Male MST 01']

classic_to_monk = {
  'Male 1'   => ['Male MST 10', 'Male MST 09' ],
  'Male 2'   => ['Male MST 08', 'Male MST 07', 'Male MST 06'],
  'Male 3'   => ['Male MST 05' , 'Male MST 04', 'Male MST 03'],
  'Male 4'   => ['Male MST 02', 'Male MST 01'],
  'Female 1' => ['Female MST 10', 'Female MST 09' ],
  'Female 2' => ['Female MST 08', 'Female MST 07', 'Female MST 06'],
  'Female 3' => ['Female MST 05', 'Female MST 04', 'Female MST 03'],
  'Female 4' => ['Female MST 02', 'Female MST 01'],
  'Zombie'   => monks_male,
  'Ape'      => monks_male,
  'Alien'    => monks_male,
}



##
# note: use a seed for deterministic random number (series)
srand( 42 )


#####################################
## generate preview 20x20
composite = ImageComposite.new( 20, 20, background: '#638596' )

(0..399).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## change "classic" to all-human (Dr. Ellis) monk skin type (MST) variant
   monks = classic_to_monk[ attributes[0] ]
   attributes[0] = monks[ rand(monks.size) ]
   pp attributes

   punk = Punk::Image.generate( *attributes, patch: patch )

   composite << punk
end

composite.save( "./tmp/humans_preview.png" )
composite.zoom(2).save( "./tmp/humans_preview@2x.png" )



###################################
## generate  100x100 = 10000
composite = ImageComposite.new( 100, 100 )

(0..9999).each do |id|
   attributes = CryptopunksData.punk_attributes( id )

   ## change "classic" to all-human (Dr. Ellis) monk skin type (MST) variant
   monks = classic_to_monk[ attributes[0] ]
   attributes[0] = monks[ rand(monks.size) ]
   pp attributes

   punk = Punk::Image.generate( *attributes, patch: patch )

   composite << punk
end

composite.save( "./tmp/humans.png" )


puts "bye"