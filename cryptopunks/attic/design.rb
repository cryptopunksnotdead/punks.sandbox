
class Design   ## todo/fix - move to its own file!!!

end # class Design


##############
## todo/check:
##    find a better way to (auto?) include more designs?
class DesignSeries    ## find a better name for class (just use Series?) - why? why not?
  def self.build( dir )
    data = {}
    paths =  Dir.glob( "#{dir}/**.txt" )
    paths.each do |path|
      basename = File.basename( path, File.extname( path ) )
      text = File.open( path, 'r:utf-8' ) { |f| f.read }
      ## todo/check: auto-parse "ahead of time" here
      ##              or keep "raw" text - why? why not?
      data[ basename ] = text
    end
    data
  end

  def initialize( dir )
    @dir = dir  # e.g. "#{Cryptopunks.root}/config/more"
  end

  def data
    ## note: lazy load / build on first demand only
    @data ||= self.class.build( @dir )
  end

  def [](key) data[ key ]; end
  def size()    data.size; end
  def keys()    data.keys; end
  def to_h()    data; end    ## todo/check: use to_hash() - why? why not?
end   # class DesignSeries






