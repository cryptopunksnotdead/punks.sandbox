###############
#  to run use:
#    $ ruby ./mundl.rb

$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'


mundl = Image.read( './mundl-24x24.png' )


mundl.zoom(4).save( './tmp/mundl@4x.png' )
mundl.zoom(8).save( './tmp/mundl@8x.png' )


#####
#  variant i)  -  sketch 1px, line 1px

sketch = mundl.sketch( 1, line: 1 )
sketch.save( './tmp/sketch.png' )
sketch.zoom(8).save( './tmp/sketch@8x.png' )

sketch_invert = sketch.invert
sketch_invert.save( './tmp/sketch-invert.png' )
sketch_invert.zoom(8).save( './tmp/sketch-invert@8x.png' )


#####
#  variant ii)  -  sketch 4px, line 1px

sketch = mundl.sketch( 4, line: 1 )
sketch.save( './tmp/sketch_ii.png' )
sketch.zoom(4).save( './tmp/sketch_ii@4x.png' )

sketch_invert = sketch.invert
sketch_invert.save( './tmp/sketch_ii-invert.png' )
sketch_invert.zoom(4).save( './tmp/sketch_ii-invert@4x.png' )

sketch_color = mundl.sketch( 4, line: 1, colorize: true )
sketch_color.save( './tmp/sketch_ii-color.png' )
sketch_color.zoom(4).save( './tmp/sketch_ii-color@4x.png' )


puts "bye"