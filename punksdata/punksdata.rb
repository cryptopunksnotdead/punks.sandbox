require 'pixelart'  # note: auto-require pixelart in punksdata (for convenience) - why? why not?


## todo/check:  namespace CONSTANTS and helpers
##               inside  CryptoPunksData module - why? why not?



##########
## 120 colors in rgba (red/green/blue/alpha)

COLORS_ENCODED = <<TXT
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

def decode_colors( hex )   ## check: rename to decode_palette or such - why? why not?
  ## note: allow spaces and newlines in hexstring for formatting
  hex = hex.gsub( /[ \n]/, '' )
  hex = hex.sub( /^0x/i, '' )  #  note allow optional leading 0x | 0X

  # split hexstring into slices of 4 bytes (8 hex chars) each
  palette = hex.chars.each_slice(8).map { |slice| slice.join('') }

  pp palette
  puts "  #{palette.size} color(s)"

  palette.map { |hex| Color.from_hex( hex ) }
end




ASSETS_ENCODED = [

  ####################
  ## 11 archetypes - 4 (human) male, 4 (human) female,
  ##                 1 zombie (male),
  ##                 1 ape (male),
  ##                 1 alien (male)
  { id: 1, name: "Male 1",
         hex: "0x26000c2700043301863401c33501c33601f03701c33801c33901c33a01c33b01c342000a4302804301704402104401e04503804501704601b44701f04801f04901f04a01f04b01f052000a5301f05401f05503205501d05604105601e05701f05801f05901b45a015a5b000362000a6301f06401f06501f06601f067015a6801f06901a56a015a7200027301b47401f07503a07501507604417601a07701f07801f07901f07a0116830002840003850003860003870003880003890003"},
  { id: 2, name: "Male 2",
         hex:  "0x26000c2700043305863405c33505c33605f03705c33805c33905c33a05c33b05c342000a4306804305704406104405e04507804505704605b44705f04805f04905f04a05f04b05f052000a5305f05405f05507205505d05608105605e05705f05805f05905b45a055a5b000362000a6305f06405f06505f06605f067055a6805f06905a56a055a7200027305b47405f07507a07505507608417605a07705f07805f07905f07a0516830002840003850003860003870003880003890003"},
  { id: 3, name: "Male 3",
         hex:  "0x26000c2700043309863409c33509c33609f03709c33809c33909c33a09c33b09c342000a430970430a804409e0440a10450b804509704609b44709f04809f04909f04a09f04b09f052000a5309f05409f0550b205509d0560c105609e05709f05809f05909b45a095a5b000362000a6309f06409f06509f06609f067095a6809f06909a56a095a7200027309b47409f0750ba0750950760c417609a07709f07809f07909f07a0916830002840003850003860003870003880003890003"},
  { id: 4, name: "Male 4",
         hex:  "0x26000c270004330d86340dc3350dc3360df0370dc3380dc3390dc33a0dc33b0dc342000a430e80430d70440e10440de0450d70450f80460db4470df0480df0490df04a0df04b0df052000a530df0540df0550dd0550f20560de0561010570df0580df0590db45a0d5a5b000362000a630df0640df0650df0660df0670d5a680df0690da56a0d5a720002730db4740df0750d50750fa0760da1761040770df0780df0790df07a0d16830002840003850003860003870003880003890003"},

  { id: 5, name: "Female 1",
         hex:  "0x34000835000c3601c337000d38000c3900044300084402814401604501f04603484601304701f04801f04901d24a01c34b01c353000a5401f05501f05603105604205601c05701f05801f05911405901b05a01695b01f063000a6401f06501f06601f06701f06801e16911506901a06a015a6b00037300027401b47501f07603527604807701f07801f07901787a0001840002850003860003870003880003890001"},
  { id: 6, name: "Female 2",
         hex: "0x34000835000c3605c337000d38000c3900044300084406814405604505f04607484605304705f04805f04905d24a05c34b05c353000a5405f05505f05608205607105605c05705f05805f05912405905b05a05695b05f063000a6405f06505f06605f06705f06805e16912506905a06a055a6b00037300027405b47505f07608827607507705f07805f07905787a0001840002850003860003870003880003890001"},
  { id: 7, name: "Female 3",
         hex: "0x34000835000c3609c337000d38000c390004430008440961440a804509f0460b484609304709f04809f04909d24a09c34b09c353000a5409f05509f0560c20560b105609c05709f05809f05913405909b05a09695b09f063000a6409f06509f06609f06709f06809e16913506909a06a095a6b00037300027409b47509f0760c82760b507709f07809f07909787a0001840002850003860003870003880003890001"},
  { id: 8, name: "Female 4",
         hex: "0x34000835000c360dc337000d38000c390004430008440e81440d60450df0460d38460f40470df0480df0490dd24a0dc34b0dc353000a540df0550df0560dc0560f10561020570df0580df0591340590db05a0d695b0df063000a640df0650df0660df0670df0680de1691350690da06a0d5a6b0003730002740db4750df0760f52761080770df0780df0790d787a0001840002850003860003870003880003890001"},

  { id: 9, name: "Zombie",
         hex: "0x26000c2700043314863414c33514c33614f03714c33814c33914c33a14c33b14c342000a4315804314704415104414e04514704516804614304616804617404714f04814f04914f04a14f04b14f052000a5314f05414f05514d05516205614e15714f05814f05914345916805a145a5b000362000a6314f06414f06514f06614f067145a6814f06914a56a145a7200027314b47414f07514507516a07614847616207617107714f07814f07914f07a1416830002840003850003860003870003880003890003" },
  { id: 10, name: "Ape",
         hex: "0x26000c2700043318863418c33518c33618f03718c33818c33918c33a18c33b18c342000a4318f0441878451970451a804619b44719d04718204819804818704919c34a18b44b18f052000a5318f054185a5519d0551a20561b105619e05719785819f05919a55a195a5b000362000a6318f064185a6519f06619f06719786819f06919a56a195a7200027318b47418d2751950751aa0761b417619a07719f07819b07818407919e17a1916830002840003850003860003870003880003890003" },
  { id: 11, name: "Alien",
         hex: "0x250008261c49270004331c86341cc3351cc3361ce0361d10371cc3381cc3391cc33a1cc33b1cc342000a431c70431e80441ce0441e10451c70451f80461cb4471cf0481cf0491cf04a1cf04b1cf052000a531cf0541cf0551cd2561ce0561d10571cf0581cf0591ca55a1c5a5b000362000a631cf0641cf0651cf0661cf0671cc0671d30681ce0681d10691ca56a1c5a720002731cb4741cf0751c58751f20761ca1761d40771cf0781cf0791ce17a1c16830002840003850003860003870003880003890003"},

#####################
## 122 attributes
##

## note: all female attributes start with attribute 75 to 133
##            75,76,77,78,79,
##            80,81,82,83,84,85,86,87,88,89,
##            90,91,92,93,94,95,96,97,98,99,
##            100,101,102,103,104,105,106,107,108,109,
##            110,111,112,113,114,115,116,117,118,119,
##            120,121,122,123,124,125,126,127,128,129,
##            130,131,132,133]



 ##  Rosy Cheeks  |  128  ( 1.28 %) | Male (67) · Female (60) · Zombie (1)
 { id: 12, name: "Rosy Cheeks", qualifier: 'm',
         hex: "0x472080482040572020772080782040" },
 { id: 128, name: "Rosy Cheeks", qualifier: 'f',
          hex: "0x4777805777207777a0" },

 ##  Luxurious Beard  |  286  ( 2.86 %) | Male (281) · Zombie (5)
 { id: 13, name: "Luxurious Beard", qualifier: 'm',
         hex: "0x37000838000c39000c48000f49000f4a000f4b000458000a59214b5a000f5b000568000a69215a6a000f6b000578000e79000f7a000f7b0001880003890003" },

##  Clown Hair Green  |  148  ( 1.48 %) | Male (85) · Female (63)
 { id: 14, name: "Clown Hair Green", qualifier: 'm',
          hex: "0x1422a01522d02322e02422f02522f02622d03222e03322703422303522304222107222d07322408222208322f08422f08522f08622d08700049322209422b09522f0962210a42220a52210" },
 { id: 104, name: "Clown Hair Green",  qualifier: 'f',
           hex: "0x1422801522c02322e02422f02522f02622f02722d03222e03322f03422f03522703722203822104222f04322f04422f05122a05222f05322f05422506122206222f06322f06422507222f07322f07422f08222208322f08422f08522f08622d08722848822409322209422b09522f0962230972210" },

##  Mohawk Dark  |  429  ( 4.29 %) | Male (279) · Female (146) · Zombie (4)
{ id: 15, name: "Mohawk Dark",  qualifier: 'm',
          hex: "0x42000c51000e52000f53000460000a61000f620007630003" },
{ id: 130, name: "Mohawk Dark",  qualifier: 'f',
           hex: "0x52000853000f61000862000f63000f64000d710002720003730001" },

## Cowboy Hat  |  142  ( 1.42 %) | Male (139) · Ape (2) · Alien (1)
{ id: 16, name: "Cowboy Hat", qualifier: 'm',
          hex: "0x1323201423d02423f03223c03324a03323403423f04123a04223f04324a04323504423f05223f05324a05323505423f06123806223f06324a06323506423f07123207223f07324a07323507423f08324208423f09423f0a32320a42310" },

## Mustache  |  288  ( 2.88 %) | Male (286) · Zombie (2)
{ id: 17,  name: "Mustache", qualifier: 'm',
         hex: "0x5825a06825a0782520" },

## Clown Nose  |  212  ( 2.12 %) | Male (134) · Female (76) · Zombie (2)
{ id: 18, name: "Clown Nose",  qualifier: 'm',
         hex: "0x6726f0"},
{ id: 109, name: "Clown Nose", qualifier: 'f',
          hex: "0x6726a0682650" },

## Cigarette  |  961  ( 9.61 %) | Male (557) · Female (392) · Zombie (11) · Ape (1)
{ id: 19, name: "Cigarette",   qualifier: 'm',
         hex: "0x69000478000a79275a88000a89275a9528c09628c09728c098000a99271a992940a90001"},
{ id: 115, name: "Cigarette",  qualifier: 'f',
          hex: "0x69000478000a79275a88000a89275a9528c09628c09728c098000a99271a992940a90001" },

## Nerd Glasses  |  572  ( 5.72 %) | Male (392) · Female (175) · Zombie (3) · Ape (2)
{ id: 20, name: "Nerd Glasses", qualifier: 'm',
          hex:  "0x350008452a87462a4b552a2d562a1e65000e66000c752aa5762a5a850003860003" },
{ id: 89, name: "Nerd Glasses", qualifier: 'f',
          hex: "0x36000445000a462ac347000455000a562a3c57000165000866000d75000a762af0770005850002860003" },

## Regular Shades  |  527  ( 5.27 %) | Male (393) · Female (128) · Zombie (4) · Ape (1) · Alien (1)
{ id: 21, name: "Regular Shades",  qualifier: 'm',
          hex: "0x25000835000a45000a46000d55000a56000765000a75000a76000d85000a860007" },
{ id: 82, name: "Regular Shades",  qualifier: 'f',
          hex: "0x35000a45000a46000d55000a56000765000a66000475000a76000f850002860001" },

## Knitted Cap  |  419  ( 4.19 %) | Male (305) · Female (101) · Zombie (7) · Ape (4) · Alien (2)
{ id: 22, name: "Knitted Cap",  qualifier: 'm',
          hex: "0x24000c332b80342c70342b80432bf0442c70442b80532bf0542c70542b80632bf0642c70642b80732bb0742c70742b80842c3c" },
{ id: 113, name: "Knitted Cap",  qualifier: 'f',
           hex: "0x330008342cc3420008432be1442cd0442b2052000a532bf0542cd0542b2062000a632bf0642cd0642b20720002732bb4742cd0742b20830002842c1c842b20" },

## Shadow Beard  |  526  ( 5.26 %) | Male (516) · Zombie (10)
{ id: 23, name: "Shadow Beard", qualifier: 'm',
         hex: "0x372d80382dc0392d40482db0492df04a2d40582da0592db0592e405a2d50682da0692da0692e506a2d50782de0792df07a2d10" },

## Frown  |  261  ( 2.61 %) | Male (257) · Zombie (4)
{ id: 24, name: "Frown", qualifier: 'm',
          hex: "0x590002" },

## Cap Forward  |  254  ( 2.54 %) | Male (248) · Zombie (3) · Ape (2) · Alien (1)
{ id: 25, name: "Cap Forward", qualifier: 'm',
          hex: "0x320008332f4333308034304b422f254230804330f044301e5230a553305a542f5a6230a563305a642f5a72302973305a742f5a83000b842f5a940003" },

## Goat  |  295  ( 2.95 %) | Male (292) · Zombie (3)
{ id: 26, name: "Goat", qualifier: 'm',
          hex: "0x5a0bc05b00046a0bf06b0b16" },

## Mole  |  644  ( 6.44 %) | Male (357) · Female (285) · Zombie (2)
{ id: 27, name: "Mole",   qualifier: 'm',
          hex: "0x483110" },
{ id: 85, name: "Mole",   qualifier: 'f',
          hex: "0x483140" },

## Purple Hair  |  165  ( 1.65 %) | Male (163) · Zombie (2)
{ id: 28, name: "Purple Hair", qualifier: 'm',
          hex: "0x1332801432a01532a01632e01732802232a02332e02432f02532f02632302732f02832e02932403232b03332f03432f03532304132804232f04332f04432105132805232f05332f06232f06332f07232207332f0743240833220843230" },

## Small Shades  |  378  ( 3.78 %) | Male (372) · Alien (2) · Zombie (2) · Ape (2)
{ id: 29, name: "Small Shades", qualifier: 'm',
          hex: "0x35000836000145000a46000c55000a56000365000a75000a76000f" },

## Shaved Head  |  300  ( 3.00 %) | Male (298) · Zombie (2)
{ id: 30, name: "Shaved Head", qualifier: 'm',
          hex: "0x3333803433c04333f04433505333f05433506333f06433507333b07433d0" },

## Classic Shades  |  502  ( 5.02 %) | Male (345) · Female (154) · Zombie (3)
{ id: 31, name: "Classic Shades", qualifier: 'm',
          hex: "0x35000445348746354955342d56351665000d6600047534a576355a850003860001" },
{ id: 102, name: "Classic Shades", qualifier: 'f',
           hex: "0x35000845000a46344346358047000455000a56341c56352057000165000a66000c75000a7634507635a0770005850002860003" },

## Vape  |  272  ( 2.72 %) | Male (161) · Female (110) · Ape (1)
{ id: 32, name: "Vape",   qualifier: 'm',
         hex: "0x69000478000a79365a88000a89365a98000a99361a993740a80002a90003" },
{ id: 120, name: "Vape",  qualifier: 'f',
          hex: "0x69000478000a79365a88000a89365a98000a99361a993740a80002a90003" },

## Silver Chain  |  156  ( 1.56 %) | Male (113) · Female (43)
{ id: 33, name: "Silver Chain",   qualifier: 'm',
          hex: "0x3b38404b3850" },
{ id: 133, name: "Silver Chain",  qualifier: 'f',
           hex: "0x4b38405b3850" },

## Smile  |  238  ( 2.38 %) | Male (234) · Zombie (4)
{ id: 34, name: "Smile",    qualifier: 'm',
          hex: "0x580002" },

## Big Shades  |  535  ( 5.35 %) | Male (372) · Female (159) · Zombie (3) · Ape (1)
{ id: 35, name: "Big Shades",   qualifier: 'm',
          hex: "0x34000835000e36000444000a4539a0453a50463b5a54000a55392c553a10563b1664000865000d66000474000a7539a0753a50763b5a84000a85392c853a10863b16" },
{ id: 124, name: "Big Shades",   qualifier: 'f',
           hex: "0x35000836000e37000445000a4639a0463a50473b5a55000a56392c563a10573b1665000866000d67000475000a7639a0763a50773b5a85000a86392c863a10873b16" },

## Mohawk Thin  |  441  ( 4.41 %) | Male (285) · Female (152) · Zombie (4)
{ id: 36, name: "Mohawk Thin",   qualifier: 'm',
          hex: "0x500008513cc3523cc1533c41610003620001630001" },
{ id: 117, name: "Mohawk Thin",  qualifier: 'f',
           hex: "0x52000c530004540004610002623c3c633c34643c14" },

## Beanie  |   44  ( 0.44 %) | Male (43) · Zombie (1)
{ id: 37, name: "Beanie",   qualifier: 'm',
          hex: "0x333de0343d50413d80423da0433d70433e80443e50443fa0513da0523ea4533ef0543e50543fa0613da0624080623e20634040633eb0643e50643fa07240207340f0744040743e10743f20834020844010" },

## Cap  |  351  ( 3.51 %) | Male (245) · Female (98) · Ape (4) · Zombie (3) · Alien (1)
{ id: 38, name: "Cap",   qualifier: 'm',
          hex: "0x3241803341f03441504241f04341f04441505241f05341f05441506241706242806341f06441507241b07341e07342107441508341a0844150934120944150" },
{ id: 105, name: "Cap",  qualifier: 'f',
           hex: "0x3341803441c04241804341f04441f05241a05341f05441f06241a06341f06441f07241a07341607342907441f08341308441f09441f0a44120" },

## Clown Eyes Green  |  382  ( 3.82 %) | Female (246) · Male (136)
{ id: 39, name: "Clown Eyes Green",   qualifier: 'm',
          hex: "0x4522404543804622805543205644107522107543a0762220764440" },
{ id: 114, name: "Clown Eyes Green",  qualifier: 'f',
           hex: "0x452280464348472240564310564420752220764352764480772210" },

## Normal Beard Black  |  289  ( 2.89 %) | Male (286) · Zombie (3)
{ id: 40, name: "Normal Beard Black",  qualifier: 'm',
          hex: "0x37000838000c39000448000b49000f4a000458000a59074b5a000568000a69075a6a000578000e79000f7a0001" },

## Medical Mask  |  175  ( 1.75 %) | Male (107) · Female (65) · Zombie (2) · Alien (1)
{ id: 41, name: "Medical Mask",    qualifier: 'm',
          hex: "0x3645903945404745904845404846804945d05745a05845f05945f05a45506746206745806845f06945f06a4550774560784510784620794570" },
{ id: 106, name: "Medical Mask",   qualifier: 'f',
           hex: "0x3645804745904845404846804945d05745a05845f05945f05a45506746206745806845f06945f06a4550774560784510784620794570" },

## Normal Beard  |  292  ( 2.92 %) | Male (291) · Zombie (1)
{ id: 42, name: "Normal Beard",   qualifier: 'm',
          hex: "0x370b80380bc0390b40480bb0490bf04a0b40580ba0590bb45a0b50680ba0690ba56a0b50780be0790bf07a0b10" },

## VR  |  332  ( 3.32 %) | Male (242) · Female (88) · Zombie (1) · Ape (1)
{ id: 43, name: "VR",   qualifier: 'm',
          hex: "0x35478636474944000a45471845486046489446472047000554000a55485a5648a557000564000a65485a6648a567000574000a75485a7648a577000584000285471c85482086481c864720870001" },
{ id: 119, name:  "VR",  qualifier: 'f',
           hex: "0x36478637474945000a46471846486047489447472048000555000a56485a5748a558000565000a66485a6748a568000575000a76485a7748a578000585000286471c86482087481c874720880001" },

## Eye Patch  |  461  ( 4.61 %) | Male (363) · Female (92) · Zombie (4) · Ape (2)
{ id: 44, name: "Eye Patch",   qualifier: 'm',
         hex: "0x35000445000f46000d55000f560007650005750005" },
{ id: 100, name: "Eye Patch",  qualifier: 'f',
          hex: "0x35000845000a46000f47000455000a56000f57000165000a75000a" },

## Wild Hair  |  447  ( 4.47 %) | Male (296) · Female (144) · Zombie (7)
{ id: 45, name: "Wild Hair",   qualifier: 'm',
          hex: "0x12000c13000414000e15000816000422000a23000f24000f25000f26000e27000131000a32000f33000f34000f35000f36000f42000f43000f44000752000f53000f54000d61000a62000f63000f64000271000a72000f73000f74000d81000282000a83000f84000f85000f86000f870004920007930007940001950003" },
{ id: 96, name: "Wild Hair",   qualifier: 'f',
          hex: "0x12000813000814000815000516000c22000c23000f24000f25000f26000d27000728000831000232000e33000f34000f35000f36000f37000738000141000842000e43000f44000f45000152000b53000f54000f55000461000862000f63000f64000565000171000172000f73000f74000f75000481000282000383000f84000f85000f86000f87000d88000c92000693000b94000195000b960003970005990001"},

## Top Hat  |  115  ( 1.15 %) | Male (112) · Zombie (2) · Ape (1)
{ id: 46, name: "Top Hat",  qualifier: 'm',
          hex: "0x23000824000530000831000f32000f33495a34000540000a41000f42000f43495a44000550000a51000f52000f53495a54000560000a61000f62000f63495a64000570000a71000f72000f73495a74000581000382000383491a840005940001" },

## Bandana  |  481  ( 4.81 %) | Male (304) · Female (164) · Zombie (7) · Ape (4) · Alien (2)
{ id: 47, name: "Bandana",  qualifier: 'm',
          hex: "0x144a90144b40154ac0244a10244b60244c80254c10334b60334a80344a40344c10424ba0434af0444b50524ba0534af0544b50624ba0634af0644a50644ba0724ba0734af0744a10744b60834b30" },
{ id: 107, name: "Bandana", qualifier: 'f',
           hex: "0x144a20144b80154ac0164a40244a20244b80254b10254c60334b80344b10344ac0344c20434b50434aa0444a50444ba0534b50534aa0544a50544ba0634b50634aa0644af0654b50734b50734aa0744a70744b80754b10834b20844b10" },

## Handlebars  |  263  ( 2.63 %) | Male (261) · Zombie (2)
{ id: 48, name: "Handlebars",  qualifier: 'm',
           hex: "0x584d20580b80590b30680ba0784d20790b30" },

## Frumpy Hair  |  442  ( 4.42 %) | Male (289) · Female (149) · Zombie (4)
{ id: 49, name: "Frumpy Hair",  qualifier: 'm',
           hex: "0x23000c24000c25000c32000e33000f34000f35000f36000f41000a424e6943000f44000f45000151000a52000f53000f54000d55000461000a62000f63000f64000f65000771000272000f73000f74000f82000283000f84000f" },
{ id: 88, name: "Frumpy Hair",  qualifier: 'f',
           hex: "0x23000824000c25000c26000f27000f28000c32000833000f34000f35000f36000f370007380003424e87434e1e44000f45000752000f53000f54000f55000c62000f63000f64000f65000f66000172000b73000f74000f75000583000b84000f85000d86000c87000c88000c960003970003980001" },

## Crazy Hair  |  414  ( 4.14 %) | Male (239) · Female (168) · Zombie (7)
{ id: 50, name: "Crazy Hair",   qualifier: 'm',
           hex: "0x134fb0154fc0174f40224fa0234fe0244ff0254f78264f34314fe0324ff0334ff0344f50414f20424ff0434ff0444f70514fa0524ff0534ff0614fb0624fb0634ff0644f10724ff0734ff0744f10814f20824fb0834ff0844f10934f70" },
{ id: 81, name: "Crazy Hair",  qualifier: 'f',
           hex: "0x144f40234fc0244fe0254fc0264fd0274fd0324f30334f60344ff0354f70374f20384f10424f90434ff0444f10514f20524fb0534ff0614f20624fb0634ff0724fe0734ff0744f50824f80834fb0844fb0854ff0864fc0874fc0884f40924fa0934f20944fa0954fb0964f10974f10" },

## Police Cap  |  203  ( 2.03 %) | Male (200) · Zombie (2) · Ape (1)
{ id: 51, name: "Police Cap",  qualifier: 'm',
          hex: "0x2200082300043250a5330e823350503400054250a5430e8243505044504951000a525070525180530e8253505054505a6100026250b4630e8263505064505a7250a5730e8273505074505a82502983501684501e" },

## Buck Teeth  |   78  ( 0.78 %) | Male (78)
{ id: 52, name: "Buck Teeth",  qualifier: 'm',
          hex: "0x590e40690e40" },

## Do-rag  |  300  ( 3.00 %) | Male (292) · Zombie (4) · Ape (3) · Alien (1)
{ id: 53, name: "Do-rag",  qualifier: 'm',
          hex: "0x3352803452c04352704353804453104452e05352f05452f06352f06452f07352b07452f0" },

## Front Beard  |  273  ( 2.73 %) | Male (270) · Zombie (3)
{ id: 54, name: "Front Beard",  qualifier: 'm',
          hex: "0x580ba0590bb05a0bc05b0004680ba0690ba06a0bf06b0005780b20790b30" },

## Spots  |  124  ( 1.24 %) | Male (73) · Female (51)
{ id: 55, name: "Spots",   qualifier: 'm',
          hex: "0x3654804854404a54105454106a5410745410775410785480" },
{ id: 87, name: "Spots",   qualifier: 'f',
          hex: "0x366c80486c40556c406a6c10746c20776c10786c80" },

## Big Beard  |  146  ( 1.46 %) | Male (146)
{ id: 56, name: "Big Beard",  qualifier: 'm',
          hex: "0x29000c2a0004380b80390bf03a0b58480be0490bf04a0bf04b0005580bf0590bb05a0bf05b0b49680bf0690ba06a0bf06b0b5a780bf0790bf07a0bf07b0b5a880b28890b3c8a0b3c8b0001" },

## Vampire Hair  |  147  ( 1.47 %) | Male (146) · Zombie (1)
{ id: 57, name: "Vampire Hair",  qualifier: 'm',
          hex: "0x33000834000c38000c39000443000749000153000d63000f640003730009" },

## Peak Spike  |  303  ( 3.03 %) | Male (298) · Zombie (5)
{ id: 58, name: "Peak Spike",  qualifier: 'm',
          hex: "0x32000c33000540000841000f42000f50000851000f52000f53000d60000861000f62000563000171000372000d730004830001" },

## Chinstrap  |  282  ( 2.82 %) | Male (280) · Zombie (2)
{ id: 59, name: "Chinstrap",  qualifier: 'm',
          hex: "0x370b80380bc0480b30490bf04a0b405a0bd05b00046a0bf06b0005780bc0790bc07a0b10" },

## Fedora  |  186  ( 1.86 %) | Male (184) · Ape (1) · Zombie (1)
{ id: 60,  name: "Fedora",  qualifier: 'm',
          hex: "0x1455802455f033554a3455f04155804255f043555a4455f05155a05255f053555a5455f06155a06255f063555a6455f072553073555a7455f08300028455f09455b0" },

## Earring  | 2459  (24.59 %) | Male (1498) · Female (933) · Zombie (22) · Alien (3) · Ape (3)
{ id: 61, name: "Earring",  qualifier: 'm',
          hex: "0x275649" },
{ id: 125, name:  "Earring",  qualifier: 'f',
           hex: "0x270004375612" },

## Horned Rim Glasses  |  535  ( 5.35 %) | Male (388) · Female (142) · Zombie (4) · Ape (1)
{ id: 62, name: "Horned Rim Glasses",  qualifier: 'm',
          hex: "0x35000c4557a54657f055572d5657306557876657c07557a57657f085000d" },
{ id: 132, name:  "Horned Rim Glasses", qualifier: 'f',
           hex: "0x35000836000445000a4657f047575055000a56573457571065000a6657c167574075000a7657f0775750850002860001" },

## Headband  |  406  ( 4.06 %) | Male (304) · Female (96) · Zombie (4) · Alien (1) · Ape (1)
{ id: 63, name: "Headband",  qualifier: 'm',
          hex: "0x330e80345840430ea0445850530ea0545850630ea0645850730ea0745850" },
{ id: 110, name: "Headband",  qualifier: 'f',
           hex: "0x25000c26000c27000e28000f29000f2a000c34000635000337000238000339000f3a000f430002440ea4455850540ea5555850640ea5655850730008740ea17558507900087a000f84000985000c86000c87000e88000d89000e8a000f95000396000397000b98000f9900079a0001" },

## Pipe  |  317  ( 3.17 %) | Male (186) · Female (130) · Alien (1)
{ id: 64, name: "Pipe",  qualifier: 'm',
          hex: "0x6900087959297a59498a59298b5949965ac099000a9a5b839a59409b595aa55a20a65af0a75a20a85a20a9000aaa5b80aa5970ab5b16b90002ba0003" },
{ id: 95, name: "Pipe",  qualifier: 'f',
          hex: "0x6900087959297a59498a59298b5949965ac099000a9a5b839a59409b595aa55a20a65af0a75a20a85a20a9000aaa5b80aa5970ab5b16b90002ba0003" },

## Messy Hair  |  460  ( 4.60 %) | Male (294) · Female (160) · Zombie (6)
{ id: 65, name: "Messy Hair",  qualifier: 'm',
          hex: "0x23000824000832000833000f34000f42000f43000f44000d45000152000f53000f54000562000f63000f64000365000172000e73000f74000d83000784000b" },
{ id: 93, name: "Messy Hair",  qualifier: 'f',
          hex: "0x23000824000832000833000f34000f42000f43000f44000d45000152000f53000f54000562000f63000f64000365000172000e73000f74000d83000784000b" },

## Front Beard Dark  |  260  ( 2.60 %) | Male (255) · Zombie (5)
{ id: 66, name: "Front Beard Dark",  qualifier: 'm',
         hex: "0x585ca0595cb05a5cc05b0004685ca0695ca06a5cf06b0005785c20795c30" },

## Hoodie  |  259  ( 2.59 %) | Male (256) · Zombie (2) · Ape (1)
{ id: 67, name: "Hoodie",  qualifier: 'm',
          hex: "0x15000816000c173cc3183cc3193c491a0004230008243cc3253ce1263c3c27000f28000f293c2d2a3c962b3cc3320008333ce1343c783500033700033800033900033a00033b0003423ca5433cf044000551000a523cf0533cf05400055a00085b000f610002623cb4633cf06400056a000a6b3c69723c29733cf0743c497a000e7b3c5a833c29843cf0853cc386000f87000f88000f89000f8a3c698b0001940003953c29963c3c973cc3983cc3993c699a0001a70003a80003a90001" },

## Gold Chain  |  169  ( 1.69 %) | Male (107) · Female (60) · Ape (1) · Zombie (1)
{ id: 68, name: "Gold Chain",  qualifier: 'm',
         hex: "0x3a5d404a5d204b5d40" },
{ id: 118, name: "Gold Chain",  qualifier: 'f',
          hex: "0x4b5d405b5d50" },

## Muttonchops  |  303  ( 3.03 %) | Male (303)
{ id: 69, name: "Muttonchops",  qualifier: 'm',
          hex: "0x370b80380bc0480bb0490b50780bc0790b40" },

## Stringy Hair  |  463  ( 4.63 %) | Male (292) · Female (165) · Zombie (6)
{ id: 70, name:  "Stringy Hair",  qualifier: 'm',
         hex: "0x43000c44000352000853000c54000963000c740003" },
{ id: 98, name: "Stringy Hair",  qualifier: 'f',
         hex: "0x440008450001540009550001640009650001740009750001" },

## Eye Mask  |  293  ( 2.93 %) | Male (205) · Female (86) · Zombie (1) · Ape (1)
{ id: 71, name: "Eye Mask",   qualifier: 'm',
          hex: "0x35000c36000f450007465e4b55000d56000e65000f66000f750005765e1a850003860003" },
{ id: 103, name: "Eye Mask",  qualifier: 'f',
           hex: "0x35000836000e37000545000a465e8347000555000a56000c57000565000a66000f67000575000a765e20770005850002860003870001" },

## 3D Glasses  |  286  ( 2.86 %) | Male (205) · Female (78) · Zombie (2) · Ape (1)
{ id: 72, name: "3D Glasses",  qualifier: 'm',
          hex: "0x355fd0455f70456080465fb0466040555f505560a0565fa0566050655f70656180665fb0666140755f507561a0765fa0766150855f30865f30" },
{ id: 84, name: "3D Glasses",  qualifier: 'f',
          hex: "0x355f80365f40455fa0465f304660c0475f50555fa05660f0575f50655fa0665f306661c0675f50755fa07661f0775f50855f20865f30875f10" },

## Clown Eyes Blue   |  384  ( 3.84 %) | Female (274) · Male (108) · Zombie (2)
{ id: 73, name: "Clown Eyes Blue",  qualifier: 'm',
          hex: "0x4562404563804662805563205664107562107563a0766220766440" },
{ id: 94, name: "Clown Eyes Blue",  qualifier: 'f',
          hex: "0x456280466348476240566310566420756220766352766480776210" },

## Mohawk  |  441  ( 4.41 %) | Male (286) · Female (153) · Zombie (2)
{ id: 74, name: "Mohawk",  qualifier: 'm',
          hex: "0x426584510b86520be0526510530b4060000a610b3c620b34630b30" },
{ id: 123, name: "Mohawk",  qualifier: 'f',
           hex: "0x520008530b81536560610008620be1630bf0640bd0710002720003730001" },

## Pilot Helmet  |   54  ( 0.54 %) | Female (54)
{ id: 75, name: "Pilot Helmet",   qualifier: 'f',
          hex: "0x33000834000c3566e03666f03766d03866c03966c03a6640426680432aa5442a5a4566505266a0532a2d5466875566506266a0632a8764662d656650726620732aa5742a5a7566508300028400038566308666308766308866308966308a6610" },

## Tassle Hat  |  178  ( 1.78 %) | Female (178)
{ id: 76, name: "Tassle Hat",  qualifier: 'f',
         hex: "0x2900083300083467863568c33668c03768c33868c33968e13a684942000c4367814368604467104468e04568104968205167865267905268605367905368605467105468e06168296267906268606367906368606467106468e07200037367947368207467907468607568407968807a000483000284682985683c86683c87683c88683c8968b48a6816990002" },

## Hot Lipstick  |  696  ( 6.96 %) | Female (696)
{ id: 77, name:  "Hot Lipstick",  qualifier: 'f',
          hex: "0x596940696950" },

## Blue Eye Shadow  |  266  ( 2.66 %) | Female (266)
{ id: 78, name: "Blue Eye Shadow",  qualifier: 'f',
          hex: "0x466a40566a30766ad0" },

## Straight Hair Dark  |  148  ( 1.48 %) | Female (148)
{ id: 79, name: "Straight Hair Dark",  qualifier: 'f',
          hex: "0x26000827000c28000c29000c2a000c2b000434000835000f36000f37000f38000f39000f3a000f3b000543000844000f45000746000153000a54000f63000a64000f6b000473000274000f75000479000c7a000e7b00058400028500038600038700038800038900038a0003" },

## Choker  |  48  ( 0.48 %) | Female (48)
{ id: 80, name: "Choker",  qualifier: 'f',
          hex: "0x4a000c5a00025b0005" },

## Wild Blonde  |  144  ( 1.44 %) | Female (144)
{ id: 83, name: "Wild Blonde",  qualifier: 'f',
          hex: "0x146b40156b80166b80176b80236be0246bd0256bf0266bf0276bf0286bb0296b40326ba0336bd0346bf0356bf0376b20386b70426bf0436be0446bf0516b80526b20536bf0546b50556b10626bf0636bf0646b50656b80716ba0726bf0736bb0746bf0756b10826b60836bf0846bf0856bd0866bc0876bc0886b10936b70946ba0956bb0966bf0976bd0986bb0a36b10a56b10a66b30" },

## Wild White Hair  |  136  ( 1.36 %) | Female (136)
{ id: 86, name: "Wild White Hair",  qualifier: 'f',
          hex: "0x170e40240e40250e60260e60270ed0280e60330ec0340ef0350ef0360e70370e30380e10430ee0440ef0450e30520ea0530ef0540ed0550e10620ea0630ef0640ef0650e30660e90720e80730eb0740ef0750e40830e80840eb0850ef0860ec0870ec0880e40940e30950e20960e60970eb0980e20" },

## Tiara  |  55  ( 0.55 %) | Female (55)
{ id: 90, name: "Tiara",  qualifier: 'f',
         hex: "0x446d40546d50556d40646d60656e10656d60746d10" },

## Orange Side  |  68  ( 0.68 %) | Female (68)
{ id: 91, name: "Orange Side",  qualifier: 'f',
          hex: "0x346fc0356fe0366f70376f10436fa0446ff0456f10536ff0546ff0636ff0646ff0656f40736fa0746ff0756f407a6fe07b6f50846f30856ff0866ff0876ff0886ff0896ff08a6ff08b6f10976f20986f30996f309a6f30" },

## Red Mohawk  |  147  ( 1.47 %) | Female (147)
{ id: 92, name: "Red Mohawk",  qualifier: 'f',
          hex: "0x524f80534fd0624f30634f30" },

## Purple Eye Shadow  |  262  ( 2.62 %) | Female (262)
{ id: 97,  name: "Purple Eye Shadow",  qualifier: 'f',
          hex: "0x4670405670307670d0" },

## Dark Hair  |  157  ( 1.57 %) | Female (157)
{ id: 99, name: "Dark Hair",  qualifier: 'f',
          hex: "0x19000426000c27000e28000f29000534000e35000f36000f37000338000b39000f43000e44000f45000749000353000f54000f55000d63000f64000f65000573000b74000f75000579000c84000b85000f86000f87000f88000f89000f95000296000397000398000b990005" },

## Blonde Short  |  129  ( 1.29 %) | Female (129)
{ id: 101, name: "Blonde Short",  qualifier: 'f',
          hex: "0x336b80346be0356bf0366b30376b40426b80436bf0446bf0456b10526ba0536bf0546bf0626ba0636bf0646bf0656b60736bb0746bf0776b40846b30856b30866b30" },

## Purple Lipstick  |  655  ( 6.55 %) | Female (655)
{ id: 108, name: "Purple Lipstick",  qualifier: 'f',
          hex: "0x597140697150" },

## Pigtails  |  94  ( 0.94 %) | Female (94)
{ id: 111, name: "Pigtails",  qualifier: 'f',
          hex: "0x13000814000f15000f16000423000f24000f25000333568234000d35000442000843000f44000f45000152000a53000f54000562000a63000f64000572000273000f74000d83562884000793000f94000f95000ca30002a4000fa5000fa60001" },

## Straight Hair Blonde  |  144  ( 1.44 %) | Female (144)
{ id: 112, name: "Straight Hair Blonde",  qualifier: 'f',
           hex: "0x266b80276bc0286bc0296bc02a6bc02b6b40346b80356bf0366bf0376bf0386bf0396bf03a6bf03b6b50436b80446bf0456b70466b10536ba0546bf0636ba0646bf06b6b40736b20746bf0756b407a6be07b6b50846b20856b30866b30876b30886b30896b308a6b30" },

## Welding Goggles  |  86  ( 0.86 %) | Female (86)
{ id: 116, name:  "Welding Goggles",  qualifier: 'f',
          hex: "0x3472c03572c0437380437220447330442ac04573404572105373205372805473c0542a305573105572406372a06473c06472306572407373a0742af0757350837220847330857230" },

## Pink With Hat  |  95  ( 0.95 %) | Female (95)
{ id: 121, name: "Pink With Hat",  qualifier: 'f',
           hex: "0x2674802774c02874c034000c3574e03674703774f03874f03974f03a744043000e44000f4574704974204a7410530e8754000f5574d063000f640e1e6574f066741073000b74000f7574507974807a74408400038574b08674f08774f08874f08974f08a7410967420977430987430" },

## Blonde Bob  |  147  ( 1.47 %) | Female (147)
{ id: 122, name: "Blonde Bob",  qualifier: 'f',
           hex: "0x256b80266bc0276bc0286be0336bc0346bf0356bf0366b30376bf0386bf0396b50426b80436bf0446bd0486b20496b50526ba0536bf0546bf0556b40626ba0636bf0646b70726b20736bf0746b40796b40836b20846bf0856bf0866bf0876bf0886bf0896b10976b20986bb0" },

## Green Eye Shadow  |  271  ( 2.71 %) | Female (271)
{ id: 126, name: "Green Eye Shadow",  qualifier: 'f',
           hex: "0x4675405675307675d0" },

## Straight Hair |  151  ( 1.51 %) | Female (151)
{ id: 127, name: "Straight Hair",  qualifier: 'f',
            hex: "0x2676802776c02876c02976c02a76c02b76403476803576f03676f03776f03876f03976f03a76f03b76504376804476f04576704676105376a05476f06376a06476f06b76407376207476f07576407976c07a76e07b76508476208576308676308776308876308976308a7630" },

## Half Shaved  |  147  ( 1.47 %) | Female (147)
{ id: 129, name: "Half Shaved",  qualifier: 'f',
           hex: "0x1900081a000c24000c25000e26000f27000f28000f29000f2a000f33000e34000f35000f36000f37000738000339000b3a000f42000843000f44000f45000346000149000152000a530007540001630003" },

## Black Lipstick  |  617  ( 6.17 %) | Female (617)
{ id: 131, name: "Black Lipstick",  qualifier: 'f',
           hex: "0x590004690005" },
].sort { |l,r|  l[:id] <=> r[:id] }


