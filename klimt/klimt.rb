$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )

require 'cryptopunks'




klimt_the_kiss_90 = Image.read( './i/klimt-the-kiss-90-degree.png' )
klimt_judith      = Image.read( './i/klimt-judith.png' )


HEART_SHADES = Punks::Sheet.find_by( name: 'Heart Shades', gender: 'f' )
PIPE         = Punks::Sheet.find_by( name: 'Pipe', gender: 'f' )
CIGARETTE    = Punks::Sheet.find_by( name: 'Cigarette', gender: 'f' )
_3D_GLASSES  = Punks::Sheet.find_by( name: '3D Glasses',  gender: 'f' )
BUBBLE_GUM   = Punks::Sheet.find_by( name: 'Bubble Gum',  gender: 'f' )

NERD_GLASSES    = Punks::Sheet.find_by( name: 'Nerd Glasses',  gender: 'f' )
VR             = Punks::Sheet.find_by( name: 'VR', gender: 'f' )
SMALL_SHADES   = Punks::Sheet.find_by( name: 'Small Shades', gender: 'f' )
REGULAR_SHADES = Punks::Sheet.find_by( name: 'Regular Shades', gender: 'f' )
BIG_SHADES     = Punks::Sheet.find_by( name: 'Big Shades', gender: 'f' )

BIRTHDAY_HAT   = Punks::Sheet.find_by( name: 'Birthday Hat', gender: 'f' )
CAP            = Punks::Sheet.find_by( name: 'Cap', gender: 'f' )
KNITTED_CAP    = Punks::Sheet.find_by( name: 'Knitted Cap', gender: 'f' )

BOW            = Punks::Sheet.find_by( name: 'Bow', gender: 'f' )
FLOWERS        = Punks::Sheet.find_by( name: 'Flowers', gender: 'f' )

LASER_EYES     = Punks::Sheet.find_by( name: 'Laser Eyes Gold', gender: 'f' )
BUBBLE_GUM     = Punks::Sheet.find_by( name: 'Bubble Gum', gender: 'f' )

BLOND_SHORT     = Punks::Sheet.find_by( name: 'Blonde Short', gender: 'f' )
WILD_WHITE_HAIR = Punks::Sheet.find_by( name: 'Wild White Hair', gender: 'f' )

CRAZY_HAIR      = Punks::Sheet.find_by( name: 'Crazy Hair', gender: 'f' )
FRUMPY_HAIR     = Punks::Sheet.find_by( name: 'Frumpy Hair', gender: 'f' )



FLOWER_CROWN    = Punks::Sheet.find_by( name: 'Flower Crown', gender: 'f' )
BERET           = Punks::Sheet.find_by( name: 'Beret', gender: 'f' )


FRAME  = Image.read( './i/frame_black32x32_(2).png' )  ## 38x38
PADDING = 4  ## 2x2

def make_frame( img )
  framed = Image.new( FRAME.width, FRAME.height )
  framed.compose!( FRAME )
  framed.compose!( img, 3, 3 )

  ## add 4px (2p on each side transparent padding/border)
  framed_with_padding = Image.new( FRAME.width+PADDING, FRAME.width+PADDING )
  framed_with_padding.compose!( framed, PADDING/2, PADDING/2)
  framed_with_padding
end


composite = ImageComposite.new( 5, 2, width: FRAME.width+PADDING, height: FRAME.height+PADDING )



top_y = 3
top_x = 2

klimt = Image.new( 32+top_x, 32+top_y )
klimt.compose!( klimt_the_kiss_90, top_x, top_y )

composite <<  make_frame(
                klimt.crop( top_x, top_y, 32, 32 ).rotate_clockwise )

klimt = Image.new( 32+top_x, 32+top_y )
klimt.compose!( klimt_the_kiss_90, top_x, top_y )
klimt.compose!( BLOND_SHORT )
klimt.compose!( HEART_SHADES )

composite << make_frame(
               klimt.crop( top_x, top_y, 32, 32 ).rotate_clockwise )

klimt = Image.new( 32+top_x, 32+top_y )
klimt.compose!( klimt_the_kiss_90, top_x, top_y )
klimt.compose!( CRAZY_HAIR )
klimt.compose!( FLOWERS )
klimt.compose!( _3D_GLASSES )

composite << make_frame(
               klimt.crop( top_x, top_y, 32, 32 ).rotate_clockwise )


klimt = Image.new( 32+top_x, 32+top_y )
klimt.compose!( klimt_the_kiss_90, top_x, top_y )
klimt.compose!( BLOND_SHORT )
klimt.compose!( FLOWER_CROWN )
klimt.compose!( VR )

composite << make_frame(
               klimt.crop( top_x, top_y, 32, 32 ).rotate_clockwise )


klimt = Image.new( 32+top_x, 32+top_y )
klimt.compose!( klimt_the_kiss_90, top_x, top_y )
klimt.compose!( WILD_WHITE_HAIR )
klimt.compose!( REGULAR_SHADES )
## klimt.compose!( KNITTED_CAP )

composite << make_frame(
               klimt.crop( top_x, top_y, 32, 32 ).rotate_clockwise )


###
#  judith

top = 4

klimt = Image.new( 32, 32+top )
klimt.compose!( klimt_judith, 0, top )

composite << make_frame(
               klimt.crop( 0, top, 32, 32 ) )



klimt = Image.new( 32, 32+top )
klimt.compose!( klimt_judith, 0, top )
klimt.compose!( HEART_SHADES, 3 )

composite << make_frame(
               klimt.crop( 0, top, 32, 32 ))


klimt = Image.new( 32, 32+top )
klimt.compose!( klimt_judith, 0, top )
klimt.compose!( _3D_GLASSES, 3 )

composite << make_frame(
               klimt.crop( 0, top, 32, 32 ))



klimt = Image.new( 32, 32+top )
klimt.compose!( klimt_judith, 0, top )
klimt.compose!( VR, 3 )
klimt.compose!( BUBBLE_GUM, 3 )

composite << make_frame(
               klimt.crop( 0, top, 32, 32 ))


klimt = Image.new( 32, 32+top )
klimt.compose!( klimt_judith, 0, top )
klimt.compose!( BOW, 3 )
klimt.compose!( LASER_EYES, 3 )
klimt.compose!( PIPE, 3 )

composite << make_frame(
               klimt.crop( 0, top, 32, 32 ))



composite.save( "./tmp/klimt.png" )
composite.zoom(4).save( "./tmp/klimt@4x.png" )




puts "bye"