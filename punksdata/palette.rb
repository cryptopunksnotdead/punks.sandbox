require 'pixelart'


# setPalette
#  tx: 0xa92ea3630a13abf3a7322043406df32744c8dc3db1107cf8e244506fba8b284c


hex = <<TXT
000000ff 713f1dff 8b532cff 562600ff 723709ff
ae8b61ff b69f82ff 86581eff a77c47ff dbb180ff
e7cba9ff a66e2cff d29d60ff ead9d9ff ffffffff
a58d8dff c9b2b2ff 4a1201ff 5f1d09ff 711010ff
7da269ff 9bbc88ff 5e7253ff ff0000ff 352410ff
856f56ff 6a563fff a98c6bff c8fbfbff 9be0e0ff
f1ffffff 75bdbdff d6000033 692f08ff 28b143ff
794b11ff 502f05ff 00000099 d60000ff c6c6c6ff
dedede80 e25b26ff 80dbdaff ca4e11ff 933709ff
0000004d 86581e4d 353535ff 515151ff 221e1766
710cc7ff 00000091 5c390fff c77514ff 595959ff
0040ffff dfdfdfff 8c0d5bff 690c45ff ad2160ff
555555ff 0060c3ff e4eb17ff 3cc300ff d60404ff
8119b7ff b261dcff 2c9541ff 296434ff c9c9c9ff
b1b1b1ff 8d8d8dff b4b4b4ff dc1d1dff 1a43c8ff
1637a4ff 142c7cff c28946ff 2a2a2aff e22626ff
26314aff ffd800ff 4c4c4cff 636363ff 00000040
3d2f1eff ffd926ff cae7fe70 1a6ed5ff 855114ff
bababa80 683c08ff 68461fff ffc926ff d7d7d7ff
f0f0f0ff 328dfdff fd3232ff 2858b1ff 2c5195ff
293e64ff 85561eff 2d6b62ff 005580ff 229000ff
c42110ff 2c779599 fff68eff 8d5b4099 ffba00ff
ff2a00ff e65700ff b500af99 cd00cbff 1c1a00ff
534c00ff ff8ebeff 2c954199 51360cff 96200526
TXT

# split hexstring into slices of 4 bytes (8 hex chars) each
palette = hex.gsub( /[ \n]/, '' ).chars.each_slice(8).map { |slice| slice.join('') }

pp palette
puts "  #{palette.size} color(s)"

palette.each_with_index do |hex,i|
  color = Color.from_hex( hex )

  print "color #{'%-3d' % i} - "
  print Color.format( color )
  print "\n"
end

puts "bye"

