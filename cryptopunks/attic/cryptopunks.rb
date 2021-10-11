

### add more built-in (load on demand) design series / collections
DESIGNS_ORIGINAL = Cryptopunks::DesignSeries.new( "#{Cryptopunks.root}/config/original" )
DESIGNS_MORE     = Cryptopunks::DesignSeries.new( "#{Cryptopunks.root}/config/more" )

## all designs in one collections
DESIGNS = {}.merge( DESIGNS_ORIGINAL.to_h,
                    DESIGNS_MORE.to_h )
