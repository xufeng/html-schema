class HTMLSchema
  class Configuration
    attr_accessor :microdata, :microformat
    
    def initialize
      @microdata   = true
      @microformat = true
    end
  end
end
