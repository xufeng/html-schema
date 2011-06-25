class HTMLSchema
  module Microformat
    class Object < HTMLSchema::Object
      def to_hash
        {:class => types.map(&:to_s).join(" ")}
      end
    end
  end
end
