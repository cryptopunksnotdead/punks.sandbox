###########
#  to run use:
#    ruby ./women_samples.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


####
## test some pics with hair

sidehair_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . @ @ @ @ . . . . . . . . . .
. . . . . . . . @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . . @ @ . . . . @ . @ @ @ . . . . . .
. . . . . . @ @ . . . . . . . . @ @ . . . . . .
. . . . . . @ @ . . . . . . . . @ @ . . . . . .
. . . . . . @ . . . . . . . . . @ @ . . . . . .
. . . . . . @ . . . . . . . . . @ @ . . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . . @ @ @ . . . . .
. . . . . . . . . . . . . . . @ @ @ @ . . . . .
. . . . . . . . . . . . . . @ @ @ @ @ . . . . .
. . . . . . . . . . . . . . @ @ @ . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

wildhair_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . @ @ @ @ . @ . . . . . . . .
. . . . . . . @ . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ . @ . . . . . .
. . . . . @ @ @ @ @ @ @ @ @ @ @ @ . @ . . . . .
. . . . . . @ @ @ @ . @ @ @ @ @ @ @ @ . . . . .
. . . . . @ @ @ @ . @ . @ . . @ @ @ . . . . . .
. . . . @ . @ @ @ . . . @ . . . @ @ @ . . . . .
. . . . . @ @ @ . . . . @ . . . . @ . @ . . . .
. . . . @ . @ . . . . . . @ . . . @ @ . . . . .
. . . @ @ @ @ . . . . . . . . . . @ @ . . . . .
. . . . . @ @ . . . . . . . . . . @ @ @ . . . .
. . . . . @ @ . . . . . . . . . . @ . . . . . .
. . . . @ . . . . . . . . . . . . . @ . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT


pigtails_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . @ @ . . @ @ @ @ @ @ @ @ . . @ @ . . . .
. . . @ @ @ @ x @ @ @ @ @ @ @ @ x @ @ @ @ . . .
. . @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ @ . .
. . @ @ @ @ . @ @ @ . . . . . @ @ . @ @ @ @ . .
. . @ @ @ . . @ @ . . . . . . . @ . . @ @ @ . .
. . @ @ @ . . @ . . . . . . . . . . . @ @ @ . .
. . . @ . . . . . . . . . . . . . . . . @ . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

bob_design = <<TXT
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
. . . . . . . . . @ @ @ @ @ @ . . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ . . . . . . . .
. . . . . . . @ @ @ @ @ @ @ @ @ @ . . . . . . .
. . . . . . @ @ @ @ @ @ @ @ . @ @ @ . . . . . .
. . . . . . @ @ . @ @ @ @ . . . @ @ . . . . . .
. . . . . . @ @ . . . @ . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ @ . . . . . . . . . @ @ . . . . . .
. . . . . @ @ . . . . . . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ . . . . . .
. . . . . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . . @ @ @ . . . . . . . . @ @ @ . . . . .
. . . . @ @ @ @ @ . . . . . . . @ @ @ @ . . . .
. . . . . . @ @ @ @ . . . . . @ @ . . . . . . .
. . . . . . . . . . . . . . . . . . . . . . . .
TXT

### (re)use some pre-defined color names - add more? why? why not?
BLACK      = '000000'
WHITE      = 'FFFFFF'
ORANGE     = 'e65700'
GREEN      = '28b143'
BLONDE     = 'fff68e'
WHITESMOKE = 'f5f5f5'


sidehair_black      = Image.parse( sidehair_design, colors: [BLACK] )
sidehair_blonde     = Image.parse( sidehair_design, colors: [BLONDE] )
sidehair_whitesmoke = Image.parse( sidehair_design, colors: [WHITESMOKE] )
sidehair_orange     = Image.parse( sidehair_design, colors: [ORANGE] )
sidehair_green      = Image.parse( sidehair_design, colors: [GREEN] )


pigtails_black      = Image.parse( pigtails_design, colors: [BLACK, 'ffd926'] )
pigtails_blonde     = Image.parse( pigtails_design, colors: [BLONDE, 'ffd926'] )
pigtails_whitesmoke = Image.parse( pigtails_design, colors: [WHITESMOKE, 'ffd926'] )
pigtails_orange     = Image.parse( pigtails_design, colors: [ORANGE, 'ffd926'] )
pigtails_green      = Image.parse( pigtails_design, colors: [GREEN, 'ffd926'] )
pigtails_fuchsia    = Image.parse( pigtails_design, colors: ['870057', 'ffd926'] )
pigtails_turquoise  = Image.parse( pigtails_design, colors: ['06AD93', 'ffd926'] )


bob_black      = Image.parse( bob_design, colors: [BLACK] )
bob_blonde     = Image.parse( bob_design, colors: [BLONDE] )
bob_whitesmoke = Image.parse( bob_design, colors: [WHITESMOKE] )
bob_orange     = Image.parse( bob_design, colors: [ORANGE] )
bob_green      = Image.parse( bob_design, colors: [GREEN] )
bob_fuchsia    = Image.parse( bob_design, colors: ['870057'] )
bob_turquoise  = Image.parse( bob_design, colors: ['06AD93'] )


