class HTMLSchema
  module Microdata
    class Attribute < HTMLSchema::Attribute
      def to_hash
        {:itemprop => (as || name).to_s}
      end
    end
  end
end
