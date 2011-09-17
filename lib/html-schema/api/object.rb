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
      
      def to_hash
        result = {}
        deep_merge(result, microdata.to_hash) if microdata
        deep_merge(result, microformat.to_hash) if microformat
        result
      end
      
      def to_object
        result = {}
        deep_merge(result, microdata.to_object) if microdata
        deep_merge(result, microformat.to_object) if microformat
        result
      end
      
      private
      def deep_merge(result, object = {})
        object.each do |key, value|
          if result.has_key?(key)
            case result[key]
            when ::Hash
              result[key] = deep_merge(result[key], value)
            when ::Array
              result[key] |= value
            end
          else
            result[key] = value
          end
        end
        result
      end
    end
  end
end
