require 'cryptopunks'


ROOTDIR = '../../design.punks'

OUTDIR = "#{ROOTDIR}/i"
# OUTDIR = './tmp'


def generate( names, colors: )

  names.each do |name|

    path = "#{ROOTDIR}/#{name}.txt"
    puts "   reading #{name} (#{path})..."

    design = File.open( path, 'r:utf-8' ) { |f| f.read }
    punk = Image.parse( design, colors: colors )

    name = name.gsub( '/', '_' )  ## flatten dirs in name
    punk.save( "#{OUTDIR}/#{name}.png" )
    punk.zoom(4).save( "#{OUTDIR}/#{name}x4.png" )
  end
end


generate( ['more/robot-male', 'more/robot-female'],
          colors: ROBOT_COLORS )

generate( ['more/vampire-male', 'more/vampire-female'],
          colors: VAMPIRE_COLORS )

generate( ['more/mummy-male', 'more/mummy-female'],
          colors: MUMMY_COLORS )


generate( ['more/orc-male', 'more/orc-female'],
          colors: ORC_COLORS )

generate( ['more/skeleton-male', 'more/skeleton-female'],
          colors: SKELETON_COLORS )

generate( ['more/demon-male', 'more/demon-female'],
          colors: DEMON_COLORS )



generate( ['original/zombie-male', 'more/zombie-female'],
          colors: ZOMBIE_COLORS )

generate( ['original/ape-male', 'more/ape-female'],
          colors: APE_COLORS )

generate( ['original/alien-male', 'more/alien-female'],
          colors: ALIEN_COLORS )



humans = ['original/human-male', 'original/human-female']
humans.each do |name|
  path = "#{ROOTDIR}/#{name}.txt"
  puts "   reading #{name} (#{path})..."

  design = File.open( path, 'r:utf-8' ) { |f| f.read }
  HUMAN_COLORS.each do |skin_tone,colors|
    punk = Image.parse( design, colors: colors )

    name = name.gsub( '/', '_' )  ## flatten dirs in name
    punk.save( "#{OUTDIR}/#{name}_#{skin_tone}.png" )
    punk.zoom(4).save( "#{OUTDIR}/#{name}_#{skin_tone}x4.png" )
  end
end



puts "bye"

