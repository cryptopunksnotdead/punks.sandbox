# Notes

try default proc - why? why not?

Default Proc¶ ↑
When the default proc for a Hash is set (i.e., not nil), the default value returned by method [] is determined by the default proc alone.

You can retrieve the default proc with method default_proc:

h = Hash.new
h.default_proc # => nil
You can set the default proc by calling ::new with a block or calling the method default_proc=

h = Hash.new { |hash, key| "Default value for #{key}" }
h.default_proc.class # => Proc
h.default_proc = proc { |hash, key| "Default value for #{key.inspect}" }
h.default_proc.class # => Proc
When the default proc is set (i.e., not nil) and method [] is called with with a non-existent key, [] calls the default proc with both the Hash object itself and the missing key, then returns the proc’s return value:

h = Hash.new { |hash, key| "Default value for #{key}" }
h[:nosuch] # => "Default value for nosuch"
Note that in the example above no entry for key :nosuch is created:

h.include?(:nosuch) # => false
However, the proc itself can add a new entry:

synonyms = Hash.new { |hash, key| hash[key] = [] }
synonyms.include?(:hello) # => false
synonyms[:hello] << :hi # => [:hi]
synonyms[:world] << :universe # => [:universe]
synonyms.keys # => [:hello, :world]
Note that setting the default proc will clear the default value and vice versa.


--------

Sets the default proc to be executed on each failed key lookup.

h.default_proc = proc do |hash, key|
  hash[key] = key + key
end
h[2]       #=> 4
h["cat"]   #=> "catcat"