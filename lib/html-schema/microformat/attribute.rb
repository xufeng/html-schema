class HTMLSchema
  module Microformat
    class Attribute < HTMLSchema::Attribute
      def to_hash
        {:class => (as || name).to_s}
      end
    end
  end
end
