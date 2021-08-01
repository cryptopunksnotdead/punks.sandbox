require 'cryptopunks'


ROOTDIR = '../../punks.design'

OUTDIR = "#{ROOTDIR}/i"
# OUTDIR = './tmp'

#####
# generate 4x versions of normies

['alien-male',
 'ape-male',
 'demon-male',
 'human-male_dark',
 'human-male_darker',
 'human-male_light',
 'human-male_lighter',
 'skeleton-male',
 'zombie-male',
].each do |name|

  path = "#{ROOTDIR}/i/normie_#{name}.png"
  puts "   reading #{name} (#{path})..."

  punk = Image.read( path )
  punk.zoom(4).save( "#{OUTDIR}/normie_#{name}x4.png" )
end

puts "bye"
