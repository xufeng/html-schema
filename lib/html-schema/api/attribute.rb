class HTMLSchema
  class API
    class Attribute < HTMLSchema::Attribute
      def microdata
        if @microdata.nil?
          object     = HTMLSchema.instance.microdata[parent]
          object     = object[_name] if object
          object     = false if object.blank?
          @microdata = object
        end
        
        @microdata
      end
      
      def microdata?
        !!microdata
      end
      
      def microformat
        if @microformat.nil?
          object     = HTMLSchema.instance.microformat[parent]
          object     = object[_name] if object
          object     = false if object.blank?
          @microformat = object
        end
        @microformat
      end
      
      def microformat?
        !!microformat
      end
      
      def to_microdata
        microdata.to_hash
      end
      
      def to_microformat
        microformat.to_hash
      end
      
      def to_hash
        if microdata? && microformat?
          to_microdata.merge(to_microformat)
        elsif microdata?
          to_microdata
        elsif microformat?
          to_microformat
        else
          {}
        end
      end
    end
  end
end
