$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


ROOTDIR = '../../design.punks'

OUTDIR = "#{ROOTDIR}/i"
# OUTDIR = './tmp'


humans = ['8bit/male', '8bit/female']
humans.each do |name|
  path = "#{ROOTDIR}/#{name}.txt"
  puts "   reading #{name} (#{path})..."

  design = File.open( path, 'r:utf-8' ) { |f| f.read }
  HUMAN_COLORS.each do |skin_tone,colors|
    ## note: (re)use colors from punks - only once skin color needed;
    ##             select base 1 in array slot 3
    punk = Image.parse( design, colors: [colors[3]] )

    name = name.gsub( '/', '_' )  ## flatten dirs in name
    punk.save( "#{OUTDIR}/#{name}_#{skin_tone}.png" )
    punk.zoom(4).save( "#{OUTDIR}/#{name}_#{skin_tone}x4.png" )
  end
end


puts "bye"
