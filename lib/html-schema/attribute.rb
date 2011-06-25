class HTMLSchema
  class Attribute < HTMLSchema::Object
    attr_accessor :type, :name, :value
    
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
