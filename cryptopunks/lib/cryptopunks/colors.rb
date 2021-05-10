
ROBOT_COLORS = [
'000000',    # color 1 - BLACK
'535353',    # color 2 - BASE 2 (DARKER)
'A4A4A4',    # color 3 - BASE 1
'A9F7FF',    # color 4 - BASE 3 (LIGHTER) - eyes
]

VAMPIRE_COLORS = [
  '000000',    # color 1 - BLACK
  '131313',    # color 2 - BASE 4 (DARKEST)
  '535353',    # color 3 - BASE 3 (DARKERER) - eyes
  'A4A4A4',    # color 4 - BASE 2 (DARKER) - eyes
  'E0E0E0',    # color 5 - BASE 1
  'F6000B',    # color 6 - BASE 5  - teeth - red
]

MUMMY_COLORS =  [
 '000000',    # color 1 - BLACK
 '1F1A15',    # color 2 - BASE 5 (DARKEST)
 '2A231C',    # color 3 - BASE 4 (DARKERERER)
 '5F5147',    # color 4 - BASE 3 (DARKERER)
 '927B6A',    # color 5 - BASE 2 (DARKER)
 'D9B599',    # color 6 - BASE 1
 'F6000B',    # color 7 - BASE 6 - eyes - red
]

ORC_COLORS = [
'000000',    # color 1 - BLACK
'171a08',    # color 2 - BASE 3 (DARKEST)
'333F0C',    # color 3 - BASE 2 (DARKER)
'50650E',    # color 4 - BASE 1
'FFFFFF',    # color 5 - BASE 4 - white
]

SKELETON_COLORS = [
   '000000',    # color 1 - BLACK
   'e0e0e0',    # color 2 - BASE 1
]

DEMON_COLORS =  [
 '000000',    # color 1 - BLACK
 '390102',    # color 2 - BASE 3  (DARKEST) - eyes
 '630006',    # color 3 - BASE 2  (DARKER) - eyes
 '850008',    # color 4 - BASE 1
]

ZOMBIE_COLORS = [
 '000000',    # color 1 - BLACK
 '5e7253',    # color 2 - BASE 2  (DARKER)
 '7da269',    # color 3 - BASE 1
 'ff0000',    # color 4 - BASE 3 - red eye
 '9bbc88',    # color 5 - BASE 4  (LIGHTER)
 '4a010d',    # color 6 - BASE 5 - mouth (female only)
]

APE_COLORS = [
'000000',    # color 1 - BLACK
'352410',    # color 2 - BASE 3  (DARKEST)
'6a563f',    # color 3 - BASE 2  (DARKER) - eyes
'856f56',    # color 4 - BASE 1
'a98c6b',    # color 5 - BASE 4  (LIGHTER) - eyes
]

ALIEN_COLORS = [
'000000',    # color 1 - BLACK
'75bdbd',    # color 2 - BASE 3  (DARKEST)
'9be0e0',    # color 3 - BASE 2  (DARKER)
'c8fbfb',    # color 4 - BASE 1
]


HUMAN_LIGHTER_BASE1 = 'ead9d9'   # rgb(234 217 217) - hsl(  0°  29%  88%)
HUMAN_LIGHTER_BASE2 = 'c9b2b2'   # rgb(201 178 178) - hsl(  0°  18%  74%) - eyes
HUMAN_LIGHTER_BASE3 = 'a58d8d'   # rgb(165 141 141) - hsl(  0°  12%  60%) - eyes
HUMAN_LIGHTER_BASE4 = 'ffffff'   # rgb(255 255 255) - hsl(  0°   0% 100%)    -- white
HUMAN_LIGHTER_BASE5 = '711010'   # rgb(113  16  16) - hsl(  0°  75%  25%) - mouth

HUMAN_LIGHT_BASE1   = 'dbb180'   # rgb(219 177 128) - hsl( 32°  56%  68%)
HUMAN_LIGHT_BASE2   = 'd29d60'   # rgb(210 157  96) - hsl( 32°  56%  60%) - eyes
HUMAN_LIGHT_BASE3   = 'a66e2c'   # rgb(166 110  44) - hsl( 32°  58%  41%) - eyes
HUMAN_LIGHT_BASE4   = 'e7cba9'   # rgb(231 203 169) - hsl( 33°  56%  78%)
HUMAN_LIGHT_BASE5   = '711010'   # rgb(113  16  16) - hsl(  0°  75%  25%) - mouth

