

## pull in meta (data records)
require_relative '../punksdata/punksdata'

colors = decode_colors( COLORS_ENCODED )

pp colors
puts " #{colors.size} color(s)"
#=>  120 color(s)


## calculate color usage by asset / attribute

color_usage = {}
colors.each_with_index do |color,i|
  color_usage[ color ] = { num: i, assets: Hash.new(0) }
end



ASSETS_ENCODED.each do |rec|
  id         = rec[:id]
  name       = rec[:name]
  hex        = rec[:hex]
  qualifier  = rec[:qualifier]  ## m/f

  img = decode_image( hex, colors: colors )

  key  = "#{'%03d' % id}"
  key << "-"
  key << name.downcase.gsub( ' ', '_' )    ## slugify name
  key << "_(#{qualifier})" if qualifier

  img.width.times do |x|
    img.height.times do |y|
       color = img[x,y]
       next if color == 0   # skip transparent color

       color_usage[ color ][ :assets ][ key ] += 1
    end
  end
end




pp color_usage


## pretty print color usage
puts
color_usage.each do |color, rec|
  num    = rec[:num]
  assets = rec[:assets]

  print "COLOR #{'%-3d' % num} - #{Color.format(color)}\n"
  print "     #{'%2d' % assets.size} asset(s):\n"
  assets.each_with_index do |(key, count), i|
     print "          #{'%-24s' % key} - #{count} pixel(s)\n"
  end
end


## generate color usage report

buf = String.new('')

color_usage.each do |color, rec|
  num    = rec[:num]
  assets = rec[:assets]

  buf << "**COLOR #{'%d' % num}** "
  buf << "![](i/color-#{'%03d' % num}.png)"
  buf << " - #{Color.format(color)}  <br>\n"

  buf << "#{'%2d' % assets.size} asset(s):\n"
  assets.each_with_index do |(key, count), i|
     buf << " · "   if i > 0   ## add separator
     buf << "#{'%s' % key} "
     buf << "![](../punksdata-assets/i/#{key.gsub(/_\((m|f)\)/, '')}.png)"
     buf << " - #{count} pixel(s)"
  end
  buf << "\n\n"
end

puts
puts  buf



puts "bye"




__END__


