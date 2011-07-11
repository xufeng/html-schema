class HTMLSchema
  class Attribute < HTMLSchema::Object
    attr_accessor :type, :value
    
    def initialize(name, options = {}, &block)
      @_name      = name
      @value      = options
      @parent     = options[:parent]
      @as         = options[:as] || name
      @classes    = Array(as).map(&:to_s)
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
    
    class << self
      def attribute?
        true
      end
    end
  end
end