wildhair_blonde = Image.parse( wildhair_design, colors: [BLONDE] )



samples = {
i: {
     a: [ 'light_warm_olive', bob_blonde ],
     b: [ 'light_warm_olive', bob_blonde,      'eyes-blue',   'lips-party_pink' ],
     c: [ 'light_warm_olive', pigtails_blonde, 'eyes-purple', 'lips-smile' ],
     d: [ 'light_warm_olive-ii', bob_blonde, 'eyes-blue', 'lips-party_pink' ],
     e: [ 'light_warm_olive-iiib', bob_blonde, 'eyes-blue' ],
     f: [ 'light_warm_olive-iiib', bob_blonde, 'eyes-blue', 'lips-party_pink' ],
     g: [ 'light_warm_olive-iii', bob_blonde ],
     h: [ 'light_warm_olive-iii', bob_blonde, 'eyes-blue', 'lips-party_pink' ],
     i: [ 'light_warm_olive-iii', pigtails_blonde, 'eyes-green', 'lips-burgundy' ],
  },
ii: {
     a: [ 'deep_warm_gold', bob_orange  ],
     b: [ 'deep_warm_gold', bob_orange, 'eyes-brown', 'lips-burgundy' ],
     c: [ 'deep_warm_gold', pigtails_orange, 'eyes-green', 'lips-smile' ],
     d: [ 'deep_warm_gold-ii', bob_orange, 'eyes-green', 'lips-burgundy' ],

     g: [ 'deep_warm_gold-iii', bob_orange ],
     h: [ 'deep_warm_gold-iii', bob_orange, 'eyes-brown', 'lips-space' ],
     i: [ 'deep_warm_gold-iii', pigtails_orange, 'eyes-green', 'lips-burgundy' ],
},
iii: {
     a: [ 'golden', bob_fuchsia ],
     b: [ 'golden', bob_fuchsia, 'eyes-brown', 'lips-purple' ],
     c: [ 'golden', pigtails_fuchsia, 'eyes-green', 'lips-smile' ],
     d: [ 'golden-ii', bob_fuchsia, 'eyes-green', 'lips-burgundy' ],

     g: [ 'golden-iii', bob_fuchsia ],
     h: [ 'golden-iii', bob_fuchsia, 'eyes-brown', 'lips-space' ],
     i: [ 'golden-iii', pigtails_fuchsia, 'eyes-green', 'lips-burgundy' ],
},
iiii: {
      a: ['burning_red',  bob_turquoise ],
      b: ['burning_red',  bob_turquoise, 'eyes-brown', 'lips-space' ],
      c: ['burning_red',  pigtails_turquoise, 'eyes-blue', 'lips-smile'],
      d: [ 'burning_red-ii', bob_turquoise, 'eyes-blue', 'lips-burgundy' ],

      g: [ 'burning_red-iii', bob_turquoise ],
      h: [ 'burning_red-iii', bob_turquoise, 'eyes-brown', 'lips-space' ],
      i: [ 'burning_red-iii', pigtails_turquoise, 'eyes-blue', 'lips-burgundy' ],
},
v: {
      a: ['night_goddess', bob_black ],
      b: ['night_goddess', bob_black, 'eyes-brown', 'lips-burgundy' ],
      c: ['night_goddess', pigtails_black, 'eyes-brown', 'lips-smile' ],
      d: [ 'night_goddess-ii', bob_black, 'eyes-brown', 'lips-burgundy' ],

      g: [ 'night_goddess-iii', bob_black ],
      h: [ 'night_goddess-iii', bob_black, 'eyes-brown', 'lips-burgundy' ],
      i: [ 'night_goddess-iii', pigtails_black, 'eyes-green', 'lips-space' ],
},
vi: {
      a: ['cool_blue', bob_whitesmoke ],
      b: ['cool_blue', bob_whitesmoke, 'lips-flashy_blue' ],
      c: ['cool_blue', pigtails_whitesmoke, 'lips-smile' ],

      d: [ 'cool_blue-ii', bob_whitesmoke, 'eyes-purple', 'lips-flashy_blue' ],

      g: [ 'cool_blue-iii', bob_whitesmoke ],
      h: [ 'cool_blue-iii', bob_whitesmoke, 'eyes-purple', 'lips-flashy_blue' ],
      i: [ 'cool_blue-iii', pigtails_whitesmoke, 'eyes-purple', 'lips-flashy_blue' ],
},
}




samples.each do |roman, variants|
  variants.each do |alpha, specs|

    woman = Image.read( "./i/woman-#{specs[0]}.png" )
    specs[1..-1].each do |spec|
       if spec.is_a?( String )
         woman.compose!( Image.read( "./i/woman-#{spec}.png" ) )
       else ## assume it's already an image!!!
         woman.compose!( spec )
       end
    end

    name = "woman_#{roman}_#{alpha}"  ## e.g. woman_i_a
    woman.save( "./i/#{name}.png" )
    woman.zoom(4).save( "./i/#{name}4x.png" )
  end
end



puts "bye"

