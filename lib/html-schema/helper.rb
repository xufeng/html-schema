class HTMLSchema
  module Helper
    def htmlschema
      @htmlschema ||= HTMLSchema.instance
    end
    
    def microformat
      htmlschema.microformat
    end
    
    def microdata
      htmlschema.microdata
    end
  end
end
