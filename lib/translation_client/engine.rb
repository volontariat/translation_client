module TranslationClient
  class Engine < ::Rails::Engine
    isolate_namespace TranslationClient
    
    config.autoload_paths << File.expand_path("../../../app/models/concerns", __FILE__)
    config.autoload_paths << File.expand_path("../../../app/controllers/concerns", __FILE__)
    config.i18n.load_path += Dir[File.expand_path("../../../config/locales/**/*.{rb,yml}", __FILE__)]
    
    config.generators{|g| g.orm :active_record }
    
    config.to_prepare do
      I18n::Backend::ActiveRecord::Translation.send :include, ::TranslationClient::Concerns::Model::Translation
    end
    
    initializer 'translation_client.add_view_helpers' do |config|
      ActionView::Base.send :include, TranslationClient::ApplicationHelper
    end
  end
end
