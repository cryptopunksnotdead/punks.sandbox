require 'pp'
require 'time'
require 'date'

require 'uri'
require 'net/http'
require 'net/https'
require 'cgi'
require 'fileutils'         ### used ??? remove??

require 'json'



BASE = "https://api.opensea.io/api/v1/assets?collection={collection}&order_direction=asc&offset={offset}&limit=1"




def download_images( range, collection, original: false )
  start = Time.now
  delay_in_s = 0.3

  range.each do |offset|
    txt = File.open( "./#{collection}/meta/#{offset}.json", "r:utf-8") { |f| f.read }
    data = JSON.parse( txt )

    assets = data['assets']
    if assets.size != 1
       puts "!! error - expection one asset per file"
       exit 1
    end

    asset = assets[0]

    puts "==> #{offset}.json  -  #{asset['name']}"

    image_src =  if original
                   asset['image_original_url']
                 else
                   asset['image_url']
                 end

    puts "    >#{image_src}<"
    if image_src.nil?
       puts "!! ERROR - no image url found (use original: #{original}):"
       pp asset
       exit 1
    end

    ## note: use a different directory to avoid size confusion!!!
    img_slug =  if original
                   'i_org'
                else
                   'i'
                end

    copy_image( image_src, "./#{collection}/#{img_slug}/#{offset}.png")

    puts "sleeping #{delay_in_s}s..."
    sleep( delay_in_s )

    stop = Time.now
    diff = stop - start

    mins = diff / 60  ## todo - use floor or such?
    secs = diff % 60
    puts "up #{mins} mins #{secs} secs (total #{diff} secs)"
  end
end


def download_meta( range, collection )
  start = Time.now
  delay_in_s = 0.3

  range.each do |offset|

    src = BASE.sub( '{collection}', collection ).
               sub( '{offset}', offset.to_s )

    dest = "./#{collection}/meta/#{offset}.json"

    puts "==> #{offset} - GET #{src}..."
    copy_json( src, dest )

    puts "sleeping #{delay_in_s}s..."
    sleep( delay_in_s )

    stop = Time.now
    diff = stop - start

    mins = diff / 60  ## todo - use floor or such?
    secs = diff % 60
    puts "up #{mins} mins #{secs} secs (total #{diff} secs)"
  end
end




def copy_json( src, dest )
  uri = URI.parse( src )

  http = Net::HTTP.new( uri.host, uri.port )

  puts "[debug] GET #{uri.request_uri} uri=#{uri}"

  headers = { 'User-Agent' => "ruby v#{RUBY_VERSION}" }


  request = Net::HTTP::Get.new( uri.request_uri, headers )
  if uri.instance_of? URI::HTTPS
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  response   = http.request( request )

  if response.code == '200'
    puts "#{response.code} #{response.message}"
    puts "  content_type: #{response.content_type}, content_length: #{response.content_length}"

    text = response.body.to_s
    text = text.force_encoding( Encoding::UTF_8 )

    data = JSON.parse( text )

    File.open( dest, "w:utf-8" ) do |f|
      f.write( JSON.pretty_generate( data ) )
    end
  else
    puts "!! error:"
    puts "#{response.code} #{response.message}"
    exit 1
  end
end


def copy_image( src, dest )
  uri = URI.parse( src )

  http = Net::HTTP.new( uri.host, uri.port )

  puts "[debug] GET #{uri.request_uri} uri=#{uri}"

  headers = { 'User-Agent' => "ruby v#{RUBY_VERSION}" }

  request = Net::HTTP::Get.new( uri.request_uri, headers )
  if uri.instance_of? URI::HTTPS
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  response   = http.request( request )

  if response.code == '200'
    puts "#{response.code} #{response.message}"
    puts "  content_type: #{response.content_type}, content_length: #{response.content_length}"


    File.open( dest, "wb" ) do |f|
      f.write( response.body )
    end
  else
    puts "!! error:"
    puts "#{response.code} #{response.message}"
    exit 1
  end
end




