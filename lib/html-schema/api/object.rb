class HTMLSchema
  # This model module is the standard API.
  class API
    class Object < HTMLSchema::Object
      def microdata
        @microdata ||= "::HTMLSchema::Microdata::#{self.class.name.split("::").last}".constantize.new
      end
      
      def microformat
        @microformat ||= "::HTMLSchema::Microformat::#{self.class.name.split("::").last}".constantize.new
      end
      
      def to_microdata
        microdata.to_hash
      end
      
      def to_microformat
        microformat.to_hash
      end
      
      def to_hash
        to_microdata.merge(to_microformat)
      end
    end
  end
end
