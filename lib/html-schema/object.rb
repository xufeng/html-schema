class HTMLSchema
  class Object
    attr_accessor :parent, :source, :as, :types, :attributes, :_name
    attr_accessor :classes
    
    def initialize(name, options = {}, &block)
      @_name      = name
      @attributes = {}
      @types      = {}
      @parent     = options[:parent]
      @as         = options[:as]
      @as         ||= @parent ? @parent.as : name
      @classes    = Array(as).map(&:to_s)
      
      # inherit parent attributes
      @parent.attributes.each do |key, attribute|
        self.attribute key, attribute.value
      end if @parent
      
      instance_eval(&block) if block_given?
    end
    
    def attribute(name, options = {})
      create_attribute name, options
    end
    
    def type(name, options = {}, &block)
      create_type name, options, &block
    end
    
    def inspect
      "#<#{self.class.name} name: #{_name.inspect}, attributes: #{attributes.inspect} parent: #{(parent.present? ? parent._name : nil).inspect}, types: #{types.keys.inspect}>"
    end
    
    def [](key)
      attributes[key]
    end
    
    protected
    def format_class
      @format_class ||= "#{self.class.name.split("::")[0..-2].join("::")}".constantize
    end
    
    def attribute_class
      @attribute_class ||= "#{format_class.name}::Attribute".constantize
    end
    
    def create_attribute(name, options = {})
      attributes[name] = attribute_class.new(name, options.merge(:parent => _name))
      
      self.class.send :define_method, name do
        self.attributes[name]
      end unless self.respond_to?(name)
    end
    
    def create_type(name, options = {}, &block)
      types[name] = format_class[name] = self.class.new(name, options.reverse_merge(:parent => self), &block)
      self.class.send :define_method, name do
        self.types[name]
      end unless self.respond_to?(name)
    end
  end
end
