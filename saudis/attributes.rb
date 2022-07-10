$LOAD_PATH.unshift( "../../pixelart/pixelart/lib" )
require 'pixelart'

attributes = {
## Heads
 'Light 1' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtklEQVRIiWNgGAXDHjASoeY/JfoJKfh/e2MDTklV/waCZjARYziPlCZWBVB5fD7EawHc8C/PrhNSRr4FlBhOlAWUAhZiFK3fdYqBgYGBIdDNDEOMEMDlA5TUUzZ1G4OHkRiKAmxi2ABRPsCWVPElX2SAMw6gaZxigMsCnJlH1b+BJMuJCiJkQGzQwMDgSKYwgBw0xPqEJAtIDR4GBgqDiJjSlGgf4Eg5BOsDUlMRMRUUCqB5KgIAHCwuITa/cDMAAAAASUVORK5CYII=',
 'Light 2' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtklEQVRIiWNgGAXDHjASoeY/JfoJKfh/e2MDTklV/waCZjARYziPlCZWBVB5fD7EawHc8C/PrhNSRr4FlBhOlAWUAhZiFLXM2MzAwMDAUJPhiyFGCODyAUrqWbj9LENxiC6KAmxi2ABRPsCWVPElX2SAMw6gaZxigMsCnJlH1b+BJMuJCiJkQGzQwMDgSKYwgBw0xPqEJAtIDR4GBgqDiJjSlGgf4Eg5BOsDUlMRMRUUCqB5KgIAEEcvTXc8NnAAAAAASUVORK5CYII=',
 'Darker 2' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAtUlEQVRIiWNgGAXDHjASoeY/JfoJKfhfaC+LU7L/4GOCZjARY7iUCD9WBVB5fD7EawHc8GdvPhJSRr4FlBhOlAWUAhZiFJ26/ZiBgYGBwUxVFkOMEMDlA5TUc/QZA4O5LCeKAmxi2ACuJIY3eSIDQkkVZxxANVIMcFmA00X9Bx+TZDlRkYwMiA06GBgcyRQGkIOGWJ+QZAGpwcPAQGEQEVOaEu0DHCmHYH1AaioipoJCATRPRQA6VS3JBLgqewAAAABJRU5ErkJggg==',


## Facial Hair
 'Normal Brown Beard & Mustache' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAaklEQVRIiWNgGAWjYBSMglEwBAAjPklnSZb/DAwMjDzCAgwbr7whywImItT8//L2Az4H4AUsRDqEoEGUWsDgLMnC8JSJFc6X/vebKhYwMiC5nlhDkQExcYAvIeBNJMRaADMI3TCChg8PAADd6xC7QG7FfAAAAABJRU5ErkJggg==',
 'Messy White Beard'  => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAXElEQVRIie2RSwrAMAhENRT0/qfVlV2UQAIxpptCYR4Igjr+iAAAAIAP4CrBzLobWb2qpvXtcJAuzoNlTSeuF+KZYNDmEicbVGfcxssfRDxDu/vyByJCzKXMj7kBQtwQDHofincAAAAASUVORK5CYII=',
 'Short White Beard'  =>  'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAW0lEQVRIie2SwQoAIQhEbVnQ//9aPbWnwA3WZukUzDsFyrwsRQghhBxAq4ru3nOPqkpEvHrMrBRcwCX6OMzhufbFDQigoF3BID8pJF0J2hT0exLkD6pFKJeEQDz1Vw/7DjytYQAAAABJRU5ErkJggg==',
  'Stylish Mustache' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAASUlEQVRIiWNgGAWjYBSMglEwCgYL+P//PwMDA8N/LJggYCHBHkYNaU64oTeefmckQS9+APUBWYBYV/xnYGBgRLeIkZF6nhjBAACZWRL8XsTmNAAAAABJRU5ErkJggg==',


## Headwear
 'Red Shemagh & Agal'  => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAqUlEQVRIie1UQQ7DIAxLYF8p9+7/b4B795bOu6yTYA6Fih6m1VIUKUJ2TCAiF/4DAMyIbgIAsBzd9Dl3SKBGXor0ClRJWba4dRPIiqo7LdlcJZzlaLPemqtgd3/AAcWtLCQfMK+LRB+6iO7PB62zGSD5oCIi87o0C6jSEXzNAOndeQ95DZlA8mEYcQb2/mu/m0WLgLkGhgiQH/pbDtiOGSewt4ovB6c6eAEZZo6zhsvaXwAAAABJRU5ErkJggg==',
 'Brown Shemagh & Agal' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAmUlEQVRIie2TWxJAMAxFb4yNsA02wIJ1A7oNXUp9eExL2k5QH8b5MkROcwXw83kIAKy1wQKjVfghQFXTLRdEbEERsyeaA4A1WkULyouNOQk7AhsREUkEXq8j7ATTOIi7123P3mcF6wv8VxNyisjJXySQTkAAsK3gHbw1FW6PXODyxOljguQPJBbkiMcT5OIdQa54dkFOfkGSGXvmMfEUVW5uAAAAAElFTkSuQmCC',
 'Red Shemagh'  => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAnElEQVRIie2UwQoCMQxE0+Zbmrv+/zc0d/0WHU8rbpmNG6kHcQdCoC3zGGgicug/BGCzem0AANZ7bc93HwEi8xGSBYSmrKcAWfNeWw4wM0FZAK9yNSx3e3W+X+l5HQ9cDafbJeMdiiWAqxURkQyoFB54TABXk6x5pBXA1aYZr8R+TzTdrPYANtfAFAD537+VgE3oPMC7VXwk+GqCB5POyzSgVCG6AAAAAElFTkSuQmCC',
 'White Shemagh & Agal' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAcklEQVRIie2RQQrAMAgE15L/f9neSiir1qA9hMwpoGFWBQ7bIwCgql6PV5TnIUIbriCAa/5Qx1j9SHrpCFRgjbsCFQQ3oVihrBUBxshZ2JHz8ZMCoCg9E5SmZ4JyLEHZJLOgfD1vQQu/CVrWMwvaOIKQGwRhECvRC0yWAAAAAElFTkSuQmCC',


## Eyewear
 'Regular Pixel Shades' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAATElEQVRIie2PwQoAIAhDXf//z+tQgYnWoVOwdxHm2NRMCPE/qBYkDQBfs1rpDuEk10SmV5QFPmh+k3lSfTv0UDAM7hNfGvVbkRDiZzpfrCH/gTYLqwAAAABJRU5ErkJggg==',
 'Big Purple Shades'    => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAZUlEQVRIiWNgGAWjYBQMfcBIQP4/Dj24xEmy4D8DAwNDJo8rXGD6l91wNhZxrGax4DT9/39GRkbG/8qMYtgchU0cK8BpASMjxEGKIqwIwc8IJi5xbK4hBJDDm5EI8VEwCkYBvQEAMigS3fpBCRkAAAAASUVORK5CYII=',
 'Nerd Glasses' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAQElEQVRIiWNgGAWjYBQMfcBIhJr/WPRgEyPZArghDbdvQWhVNQYcYjjNYcJjASMOjcT4miTFFAXRKBgFo2A4AACcqwsJ54Si9AAAAABJRU5ErkJggg==',
  'Stylish Nerd Glasses' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAARUlEQVRIiWNgGAWjYBQMfcBIhJr/WPRgEyPZArghn1YXMzAwMDDwhfYy4BDDaQ4THgsYcWgkxtckKaYoiEbBKBgFwwEAAJpbCwl+/AqTAAAAAElFTkSuQmCC',

## Mouth pieces
 'Natural Cigarette' => 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAO0lEQVRIiWNgGAWjYBSMAhRw7969BnQxJlpbOmrBwFsw9AEjmfr+Hzt2DENQZmoCg9zSW+SaOQqGKgAAxHkJJmqeTccAAAAASUVORK5CYII=',
}




