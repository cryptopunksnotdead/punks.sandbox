
BEARD =  [ 'Big Beard', 'Front Beard Dark', 'Handlebars', 'Front Beard',
              'Chinstrap',
              'Goat',
              'Muttonchops',
              'Luxurious Beard',
              'Mustache',
              'Normal Beard Black', 'Normal Beard',
              'Shadow Beard' ]


def convert_to_punkette( *attributes )

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


  attributes[1..-1].each do |attribute|

    ## note: remove all beard (facial hair) attributes
    next if BEARD.include?( attribute )

    # note: "standard headband is black (hair) w/ headband really
    attribute = 'Headband 2'       if attribute == 'Headband'

    ## male-only hair-dos/sytles  - pick a female alternative for now
    attribute = 'Red Mohawk'       if attribute == 'Peak Spike'
    attribute = 'Black Afro'       if attribute == 'Vampire Hair'

    attributes_new << attribute
  end

   attributes_new
end


