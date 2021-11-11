#####################
#  generate punks; to run use:
#
#   $ ruby ./generate.rb




$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'





collections = {
  ##  8 punks - the wired (magazine) edition december 2021/january 2022
  ##
## The Cryptopunks:
##   1. Punk 5124: She is one of 147 Punks who have a blond bob and
##                  one of 332 wearing a VR headset.
##   2. Punk 5224: His luxurious beard can be found on 286 Punks,
##                  while 414 have finger-in-socket red hair.
##                  This Punk sold in April for $66,664.
##   3. Punk 1478: One of 88 zombies, this bearded, wild-haired Punk
##                 is Erick Calderon’s avatar on Discord and Twitter.
##   4. Punk 4344: She is one of 382 with green clown-eye makeup;
##                 696 have red lipstick. Her creators call her coif "frumpy hair".
##   5. Punk 3435: She rocks a sporty headband (406) and has purple lips (655).
##                 Serena Williams owns a nearly identical Punk.
##   6. Punk 7804: Only nine aliens exist.
##                 The cofounder of the startup Figma, Dylan Field, sold this one
##                  in March for $7.57 million.
##   7. Punk 1629: Claire Silver's avatar is set apart by her black lipstick (617)
##                 and the rare "pink with hat" trait (95).
##   8. Punk 5724: This woman is one of 461 Punks with an eye patch
##                 and one of 447 with wild hair.
##
## Source - Wired - The 10,000 Faces That Launched an NFT Revolution
##    (https://www.wired.com/story/the-10000-faces-that-launched-an-nft-revolution/)
 'wired' => {
    composite: [4,2],  # grid 4x2 (=8 punks)
    punks: [
     ["Female 3", "Blonde Bob",      "VR"],                               # 5124
     ["Male 1",   "Luxurious Beard", "Crazy Hair"],                       # 5224
     ["Zombie",   "Shadow Beard",    "Wild Hair"],                        # 1478
     ["Female 2", "Hot Lipstick",    "Frumpy Hair", "Clown Eyes Green"],  # 4344
     ["Female 1", "Purple Lipstick", "Headband"],                         # 3435
     ["Alien",    "Cap Forward",     "Pipe", "Small Shades"],             # 7804
     ["Female 3", "Black Lipstick",  "Pink With Hat"],                    # 1629
     ["Female 4", "Wild Hair",       "Eye Patch"]                         # 5724
  ]},
   ####
   ##  9 punks - Christie's Auction (21st Century Evening Sale) on May 11st, 2021
   ##
   ##  source: https://www.christies.com/features/10-things-to-know-about-CryptoPunks-11569-1.aspx
   'christies' => {
    composite: [3,3],  # grid 3x3 (=9 punks)
    punks: [
      ["Female 3", "Wild Hair"],                             # 2
      ["Female 1", "Mohawk Dark"],                           # 532
      ["Male 2",   "Normal Beard Black", "Hoodie"],          # 58
      ["Male 1",   "Normal Beard Black", "Cap"],             # 30
      ["Alien",    "Bandana",            "Regular Shades"],  # 635
      ["Female 3", "Hot Lipstick",       "Crazy Hair"],      # 602
      ["Male 3",   "Muttonchops",        "Earring",     "Cap Forward", "Big Shades"],  # 768
      ["Female 4", "Black Lipstick",     "Wild Blonde", "Cigarette"],   # 603
      ["Female 1", "Purple Lipstick",    "Earring",     "Messy Hair"]   # 757
    ]},
  ###
  ## 9 top selling punks (as of Nov 11st, 2021)
  ##
  ## source: CryptoPunks Top Sales
  ##    (https://www.larvalabs.com/cryptopunks/topsales)
  'top' => {
    composite: [3,3],  # grid 3x3 (=9 punks)
    punks: [
      ["Alien",  "Headband"],                                   # 3100
      ["Alien",  "Cap Forward", "Pipe",       "Small Shades"],  # 7804
      ["Ape",    "Gold Chain",  "Knitted Cap"],                 # 5217
      ["Zombie", "Wild Hair",   "3D Glasses"],                  # 8857
      ["Zombie", "Chinstrap",   "Earring",    "Crazy Hair"],    # 7252
      ["Ape",    "Knitted Cap", "Small Shades"],                # 2140
      ["Zombie", "Mohawk Thin"],                                # 2338
      ["Zombie", "Shadow Beard", "Mohawk Dark"],                # 6275
      ["Zombie", "Chinstrap",    "Earring",    "Crazy Hair"]    # 7252
    ]}
}


collections.each do |collection_name, collection|
  composite = ImageComposite.new( *collection[:composite] )

  collection[:punks].each_with_index do |attributes,i|
     punk = Punks::Image.generate( *attributes )

     punk.save( "./i/#{collection_name}#{i}.png" )
     punk.zoom(4).save( "./i/#{collection_name}#{i}@4x.png" )

     composite << punk
  end

  composite.save( "./i/#{collection_name}.png" )
  composite.zoom(4).save( "./i/#{collection_name}@4x.png" )
end

puts "bye"




__END__

##############
## pretty print attributes via contract

## wired (magazine)
[5124, 5224, 1478, 4344,
 3435, 7804, 1629, 5724].each do |id|
  pp CryptoPunksData.punk_attributes( id )
end

## top (sales)
[3100, 7804, 5217,
 8857, 7252, 2140,
 2338, 6275, 7252].each do |id|
  pp CryptoPunksData.punk_attributes( id )
end

## christie's
[  2, 532,  58,
  30, 635, 602,
 768, 603, 757].each do |id|
  pp CryptoPunksData.punk_attributes( id )
end