COLOR 0   - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%)           - BLACK
     85 asset(s):
          001-male_1               - 55 pixel(s)
          002-male_2               - 55 pixel(s)
          003-male_3               - 55 pixel(s)
          004-male_4               - 55 pixel(s)
          005-female_1             - 45 pixel(s)
          006-female_2             - 45 pixel(s)
          007-female_3             - 45 pixel(s)
          008-female_4             - 45 pixel(s)
          009-zombie               - 55 pixel(s)
          010-ape                  - 66 pixel(s)
          011-alien                - 58 pixel(s)
          013-luxurious_beard      - 55 pixel(s)
          014-clown_hair_green     - 1 pixel(s)
          015-mohawk_dark          - 21 pixel(s)
          019-cigarette            - 14 pixel(s)
          020-nerd_glasses         - 26 pixel(s)
          021-regular_shades       - 25 pixel(s)
          022-knitted_cap          - 4 pixel(s)
          024-frown                - 1 pixel(s)
          025-cap_forward          - 36 pixel(s)
          026-goat                 - 3 pixel(s)
          029-small_shades         - 18 pixel(s)
          031-classic_shades       - 22 pixel(s)
          032-vape                 - 16 pixel(s)
          034-smile                - 1 pixel(s)
          035-big_shades           - 30 pixel(s)
          036-mohawk_thin          - 9 pixel(s)
          037-beanie               - 1 pixel(s)
          040-normal_beard_black   - 33 pixel(s)
          042-normal_beard         - 3 pixel(s)
          043-vr                   - 40 pixel(s)
          044-eye_patch            - 19 pixel(s)
          045-wild_hair            - 123 pixel(s)
          046-top_hat              - 81 pixel(s)
          049-frumpy_hair          - 91 pixel(s)
          050-crazy_hair           - 2 pixel(s)
          051-police_cap           - 34 pixel(s)
          054-front_beard          - 3 pixel(s)
          056-big_beard            - 18 pixel(s)
          057-vampire_hair         - 21 pixel(s)
          058-peak_spike           - 40 pixel(s)
          059-chinstrap            - 3 pixel(s)
          060-fedora               - 11 pixel(s)
          061-earring              - 2 pixel(s)
          062-horned_rim_glasses   - 15 pixel(s)
          064-pipe                 - 22 pixel(s)
          065-messy_hair           - 60 pixel(s)
          066-front_beard_dark     - 3 pixel(s)
          067-hoodie               - 117 pixel(s)
          070-stringy_hair         - 13 pixel(s)
          071-eye_mask             - 34 pixel(s)
          074-mohawk               - 8 pixel(s)
          075-pilot_helmet         - 26 pixel(s)
          076-tassle_hat           - 39 pixel(s)
          079-straight_hair_dark   - 85 pixel(s)
          080-choker               - 5 pixel(s)
          082-regular_shades       - 23 pixel(s)
          088-frumpy_hair          - 115 pixel(s)
          089-nerd_glasses         - 22 pixel(s)
          093-messy_hair           - 60 pixel(s)
          094-clown_eyes_blue      - 2 pixel(s)
          095-pipe                 - 22 pixel(s)
          096-wild_hair            - 141 pixel(s)
          098-stringy_hair         - 11 pixel(s)
          099-dark_hair            - 109 pixel(s)
          100-eye_patch            - 19 pixel(s)
          102-classic_shades       - 22 pixel(s)
          103-eye_mask             - 34 pixel(s)
          104-clown_hair_green     - 1 pixel(s)
          110-headband             - 79 pixel(s)
          111-pigtails             - 83 pixel(s)
          113-knitted_cap          - 14 pixel(s)
          114-clown_eyes_green     - 2 pixel(s)
          115-cigarette            - 14 pixel(s)
          117-mohawk_thin          - 9 pixel(s)
          119-vr                   - 40 pixel(s)
          120-vape                 - 16 pixel(s)
          121-pink_with_hat        - 32 pixel(s)
          123-mohawk               - 8 pixel(s)
          124-big_shades           - 30 pixel(s)
          125-earring              - 2 pixel(s)
          129-half_shaved          - 76 pixel(s)
          130-mohawk_dark          - 21 pixel(s)
          131-black_lipstick       - 3 pixel(s)
          132-horned_rim_glasses   - 14 pixel(s)
COLOR 1   - #713f1d / rgb(113  63  29) - hsl( 24°  59%  28%)
      2 asset(s):
          001-male_1               - 128 pixel(s)
          005-female_1             - 93 pixel(s)
COLOR 2   - #8b532c / rgb(139  83  44) - hsl( 25°  52%  36%)
      2 asset(s):
          001-male_1               - 2 pixel(s)
          005-female_1             - 1 pixel(s)
COLOR 3   - #562600 / rgb( 86  38   0) - hsl( 27° 100%  17%)
      2 asset(s):
          001-male_1               - 4 pixel(s)
          005-female_1             - 4 pixel(s)
COLOR 4   - #723709 / rgb(114  55   9) - hsl( 26°  85%  24%)
      2 asset(s):
          001-male_1               - 2 pixel(s)
          005-female_1             - 2 pixel(s)
COLOR 5   - #ae8b61 / rgb(174 139  97) - hsl( 33°  32%  53%)
      2 asset(s):
          002-male_2               - 128 pixel(s)
          006-female_2             - 93 pixel(s)
COLOR 6   - #b69f82 / rgb(182 159 130) - hsl( 33°  26%  61%)
      2 asset(s):
          002-male_2               - 2 pixel(s)
          006-female_2             - 1 pixel(s)
COLOR 7   - #86581e / rgb(134  88  30) - hsl( 33°  63%  32%)
      3 asset(s):
          002-male_2               - 4 pixel(s)
          006-female_2             - 4 pixel(s)
          040-normal_beard_black   - 3 pixel(s)
