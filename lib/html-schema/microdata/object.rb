class HTMLSchema
  class Microdata
    class Base < HTMLSchema::Object
      def schema_url
        @schema_url ||= "http://schema.org/#{source.to_s.camelize}"
      end
      
      def to_hash
        {:itemprop => types.map(&:to_s).join(" "), :itemscope => "itemscope", :itemtype => schema_url}
      end
    end
  end
end
