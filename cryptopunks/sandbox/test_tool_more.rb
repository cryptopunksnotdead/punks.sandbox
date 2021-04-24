###
#  to run use
#     ruby -I ./lib sandbox/test_tool_more.rb


require 'cryptopunks'


pp ARGV

=begin
args = ['--file', './more-punks-1.png',
        '--offset', '10000',
        '--dir', './i',
        '0', '18', '40', '88'
       ]
=end

args = ['--file', './more-punks-2.png',
        '--offset', '10100',
        '--dir', './i',
        '0', '79', '80', '90'
       ]

args += ['--zoom', '4']  if ARGV[0] == 'zoom'



Punks.main( args )

puts "bye"
