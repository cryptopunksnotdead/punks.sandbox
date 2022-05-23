#######
#  to run use:
#    ruby ./sandbox/download.rb


require 'webclient'



(0..2000).each do |id|
   res = Webclient.get( "https://img.chainrunners.xyz/api/v1/traits/png/#{id}.png")

   if res.status.ok?
    content_type   = res.content_type
    content_length = res.content_length

    puts "  content_type: #{content_type}, content_length: #{content_length}"

    format = if content_type =~ %r{image/jpeg}i
               'jpg'
             elsif content_type =~ %r{image/png}i
               'png'
             elsif content_type =~ %r{image/gif}i
               'gif'
             else
               puts "!! ERROR:"
               puts " unknown image format content type: >#{content_type}<"
               exit 1
             end

    ## save image - using b(inary) mode
    File.open( "./dl/#{id}.#{format}", 'wb' ) do |f|
      f.write( res.body )
    end

    delay = 1
    puts "sleeping #{delay} sec(s)..."
    sleep( delay )
 else
    puts "!! ERROR - failed to download image; sorry - #{res.status.code} #{res.status.message}"
    exit 1
 end
end

puts "bye"