COLOR 8   - #a77c47 / rgb(167 124  71) - hsl( 33°  40%  47%)
      2 asset(s):
          002-male_2               - 2 pixel(s)
          006-female_2             - 2 pixel(s)
COLOR 9   - #dbb180 / rgb(219 177 128) - hsl( 32°  56%  68%)
      2 asset(s):
          003-male_3               - 128 pixel(s)
          007-female_3             - 93 pixel(s)
COLOR 10  - #e7cba9 / rgb(231 203 169) - hsl( 33°  56%  78%)
      2 asset(s):
          003-male_3               - 2 pixel(s)
          007-female_3             - 1 pixel(s)
COLOR 11  - #a66e2c / rgb(166 110  44) - hsl( 32°  58%  41%)
     11 asset(s):
          003-male_3               - 4 pixel(s)
          007-female_3             - 4 pixel(s)
          026-goat                 - 7 pixel(s)
          042-normal_beard         - 33 pixel(s)
          048-handlebars           - 7 pixel(s)
          054-front_beard          - 18 pixel(s)
          056-big_beard            - 61 pixel(s)
          059-chinstrap            - 22 pixel(s)
          069-muttonchops          - 11 pixel(s)
          074-mohawk               - 11 pixel(s)
          123-mohawk               - 11 pixel(s)
COLOR 12  - #d29d60 / rgb(210 157  96) - hsl( 32°  56%  60%)
      2 asset(s):
          003-male_3               - 2 pixel(s)
          007-female_3             - 2 pixel(s)
COLOR 13  - #ead9d9 / rgb(234 217 217) - hsl(  0°  29%  88%)
      2 asset(s):
          004-male_4               - 128 pixel(s)
          008-female_4             - 93 pixel(s)
COLOR 14  - #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%)           - WHITE
      8 asset(s):
          004-male_4               - 2 pixel(s)
          008-female_4             - 1 pixel(s)
          051-police_cap           - 5 pixel(s)
          052-buck_teeth           - 2 pixel(s)
          063-headband             - 9 pixel(s)
          086-wild_white_hair      - 91 pixel(s)
          110-headband             - 8 pixel(s)
          121-pink_with_hat        - 2 pixel(s)
COLOR 15  - #a58d8d / rgb(165 141 141) - hsl(  0°  12%  60%)
      2 asset(s):
          004-male_4               - 4 pixel(s)
          008-female_4             - 4 pixel(s)
COLOR 16  - #c9b2b2 / rgb(201 178 178) - hsl(  0°  18%  74%)
      2 asset(s):
          004-male_4               - 2 pixel(s)
          008-female_4             - 2 pixel(s)
COLOR 17  - #4a1201 / rgb( 74  18   1) - hsl( 14°  97%  15%)
      1 asset(s):
          005-female_1             - 3 pixel(s)
COLOR 18  - #5f1d09 / rgb( 95  29   9) - hsl( 14°  83%  20%)
      1 asset(s):
          006-female_2             - 3 pixel(s)
COLOR 19  - #711010 / rgb(113  16  16) - hsl(  0°  75%  25%)
      2 asset(s):
          007-female_3             - 3 pixel(s)
          008-female_4             - 3 pixel(s)
COLOR 20  - #7da269 / rgb(125 162 105) - hsl( 99°  23%  52%)
      1 asset(s):
          009-zombie               - 125 pixel(s)
COLOR 21  - #9bbc88 / rgb(155 188 136) - hsl( 98°  28%  64%)
      1 asset(s):
          009-zombie               - 2 pixel(s)
COLOR 22  - #5e7253 / rgb( 94 114  83) - hsl( 99°  16%  39%)
      1 asset(s):
          009-zombie               - 7 pixel(s)
COLOR 23  - #ff0000 / rgb(255   0   0) - hsl(  0° 100%  50%)
      1 asset(s):
          009-zombie               - 2 pixel(s)
COLOR 24  - #352410 / rgb( 53  36  16) - hsl( 32°  54%  14%)
      1 asset(s):
          010-ape                  - 56 pixel(s)
