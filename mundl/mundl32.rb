###############
#  to run use:
#    $ ruby ./mundl32.rb

$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'

###
# try again with "original" 32x32px mundl (from wieners no. 1)


mundl = Image.read( './mundl-32x32.png' )


mundl.zoom(4).save( './tmp/mundl32@4x.png' )
mundl.zoom(8).save( './tmp/mundl32@8x.png' )


#####
#  variant i)  -  sketch 1px, line 1px

sketch = mundl.sketch( 1, line: 1 )
sketch.save( './tmp/sketch32.png' )
sketch.zoom(8).save( './tmp/sketch32@8x.png' )

sketch_invert = sketch.invert
sketch_invert.save( './tmp/sketch32-invert.png' )
sketch_invert.zoom(8).save( './tmp/sketch32-invert@8x.png' )


#####
#  variant ii)  -  sketch 4px, line 1px

sketch = mundl.sketch( 4, line: 1 )
sketch.save( './tmp/sketch32_ii.png' )
sketch.zoom(4).save( './tmp/sketch32_ii@4x.png' )

sketch_invert = sketch.invert
sketch_invert.save( './tmp/sketch32_ii-invert.png' )
sketch_invert.zoom(4).save( './tmp/sketch32_ii-invert@4x.png' )

sketch_color = mundl.sketch( 4, line: 1, colorize: true )
sketch_color.save( './tmp/sketch32_ii-color.png' )
sketch_color.zoom(4).save( './tmp/sketch32_ii-color@4x.png' )


puts "bye"