class HTMLSchema
  class Microdata
    class Object < HTMLSchema::Object
      def schema_url
        @schema_url ||= "http://schema.org/#{as.to_s.camelize}"
      end
      
      def to_hash
        {:itemscope => "itemscope", :itemtype => schema_url}
      end
    end
  end
end
