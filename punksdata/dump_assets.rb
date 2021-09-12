#####
##  dump addAssets transactions


lines = File.open( './transactions.txt', 'r:utf-8') {|f| f.read }


rows = []
lines.each_line do |line|
   next unless line.index('addAsset')  ##   skip all txns (unless addAsset)

   ## cut-off - leading ..... until first :
   line = line.sub( /^[^:]+:/, '' )
   line = line.strip
   values = line.split( ',' )
   pp values

   rows << { id: values[0].to_i(10),
             name: values[2],
             hex: values[1] }
end


pp rows
puts "  #{rows.size} row(s)"


puts "bye"