COLOR 25  - #856f56 / rgb(133 111  86) - hsl( 32°  21%  43%)
      1 asset(s):
          010-ape                  - 63 pixel(s)
COLOR 26  - #6a563f / rgb(106  86  63) - hsl( 32°  25%  33%)
      1 asset(s):
          010-ape                  - 4 pixel(s)
COLOR 27  - #a98c6b / rgb(169 140 107) - hsl( 32°  26%  54%)
      1 asset(s):
          010-ape                  - 2 pixel(s)
COLOR 28  - #c8fbfb / rgb(200 251 251) - hsl(180°  86%  88%)
      1 asset(s):
          011-alien                - 125 pixel(s)
COLOR 29  - #9be0e0 / rgb(155 224 224) - hsl(180°  53%  74%)
      1 asset(s):
          011-alien                - 6 pixel(s)
COLOR 30  - #f1ffff / rgb(241 255 255) - hsl(180° 100%  97%)
      1 asset(s):
          011-alien                - 2 pixel(s)
COLOR 31  - #75bdbd / rgb(117 189 189) - hsl(180°  35%  60%)
      1 asset(s):
          011-alien                - 2 pixel(s)
COLOR 32  - #d60000 / rgb(214   0   0) - hsl(  0° 100%  42%) - α( 20%)
      1 asset(s):
          012-rosy_cheeks          - 5 pixel(s)
COLOR 33  - #692f08 / rgb(105  47   8) - hsl( 24°  86%  22%)
      1 asset(s):
          013-luxurious_beard      - 3 pixel(s)
COLOR 34  - #28b143 / rgb( 40 177  67) - hsl(132°  63%  43%)
      4 asset(s):
          014-clown_hair_green     - 61 pixel(s)
          039-clown_eyes_green     - 4 pixel(s)
          104-clown_hair_green     - 113 pixel(s)
          114-clown_eyes_green     - 4 pixel(s)
COLOR 35  - #794b11 / rgb(121  75  17) - hsl( 33°  75%  27%)
      1 asset(s):
          016-cowboy_hat           - 69 pixel(s)
COLOR 36  - #502f05 / rgb( 80  47   5) - hsl( 34°  88%  17%)
      1 asset(s):
          016-cowboy_hat           - 11 pixel(s)
COLOR 37  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 60%)
      1 asset(s):
          017-mustache             - 5 pixel(s)
COLOR 38  - #d60000 / rgb(214   0   0) - hsl(  0° 100%  42%)
      2 asset(s):
          018-clown_nose           - 4 pixel(s)
          109-clown_nose           - 4 pixel(s)
COLOR 39  - #c6c6c6 / rgb(198 198 198) - hsl(  0°   0%  78%)           - 8-BIT GRAYSCALE #198
      2 asset(s):
          019-cigarette            - 5 pixel(s)
          115-cigarette            - 5 pixel(s)
COLOR 40  - #dedede / rgb(222 222 222) - hsl(  0°   0%  87%) - α( 50%)
      2 asset(s):
          019-cigarette            - 6 pixel(s)
          115-cigarette            - 6 pixel(s)
COLOR 41  - #e25b26 / rgb(226  91  38) - hsl( 17°  76%  52%)
      2 asset(s):
          019-cigarette            - 1 pixel(s)
          115-cigarette            - 1 pixel(s)
COLOR 42  - #80dbda / rgb(128 219 218) - hsl(179°  56%  68%)
      4 asset(s):
          020-nerd_glasses         - 8 pixel(s)
          075-pilot_helmet         - 10 pixel(s)
          089-nerd_glasses         - 8 pixel(s)
          116-welding_goggles      - 8 pixel(s)
COLOR 43  - #ca4e11 / rgb(202  78  17) - hsl( 20°  84%  43%)
      2 asset(s):
          022-knitted_cap          - 21 pixel(s)
          113-knitted_cap          - 19 pixel(s)
