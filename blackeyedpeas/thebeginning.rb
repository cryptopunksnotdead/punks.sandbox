require 'pixelart'


names = %w[
  william
  fergie
  taboo
  apldeap
]


blackeyedpeas_i = ImageComposite.new( 2, 2, width: 25,
                                          height: 25,
                                          background: '#638596' )


names.each do |name|
  blackeyedpeas_i << Image.read( "./#{name}-25x25.png" )
end

blackeyedpeas_i.save( "./tmp/thebeginning_vol1.png" )
blackeyedpeas_i.zoom(8).save( "./tmp/thebeginning_vol1@8x.png" )



YELLOW = '#ffff00'
GREEN  = '#00ff00'
RED    = '#ff0000'
BLUE   = '#0000ff'

blackeyedpeas_ii = ImageComposite.new( 2, 2, width: 25,
                                          height: 25,
                                          background: [YELLOW, GREEN, RED, BLUE] )

names.each do |name|
  blackeyedpeas_ii << Image.read( "./#{name}-25x25.png" )
end

blackeyedpeas_ii.save( "./tmp/thebeginning_vol2.png" )
blackeyedpeas_ii.zoom(8).save( "./tmp/thebeginning_vol2@8x.png" )



composite = ImageComposite.new( 3, 1, width: 300,
                                      height: 300)
composite << blackeyedpeas_ii.zoom(6)  ## 6x zoom = 300x300
composite << blackeyedpeas_i.zoom(6)
composite << Image.read( "./thebeginning-300x300.png")

composite.save( "./tmp/thebeginning@6x.png" )



composite = ImageComposite.new( 3, 1, width: 200,
                                      height: 200)
composite << blackeyedpeas_ii.zoom(4)  ## 4x zoom = 200x200
composite << blackeyedpeas_i.zoom(4)
composite << Image.read( "./thebeginning-200x200.png")

composite.save( "./tmp/thebeginning@4x.png" )


puts "bye"

