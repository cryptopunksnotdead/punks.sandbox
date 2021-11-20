##################
#  special case
#    convert via magick from jpg format (with .png extension) to .png !!!
#
# to run use:
#    $ ruby thecryptogenius/convert.rb


collection = 'thecryptogenius'

(0..89).each do |id|

  cmd = "magick convert #{collection}/i_jpg/#{id}.png #{collection}/i/#{id}.png "
  puts "==> #{id} - #{cmd}"
  system( cmd )
end

puts "bye"