COLOR 44  - #933709 / rgb(147  55   9) - hsl( 20°  88%  31%)
      2 asset(s):
          022-knitted_cap          - 17 pixel(s)
          113-knitted_cap          - 15 pixel(s)
COLOR 45  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 30%)
      1 asset(s):
          023-shadow_beard         - 33 pixel(s)
COLOR 46  - #86581e / rgb(134  88  30) - hsl( 33°  63%  32%) - α( 30%)
      1 asset(s):
          023-shadow_beard         - 3 pixel(s)
COLOR 47  - #353535 / rgb( 53  53  53) - hsl(  0°   0%  21%)           - 8-BIT GRAYSCALE #53
      1 asset(s):
          025-cap_forward          - 10 pixel(s)
COLOR 48  - #515151 / rgb( 81  81  81) - hsl(  0°   0%  32%)           - 8-BIT GRAYSCALE #81
      1 asset(s):
          025-cap_forward          - 19 pixel(s)
COLOR 49  - #221e17 / rgb( 34  30  23) - hsl( 38°  19%  11%) - α( 40%)
      2 asset(s):
          027-mole                 - 1 pixel(s)
          085-mole                 - 1 pixel(s)
COLOR 50  - #710cc7 / rgb(113  12 199) - hsl(272°  89%  41%)
      1 asset(s):
          028-purple_hair          - 81 pixel(s)
COLOR 51  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 56%)
      1 asset(s):
          030-shaved_head          - 27 pixel(s)
COLOR 52  - #5c390f / rgb( 92  57  15) - hsl( 33°  72%  21%)
      2 asset(s):
          031-classic_shades       - 4 pixel(s)
          102-classic_shades       - 4 pixel(s)
COLOR 53  - #c77514 / rgb(199 117  20) - hsl( 33°  82%  43%)
      2 asset(s):
          031-classic_shades       - 4 pixel(s)
          102-classic_shades       - 4 pixel(s)
COLOR 54  - #595959 / rgb( 89  89  89) - hsl(  0°   0%  35%)           - 8-BIT GRAYSCALE #89
      2 asset(s):
          032-vape                 - 5 pixel(s)
          120-vape                 - 5 pixel(s)
COLOR 55  - #0040ff / rgb(  0  64 255) - hsl(225° 100%  50%)
      2 asset(s):
          032-vape                 - 1 pixel(s)
          120-vape                 - 1 pixel(s)
COLOR 56  - #dfdfdf / rgb(223 223 223) - hsl(  0°   0%  87%)           - 8-BIT GRAYSCALE #223
      2 asset(s):
          033-silver_chain         - 3 pixel(s)
          133-silver_chain         - 3 pixel(s)
COLOR 57  - #8c0d5b / rgb(140  13  91) - hsl(323°  83%  30%)
      2 asset(s):
          035-big_shades           - 6 pixel(s)
          124-big_shades           - 6 pixel(s)
COLOR 58  - #690c45 / rgb(105  12  69) - hsl(323°  79%  23%)
      2 asset(s):
          035-big_shades           - 6 pixel(s)
          124-big_shades           - 6 pixel(s)
COLOR 59  - #ad2160 / rgb(173  33  96) - hsl(333°  68%  40%)
      2 asset(s):
          035-big_shades           - 6 pixel(s)
          124-big_shades           - 6 pixel(s)
COLOR 60  - #555555 / rgb( 85  85  85) - hsl(  0°   0%  33%)           - 8-BIT GRAYSCALE #85
      3 asset(s):
          036-mohawk_thin          - 5 pixel(s)
          067-hoodie               - 72 pixel(s)
          117-mohawk_thin          - 5 pixel(s)
COLOR 61  - #0060c3 / rgb(  0  96 195) - hsl(210° 100%  38%)
      1 asset(s):
          037-beanie               - 15 pixel(s)
COLOR 62  - #e4eb17 / rgb(228 235  23) - hsl( 62°  84%  51%)
      1 asset(s):
          037-beanie               - 18 pixel(s)
COLOR 63  - #3cc300 / rgb( 60 195   0) - hsl(102° 100%  38%)
      1 asset(s):
          037-beanie               - 7 pixel(s)
