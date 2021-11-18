
BEARD =  [ 'Big Beard', 'Front Beard Dark', 'Handlebars', 'Front Beard',
              'Chinstrap',
              'Goat',
              'Muttonchops',
              'Luxurious Beard',
              'Mustache',
              'Normal Beard Black', 'Normal Beard',
              'Shadow Beard' ]


EXCLUDE = BEARD + ['Buck Teeth']


def convert_to_punkette( *attributes, size: 's' )

  attributes_new = []
  if attributes[0].index( 'Male' )
    ## change male to female e.g.
    ##    Male 1 => Female 1
    ##    Male 2 => Female 2
    ##    ...
    attributes_new <<  attributes[0].sub( 'Male', 'Female' )
  elsif ['Zombie', 'Ape', 'Alien'].include?( attributes[0] )
    ## change to female e.g.
    ##     Zombie  => Zombie Female
    ##     Ape     => Ape Female
    ##     Alien   => Alien Female
    attributes_new <<  attributes[0] + ' Female'
  else  ## assume female - keep as-is  (small)
     return attributes
  end


  attributes_new[0] += ' (U)'    if size == 'l'    ## (l)arge / unisize female?


  attributes[1..-1].each do |attribute|

    ## note: remove all beard (facial hair) + buck teeth attributes
    next if EXCLUDE.include?( attribute )

    # note: "standard headband is black (hair) w/ headband really
    attribute = 'Headband 2'       if attribute == 'Headband' && size == 's'

    ## male-only hair-dos/sytles  - pick a female alternative for now
    attribute = 'Black Afro'       if attribute == 'Vampire Hair'
    ## -- note for now red mohawk not available in unisize (change/fix later!!!)
    attribute = (size == 's' ? 'Red Mohawk' : 'Mohawk Dark')    if attribute == 'Peak Spike'


    attributes_new << attribute
  end

   attributes_new
end


