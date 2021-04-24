###
#  to run use
#     ruby -I ./lib sandbox/test_tool_more.rb


require 'cryptopunks'


pp ARGV

args = ['--file', './more-punks-1.png',
        '--offset', '10000',
        '--dir', './i',
        '0', '18', '40',
       ]

args += ['--zoom', '4']  if ARGV[0] == 'zoom'



Punks.main( args )

puts "bye"