COLOR 64  - #d60404 / rgb(214   4   4) - hsl(  0°  96%  43%)
      1 asset(s):
          037-beanie               - 10 pixel(s)
COLOR 65  - #8119b7 / rgb(129  25 183) - hsl(279°  76%  41%)
      2 asset(s):
          038-cap                  - 51 pixel(s)
          105-cap                  - 51 pixel(s)
COLOR 66  - #b261dc / rgb(178  97 220) - hsl(280°  64%  62%)
      2 asset(s):
          038-cap                  - 2 pixel(s)
          105-cap                  - 2 pixel(s)
COLOR 67  - #2c9541 / rgb( 44 149  65) - hsl(132°  54%  38%)
      2 asset(s):
          039-clown_eyes_green     - 4 pixel(s)
          114-clown_eyes_green     - 4 pixel(s)
COLOR 68  - #296434 / rgb( 41 100  52) - hsl(131°  42%  28%)
      2 asset(s):
          039-clown_eyes_green     - 2 pixel(s)
          114-clown_eyes_green     - 2 pixel(s)
COLOR 69  - #c9c9c9 / rgb(201 201 201) - hsl(  0°   0%  79%)           - 8-BIT GRAYSCALE #201
      2 asset(s):
          041-medical_mask         - 38 pixel(s)
          106-medical_mask         - 36 pixel(s)
COLOR 70  - #b1b1b1 / rgb(177 177 177) - hsl(  0°   0%  69%)           - 8-BIT GRAYSCALE #177
      2 asset(s):
          041-medical_mask         - 3 pixel(s)
          106-medical_mask         - 3 pixel(s)
COLOR 71  - #8d8d8d / rgb(141 141 141) - hsl(  0°   0%  55%)           - 8-BIT GRAYSCALE #141
      2 asset(s):
          043-vr                   - 6 pixel(s)
          119-vr                   - 6 pixel(s)
COLOR 72  - #b4b4b4 / rgb(180 180 180) - hsl(  0°   0%  71%)           - 8-BIT GRAYSCALE #180
      2 asset(s):
          043-vr                   - 18 pixel(s)
          119-vr                   - 18 pixel(s)
COLOR 73  - #dc1d1d / rgb(220  29  29) - hsl(  0°  77%  49%)
      1 asset(s):
          046-top_hat              - 11 pixel(s)
COLOR 74  - #1a43c8 / rgb( 26  67 200) - hsl(226°  77%  44%)
      2 asset(s):
          047-bandana              - 26 pixel(s)
          107-bandana              - 26 pixel(s)
COLOR 75  - #1637a4 / rgb( 22  55 164) - hsl(226°  76%  36%)
      2 asset(s):
          047-bandana              - 23 pixel(s)
          107-bandana              - 23 pixel(s)
COLOR 76  - #142c7c / rgb( 20  44 124) - hsl(226°  72%  28%)
      2 asset(s):
          047-bandana              - 3 pixel(s)
          107-bandana              - 3 pixel(s)
COLOR 77  - #c28946 / rgb(194 137  70) - hsl( 32°  50%  52%)
      1 asset(s):
          048-handlebars           - 2 pixel(s)
COLOR 78  - #2a2a2a / rgb( 42  42  42) - hsl(  0°   0%  16%)           - 8-BIT GRAYSCALE #42
      2 asset(s):
          049-frumpy_hair          - 2 pixel(s)
          088-frumpy_hair          - 2 pixel(s)
COLOR 79  - #e22626 / rgb(226  38  38) - hsl(  0°  76%  52%)
      3 asset(s):
          050-crazy_hair           - 87 pixel(s)
          081-crazy_hair           - 85 pixel(s)
          092-red_mohawk           - 8 pixel(s)
COLOR 80  - #26314a / rgb( 38  49  74) - hsl(222°  32%  22%)
      1 asset(s):
          051-police_cap           - 32 pixel(s)
