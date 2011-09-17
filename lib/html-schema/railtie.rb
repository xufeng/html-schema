class HTMLSchema
  class Railtie < Rails::Railtie
    initializer "htmlschema.insert_into_action_view" do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, HTMLSchema::Helper
      end
    end
  end if defined?(::Rails)
end