HUMAN_DARK_BASE1    = 'ae8b61'   # rgb(174 139  97) - hsl( 33°  32%  53%)
HUMAN_DARK_BASE2    = 'a77c47'   # rgb(167 124  71) - hsl( 33°  40%  47%) - eyes
HUMAN_DARK_BASE3    = '86581e'   # rgb(134  88  30) - hsl( 33°  63%  32%) - eyes
HUMAN_DARK_BASE4    = 'b69f82'   # rgb(182 159 130) - hsl( 33°  26%  61%)
HUMAN_DARK_BASE5    = '5f1d09'   # rgb( 95  29   9) - hsl( 14°  83%  20%) - mouth

HUMAN_DARKER_BASE1  = '713f1d'   # rgb(113  63  29) - hsl( 24°  59%  28%)
HUMAN_DARKER_BASE2  = '723709'   # rgb(114  55   9) - hsl( 26°  85%  24%) - eyes
HUMAN_DARKER_BASE3  = '562600'   # rgb( 86  38   0) - hsl( 27° 100%  17%) - eyes
HUMAN_DARKER_BASE4  = '8b532c'   # rgb(139  83  44) - hsl( 25°  52%  36%)
HUMAN_DARKER_BASE5  = '4a1201'   # rgb( 74  18   1) - hsl( 14°  97%  15%) - mouth


HUMAN_COLORS_LIGHT = [   ## todo/check: change to HUMAN_LIGHT_COLORS???
  '000000',            # color 1 - BLACK
  HUMAN_LIGHT_BASE3,   # color 2 - BASE 3 (DARKEST) - eyes
  HUMAN_LIGHT_BASE2,   # color 3 - BASE 2 (DARKER)  - eyes
  HUMAN_LIGHT_BASE1,   # color 4 - BASE 1
  HUMAN_LIGHT_BASE4,   # color 5 - BASE 4
  HUMAN_LIGHT_BASE5,   # color 6 - BASE 5 - mouth (femaly only)
]

HUMAN_COLORS_LIGHTER = [  ## todo/check: change to HUMAN_LIGHTER_COLORS?? or add alias - why? why not?
  '000000',            # color 1 - BLACK
  HUMAN_LIGHTER_BASE3,
  HUMAN_LIGHTER_BASE2,
  HUMAN_LIGHTER_BASE1,
  HUMAN_LIGHTER_BASE4,
  HUMAN_LIGHTER_BASE5,
]

HUMAN_COLORS_DARK = [
  '000000',            # color 1 - BLACK
  HUMAN_DARK_BASE3,
  HUMAN_DARK_BASE2,
  HUMAN_DARK_BASE1,
  HUMAN_DARK_BASE4,
  HUMAN_DARK_BASE5,
]

HUMAN_COLORS_DARKER = [
  '000000',            # color 1 - BLACK
  HUMAN_DARKER_BASE3,
  HUMAN_DARKER_BASE2,
  HUMAN_DARKER_BASE1,
  HUMAN_DARKER_BASE4,
  HUMAN_DARKER_BASE5,
]


HUMAN_COLORS = {
'light'   => HUMAN_COLORS_LIGHT,
'lighter' => HUMAN_COLORS_LIGHTER,
'dark'    => HUMAN_COLORS_DARK,
'darker'  => HUMAN_COLORS_DARKER,
}



### todo/check:
##   use a different name other than the "generic" COLORS - why? why not?

COLORS = {
## original series
'human'    => HUMAN_COLORS,
'zombie'   => ZOMBIE_COLORS,
'ape'      => APE_COLORS,
'alien'    => ALIEN_COLORS,
## more series
'vampire'  => VAMPIRE_COLORS,
'mummy'    => MUMMY_COLORS,
'orc'      => ORC_COLORS,
'skeleton' => SKELETON_COLORS,
'demon'    => DEMON_COLORS,
'robot'    => ROBOT_COLORS,
}