COLOR 81  - #ffd800 / rgb(255 216   0) - hsl( 51° 100%  50%)
      1 asset(s):
          051-police_cap           - 1 pixel(s)
COLOR 82  - #4c4c4c / rgb( 76  76  76) - hsl(  0°   0%  30%)           - 8-BIT GRAYSCALE #76
      1 asset(s):
          053-do-rag               - 32 pixel(s)
COLOR 83  - #636363 / rgb( 99  99  99) - hsl(  0°   0%  39%)           - 8-BIT GRAYSCALE #99
      1 asset(s):
          053-do-rag               - 2 pixel(s)
COLOR 84  - #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - α( 25%)
      1 asset(s):
          055-spots                - 8 pixel(s)
COLOR 85  - #3d2f1e / rgb( 61  47  30) - hsl( 33°  34%  18%)
      1 asset(s):
          060-fedora               - 60 pixel(s)
COLOR 86  - #ffd926 / rgb(255 217  38) - hsl( 49° 100%  57%)
      3 asset(s):
          061-earring              - 1 pixel(s)
          111-pigtails             - 2 pixel(s)
          125-earring              - 1 pixel(s)
COLOR 87  - #cae7fe / rgb(202 231 254) - hsl(207°  96%  89%) - α( 43%)
      2 asset(s):
          062-horned_rim_glasses   - 18 pixel(s)
          132-horned_rim_glasses   - 18 pixel(s)
COLOR 88  - #1a6ed5 / rgb( 26 110 213) - hsl(213°  78%  47%)
      2 asset(s):
          063-headband             - 9 pixel(s)
          110-headband             - 8 pixel(s)
COLOR 89  - #855114 / rgb(133  81  20) - hsl( 32°  74%  30%)
      2 asset(s):
          064-pipe                 - 10 pixel(s)
          095-pipe                 - 10 pixel(s)
COLOR 90  - #bababa / rgb(186 186 186) - hsl(  0°   0%  73%) - α( 50%)
      2 asset(s):
          064-pipe                 - 9 pixel(s)
          095-pipe                 - 9 pixel(s)
COLOR 91  - #683c08 / rgb(104  60   8) - hsl( 33°  86%  22%)
      2 asset(s):
          064-pipe                 - 3 pixel(s)
          095-pipe                 - 3 pixel(s)
COLOR 92  - #68461f / rgb(104  70  31) - hsl( 32°  54%  26%)
      1 asset(s):
          066-front_beard_dark     - 18 pixel(s)
COLOR 93  - #ffc926 / rgb(255 201  38) - hsl( 45° 100%  57%)
      2 asset(s):
          068-gold_chain           - 3 pixel(s)
          118-gold_chain           - 3 pixel(s)
COLOR 94  - #d7d7d7 / rgb(215 215 215) - hsl(  0°   0%  84%)           - 8-BIT GRAYSCALE #215
      2 asset(s):
          071-eye_mask             - 2 pixel(s)
          103-eye_mask             - 2 pixel(s)
COLOR 95  - #f0f0f0 / rgb(240 240 240) - hsl(  0°   0%  94%)           - 8-BIT GRAYSCALE #240
      2 asset(s):
          072-3d_glasses           - 27 pixel(s)
          084-3d_glasses           - 26 pixel(s)
COLOR 96  - #328dfd / rgb( 50 141 253) - hsl(213°  98%  59%)
      2 asset(s):
          072-3d_glasses           - 6 pixel(s)
          084-3d_glasses           - 6 pixel(s)
COLOR 97  - #fd3232 / rgb(253  50  50) - hsl(  0°  98%  59%)
      2 asset(s):
          072-3d_glasses           - 6 pixel(s)
          084-3d_glasses           - 6 pixel(s)
COLOR 98  - #2858b1 / rgb( 40  88 177) - hsl(219°  63%  43%)
      2 asset(s):
          073-clown_eyes_blue      - 4 pixel(s)
          094-clown_eyes_blue      - 4 pixel(s)
COLOR 99  - #2c5195 / rgb( 44  81 149) - hsl(219°  54%  38%)
      2 asset(s):
          073-clown_eyes_blue      - 4 pixel(s)
          094-clown_eyes_blue      - 4 pixel(s)
