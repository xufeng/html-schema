class HTMLSchema
  # This model module is the standard API.
  class API
    class Object < HTMLSchema::Object
      def microdata
        @microdata ||= HTMLSchema.instance.microdata[_name]
      end
      
      def microformat
        @microformat ||= HTMLSchema.instance.microformat[_name]
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