#####
# auto-add slug to hash record
ASSETS_ENCODED.each do |rec|
               ## slugify name e.g.
               ##   1 - Male 1          => 001-male_1
               ##   18 - Clown Nose      => 018-clown_nose
               num  = rec[ :id ]
               name = rec[ :name ]

               slug = "#{'%03d' % num}-#{name.downcase.gsub( ' ', '_' )}"
               rec[ :slug ] = slug
        end


def decode_image( hex, colors: )
  puts "==> decoding #{hex}..."

  ## note: allow spaces and newlines in hexstring for formatting
  hex = hex.gsub( /[ \n]/, '' )
  hex = hex.sub( /^0x/i, '' )  #  note allow optional leading 0x | 0X


  ## convert hex string to byte array, that is, array of integer numbers
  ##   e.g.  0x6726f0    (3 bytes - 0x67 / 0x26 / 0xf0)
  ##     =>  [103, 38, 240]
  a = [hex].pack("H*").unpack('C*')

  n = a.length / 3
  puts "  #{a.size} byte(s), #{n} pixel block(s):"


  img = Image.new( 24, 24 )

  n.times do |i|

    bx = (a[i*3] & 0xf0) >> 4
    by = a[i*3] & 0xf

    color = a[i*3+1]

    color_mask = (a[i*3+2] & 0xf0) >> 4
    black_mask = a[i*3+2] & 0xf


    print "    #{i+1} of #{n} pixel block - "
    print "block.x: #{bx}, block.y: #{by}, "
    print "color: #{color}, "
    print "color?: #{color_mask.to_s(2).rjust(4,'0')}, "
    print "black?: #{black_mask.to_s(2).rjust(4,'0')}:"
    print "\n"


    2.times do |dx|
      2.times do |dy|
        x = 2 * bx + dx
        y = 2 * by + dy

        print "      x: #{'%2d' % x} / y: #{'%2d' % y}  - "

        if color_mask & (1 << (dx*2+dy)) != 0
            print " COLOR #{color}"
            img[x,y] = colors[ color ]
        elsif black_mask & (1 << (dx*2+dy)) != 0
            print " BLACK"       # rgba( 00 00 00 FF)
            img[x,y] = Color::BLACK
        else
            print " TRANSPARENT"
        end
        print "\n"
      end
    end
  end

  img
end