def slugify( name )
   name = name.downcase.gsub( /[^a-zA-Z0-9 _-]/, '' )
   name = name.gsub( /[ ]+/, '_' )
   name
end

attributes.each do |name,blob|
  img = Image.parse_base64( blob )
  slug = slugify( name )
  img.save( "./tmp/attributes/#{slug}.png" )
  img.zoom(8).save( "./tmp/attributes/#{slug}@8x.png" )
end



## saudi no. 0
##  - Head:        Light 1
##  - Facial Hair: Normal Brown Beard & Mustache
##  - Headwear:    Red Shemagh & Agal
##  - Eyewear:     Regular Pixel Shades

## saudi no. 1
##  - Head:        Light 1
##  - Facial Hair: Messy White Beard
##  - Headwear:    Brown Shemagh & Agal
##  - Eyewear:     Big Purple Shades


##  saudi no. 2
##   - Head:         Light 1
##   - Facial Hair:  -
##   - Headwear:     Red Shemagh
##   - Eyewear:      Nerd Glasses
##   - Mouth piece:  Natural Cigarette


##  saudi no. 3
##   - Head:          Light 2
##   - Facial Hair:   Short White Beard
##   - Headwear:      Red Shemagh & Agal
##   - Eyewear:       Stylish Nerd Glasses

##  saudi no.  4
##   - Head:         Light 2
##   - Facial Hair:  Normal Brown Beard & Mustache
##   - Headwear:     White Shemagh & Agal
##   - Eyewear:
##   - Mouth piece:

##  saudi no.  5
##   - Head:          Darker 2
##   - Facial Hair:   Stylish Mustache
##   - Headwear:      Red Shemagh
##   - Eyewear:
##   - Mouth piece:





##  saudi no.
##   - Head:
##   - Facial Hair:
##   - Headwear:
##   - Eyewear:
##   - Mouth piece:

##  saudi no.
##   - Head:
##   - Facial Hair:
##   - Headwear:
##   - Eyewear:
##   - Mouth piece:

##  saudi no.
##   - Head:
##   - Facial Hair:
##   - Headwear:
##   - Eyewear:
##   - Mouth piece:


puts "bye"

