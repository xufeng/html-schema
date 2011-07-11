class HTMLSchema
  class Microformat
    class Attribute < HTMLSchema::Attribute
      def to_hash
        {:class => classes.join(" ")}
      end
    end
  end
end
