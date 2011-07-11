class HTMLSchema
  module Helper
    def htmlschema(*args)
      options                = args.extract_options!
      object                 = HTMLSchema.instance
      args.each { |i| object = object.send(i) }
      object.to_hash.merge(options)
    end
  end
end
