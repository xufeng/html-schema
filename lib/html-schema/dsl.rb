class HTMLSchema
  module DSL
    def type(name, options = {}, &block)
      types[name] = "#{self.name}::Object".constantize.new(name, options, &block)
    end
    
    def types
      @types ||= {}
    end
    
    def root
      @root ||= types.values.first
    end
    
    def [](key)
      types[key]
    end
    
    def []=(key, value)
      types[key] = value
    end
    
    def to_hash
      types.keys.inject({}) do |hash, key|
        hash[key] = types[key].to_hash
      end
    end
  end
end
