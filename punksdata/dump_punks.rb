#####
##  dump addPunks transactions


lines = File.open( './transactions.txt', 'r:utf-8') {|f| f.read }


rows = []
lines.each_line do |line|
   next unless line.index('addPunks')  ##   skip all txns (unless addPunks)

   ## cut-off - leading ..... until first :
   line = line.sub( /^[^,]+,0x/, '' )
   line = line.strip

   if line.size != 1600    ## add assertion check - line must be 100 punks*(8 btyes*2) = 1600 (hex)chars
     puts "!! ERROR - expected line size of 1600; got #{line.size}:"
     puts line
     exit 1
   end

   rows << line
end


## pp rows
puts "  #{rows.size} row(s)"


buf = String.new('')
rows.each do |row|
   ## 5 blocks per line  (16*5 = 80)
   ##  20 lines           80*20 = 1600  <=> 16 * 100
   20.times do |y|
      dy = y*(16*5)

      buf << "#{row[dy,16]} "
      buf << "#{row[dy+16,16]} "
      buf << "#{row[dy+32,16]} "
      buf << "#{row[dy+48,16]} "
      buf << "#{row[dy+64,16]}"
      buf << "\n"
   end
   buf << "\n"
end

puts buf


puts "bye"



__END__

File.open( "./meta.txt", "w:utf-8" ) do |f|
   f.write( buf.strip )
end
