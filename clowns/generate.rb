###############################
# to run use:
#    $  ruby ./generate.rb


$LOAD_PATH.unshift( "../cryptopunks/lib" )
require 'cryptopunks'


#####################################
## generate 12x12
composite = ImageComposite.new( 12, 12 )



noses = ['Clown Nose Red', 'Clown Nose Blue', 'Clown Nose Green']
eyes  = ['Clown Eyes Blue', 'Clown Eyes Green', 'Clown Eyes Purple']

clown_hair  = [
         'Clown Hair Black',
         'Clown Hair Dark Red',
         'Clown Hair Orange',
         'Clown Hair Red',
         'Clown Hair Pink',
         'Clown Hair Purple',
         'Clown Hair Blue',
         'Clown Hair Periwinkle',
         'Clown Hair Light Blue',
         'Clown Hair Light Green',
         'Clown Hair Green',
         'Clown Hair Teal',
         'Clown Hair Blonde']
big_hair  = [
         'Big Hair Black',
         'Big Hair Dark Red',
         'Big Hair Orange',
         'Big Hair Red',
         'Big Hair Pink',
         'Big Hair Purple',
         'Big Hair Blue',
         'Big Hair Periwinkle',
         'Big Hair Light Blue',
         'Big Hair Light Green',
         'Big Hair Green',
         'Big Hair Teal',
         'Big Hair Blonde']

hats  = ['Jester Hat', 'Birthday Hat', 'Sombrero']

blemishes = ['Mole', 'Rosy Cheeks', 'Spots']

glasses = ['Heart Shades', '3D Glasses']


### setup "deterministic" random seed
srand( 42 )


(0..143).each do |id|

   attributes = []

   gender    =  rand(2) == 0 ? 'Male' : 'Female'
   skin_tone =  case rand(100)
                   when 0..60  then '4'    ## is "clown-ish"/ white-ish (albino)
                   when 61..70 then '3'
                   when 71..80 then '2'
                   when 81..90 then '1'
                   when 91..95 then 'Gold 1'
                   else             'Gold 2'   ## is "yellow-ish"
                end

   attributes << "#{gender} #{skin_tone}"

   attributes << blemishes[ rand( blemishes.size) ]   if rand(100) < 33   ## add to 33% of 100

   attributes <<   case rand(100)
                    when 0..10  then hats[ rand(hats.size) ]
                    when 11..70 then clown_hair[ rand( clown_hair.size) ]
                    else             big_hair[ rand( big_hair.size) ]
                    end

   attributes << eyes[ rand(eyes.size) ]
   attributes << noses[ rand(noses.size) ]

   attributes << glasses[ rand( glasses.size) ]   if rand(100) < 10   ## add to 10% of 100

   attributes << 'Bubble Gum'   if rand(100) < 5   ## add to 5% of 100


   pp attributes

   punk = Punks::Image.generate( *attributes )

   composite << punk
end


composite.save( "./tmp/clownpunks.png" )
composite.zoom(2).save( "./tmp/clownpunks@2x.png" )
composite.zoom(4).save( "./tmp/clownpunks@4x.png" )


puts "bye"

