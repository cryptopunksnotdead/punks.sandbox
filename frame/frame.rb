$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'







frame = Image.read( "./i/frame24x24.png" )


frame.zoom( 4 ).save( "./i/frame24x24@4x.png" )


composite = ImageComposite.new( 2, 2, width: 36, height: 36 )  # 2x2 = 4


[2890, 8219, 10180, 10190].each do |id|

  frameless = Image.read( "./i/punk-#{id}.png" )

  punk = Image.new( 36, 36 )
  punk.compose!( frame )
  punk.compose!( Image.new( 24,24, '#afcaa1' ), 6, 6 )  ## add non-trasparent / opaque background first
  punk.compose!( frameless, 6, 6 )

  punk.save( "./i/framedpunk-#{id}.png" )
  punk.zoom(2).save( "./i/framedpunk-#{id}@2x.png" )
  punk.zoom(4).save( "./i/framedpunk-#{id}@4x.png" )
  punk.zoom(8).save( "./i/framedpunk-#{id}@8x.png" )

  composite << punk
end

composite.save( "./i/framedpunks.png" )
composite.zoom(2).save( "./i/framedpunks@2.png" )
composite.zoom(4).save( "./i/framedpunks@4x.png" )
composite.zoom(8).save( "./i/framedpunks@8x.png" )




composite = ImageComposite.new( 2, 2, width: 36, height: 36 )  # 2x2 = 4

[
  'mona_lisa',
  'girl_with_a_pearl_earring',
  'van_gogh_self-portrait',
  'the_scream',
].each do |slug|

  frameless = Image.read( "./i/#{slug}.png" )

  punk = Image.new( 36, 36 )
  punk.compose!( frame )
  punk.compose!( frameless, 6, 6 )

  punk.save( "./i/framed-#{slug}.png" )
  punk.zoom(2).save( "./i/framed-#{slug}@2x.png" )
  punk.zoom(4).save( "./i/framed-#{slug}@4x.png" )
  punk.zoom(8).save( "./i/framed-#{slug}@8x.png" )

  composite << punk
end


composite.save( "./i/framedpunks_ii.png" )
composite.zoom(2).save( "./i/framedpunks_ii@2.png" )
composite.zoom(4).save( "./i/framedpunks_ii@4x.png" )
composite.zoom(8).save( "./i/framedpunks_ii@8x.png" )




##
# add a logo version with padding
frameless = Image.read( "./i/mona_lisa.png" ).mirror

VR  = Punks::Sheet.find_by( name: 'VR',      gender: 'f', size: 's' )
CAP = Punks::Sheet.find_by( name: 'Cap Red', gender: 'f', size: 's' )

logo = Image.new( 48, 48 )
logo.compose!( frame, 6, 6 )
logo.compose!( frameless, 6+6, 6+6 )
logo.compose!( VR, 6+6, 6+6 )
logo.compose!( CAP, 6+5, 6+6 )
logo.zoom( 4 ).save( "./i/frame-logo@4x.png" )




puts "bye"