COLOR 100 - #293e64 / rgb( 41  62 100) - hsl(219°  42%  28%)
      2 asset(s):
          073-clown_eyes_blue      - 2 pixel(s)
          094-clown_eyes_blue      - 2 pixel(s)
COLOR 101 - #85561e / rgb(133  86  30) - hsl( 33°  63%  32%)
      2 asset(s):
          074-mohawk               - 2 pixel(s)
          123-mohawk               - 2 pixel(s)
COLOR 102 - #2d6b62 / rgb( 45 107  98) - hsl(171°  41%  30%)
      1 asset(s):
          075-pilot_helmet         - 42 pixel(s)
COLOR 103 - #005580 / rgb(  0  85 128) - hsl(200° 100%  25%)
      1 asset(s):
          076-tassle_hat           - 18 pixel(s)
COLOR 104 - #229000 / rgb( 34 144   0) - hsl(106° 100%  28%)
      1 asset(s):
          076-tassle_hat           - 52 pixel(s)
COLOR 105 - #c42110 / rgb(196  33  16) - hsl(  6°  85%  42%)
      1 asset(s):
          077-hot_lipstick         - 3 pixel(s)
COLOR 106 - #2c7795 / rgb( 44 119 149) - hsl(197°  54%  38%) - α( 60%)
      1 asset(s):
          078-blue_eye_shadow      - 6 pixel(s)
COLOR 107 - #fff68e / rgb(255 246 142) - hsl( 55° 100%  78%)
      4 asset(s):
          083-wild_blonde          - 128 pixel(s)
          101-blonde_short         - 57 pixel(s)
          112-straight_hair_blonde - 83 pixel(s)
          122-blonde_bob           - 94 pixel(s)
COLOR 108 - #8d5b40 / rgb(141  91  64) - hsl( 21°  38%  40%) - α( 60%)
      1 asset(s):
          087-spots                - 7 pixel(s)
COLOR 109 - #ffba00 / rgb(255 186   0) - hsl( 44° 100%  50%)
      1 asset(s):
          090-tiara                - 9 pixel(s)
COLOR 110 - #ff2a00 / rgb(255  42   0) - hsl( 10° 100%  50%)
      1 asset(s):
          090-tiara                - 1 pixel(s)
COLOR 111 - #e65700 / rgb(230  87   0) - hsl( 23° 100%  45%)
      1 asset(s):
          091-orange_side          - 79 pixel(s)
COLOR 112 - #b500af / rgb(181   0 175) - hsl(302° 100%  35%) - α( 60%)
      1 asset(s):
          097-purple_eye_shadow    - 6 pixel(s)
COLOR 113 - #cd00cb / rgb(205   0 203) - hsl(301° 100%  40%)
      1 asset(s):
          108-purple_lipstick      - 3 pixel(s)
COLOR 114 - #1c1a00 / rgb( 28  26   0) - hsl( 56° 100%   5%)
      1 asset(s):
          116-welding_goggles      - 16 pixel(s)
COLOR 115 - #534c00 / rgb( 83  76   0) - hsl( 55° 100%  16%)
      1 asset(s):
          116-welding_goggles      - 16 pixel(s)
COLOR 116 - #ff8ebe / rgb(255 142 190) - hsl(335° 100%  78%)
      1 asset(s):
          121-pink_with_hat        - 66 pixel(s)
COLOR 117 - #2c9541 / rgb( 44 149  65) - hsl(132°  54%  38%) - α( 60%)
      1 asset(s):
          126-green_eye_shadow     - 6 pixel(s)
COLOR 118 - #51360c / rgb( 81  54  12) - hsl( 37°  74%  18%)
      1 asset(s):
          127-straight_hair        - 85 pixel(s)
COLOR 119 - #962005 / rgb(150  32   5) - hsl( 11°  94%  30%) - α( 14%)
      1 asset(s):
          128-rosy_cheeks          - 4 pixel(s)


