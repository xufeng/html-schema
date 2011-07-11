class HTMLSchema
  class Microdata
    class Attribute < HTMLSchema::Attribute
      def to_hash
        {:itemprop => classes.join(" ")}
      end
    end
  end
end
