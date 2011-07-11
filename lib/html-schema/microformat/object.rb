class HTMLSchema
  class Microformat
    class Object < HTMLSchema::Object
      def to_hash
        {:class => classes.join(" ")}
      end
    end
  end
end
