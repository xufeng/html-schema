class HTMLSchema
  class Attribute < HTMLSchema::Object
    attr_accessor :type, :value, :options, :required
    
    def initialize(name, options = {}, &block)
      @_name      = name
      @value      = options
      @parent     = options[:parent]
      @as         = options[:as] || name
      @classes    = Array(as).map(&:to_s)
      @required   = options[:required] == true
      @type       = options[:type] || :string
      
      @options    = options.except(:as, :parent, :required, :type)
      @options.each do |key, value|
        @options[key] = value.to_s
      end
    end
    
    def inspect
      "#<#{self.class.name} name: #{_name.inspect}, value: #{value.inspect}>"
    end
    
    # ISO 8601 date format
    def format(value)
      case type
      when :date
        ::Date.parse(value)
      else
        value.to_s
      end
    end
    
    def value=(value)
      @value = format(value)
    end
    
    def to_hash
      {}
    end
    
    def to_object
      to_hash.merge(:type => type)
    end
    
    class << self
      def attribute?
        true
      end
    end
  end
end
