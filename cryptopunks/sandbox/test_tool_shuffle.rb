###
#  to run use
#     ruby -I ./lib sandbox/test_tool_shuffle.rb


require 'cryptopunks'


pp ARGV


args = ['--dir', './tmp',
      #  '--seed', '1234',
        'shuffle',
       ]

Punks.main( args )

puts "bye"
