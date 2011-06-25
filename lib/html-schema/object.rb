class HTMLSchema
  class Object
    attr_accessor :parent, :source, :as, :types, :attributes
    
    attribute :id
    attribute :title
    attribute :url
    attribute :description
    attribute :image

    class << self
      def types
        @types ||= HTMLSchema.bootstrap!(:microdata)
      end
      
      def [](key)
        types[key]
      end
    end
    
    def initialize(attributes = {})
      # initialize attributes
      self.types = self.class.types.keys
      self.types = [self.class.name.underscore.split("/").last.to_sym] if self.types.blank?
      
      self.class.all_attributes.each do |name, options|
        self.attributes[name] = create_attribute(name, options)
      end
      
      self.source ||= types.first
      
      attributes.each do |key, value|
        if self.respond_to?("#{key}=")
          self.send("#{key}=", value)
        else
          self.send(key).value = value
        end
      end
    end
    
    # simplify
    def [](key)
      key == :type ? self.to_hash : send(key).to_hash
    end
    alias_method :attribute, :[]
    
    def value(key)
      send(key).value
    end
    
    def to_hash
      {}
    end
    
    def key
      @key ||= self.class.name.underscore.split("/").last.to_sym
    end
    
    def attributes
      @attributes ||= {}
    end
    
    class << self
      def attribute(name, options = {})
        attributes[name] = options
      end
      
      def attributes
        @attributes ||= {}
      end
      
      def all_attributes
        result = {}
        (self.ancestors - self.included_modules).reverse.each do |klass|
          result.merge! klass.attributes if klass.respond_to?(:attributes)
        end
        result
      end
      
      def attribute?
        false
      end
      
      def type(name, options = {})
        types[name] = options
      end
      
      def types
        @types ||= {}
      end
    end
    
    protected
    def format_class
      @format_class ||= "#{self.class.name.split("::")[0..-2].join("::")}".constantize
    end
    
    def create_attribute(name, options = {})
      type = case options[:type]
      when :date, :boolean, :integer, :number, :text, :string, nil
        :attribute
      else
        options[:type]
      end
      
      if type == :attribute
        self.class.send :define_method, name do
          self.attributes[name]
        end unless self.respond_to?(name)
        "::#{format_class.name}::#{type.to_s.camelize}".constantize.new(options.merge(:name => name, :parent => key))
      else
        self.class.send :define_method, name do
          self.attributes[name] ||= format_class[name]
        end unless self.respond_to?(name)
        nil
      end
    end
  end
end
