class HTMLSchema
  class API
    class Attribute < HTMLSchema::Attribute
      def microdata
        @microdata ||= HTMLSchema.instance.microdata[parent][_name]
      end
      
      def microformat
        @microformat ||= HTMLSchema.instance.microformat[parent][_name]
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
