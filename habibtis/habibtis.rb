require 'punks'



patch = {
  'niquabblack' => Image.read( './attributes/niquab-black.png' ),
  'niquabblue'  => Image.read( './attributes/niquab-blue.png' ),
}


specs = Csv.parse( <<TXT )
  Female 1,  Niquab Black
  Female 3,  Niquab Blue
  Female 3,  Niquab Black
  Female 1,  Niquab Blue
  Female 2,  Niquab Black, VR
  Female 2,  Niquab Blue,  Big Shades
TXT

pp specs


punks = ImageComposite.new( 3, 2, background: '#ffbf00' )

## note: start with a no-attribute (e.g. [[]]) punk
specs.each do |attributes|
  pp attributes

  punk = Punk::Image.generate( *attributes, patch: patch )
  punks << punk.mirror
end


punks.save( "./tmp/habibtis.png" )
punks.zoom(8).save( "./tmp/habibtis@8x.png" )


puts "bye"
