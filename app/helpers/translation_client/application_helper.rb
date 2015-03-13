module TranslationClient
  module ApplicationHelper
    def method_missing(m, *args, &block)
      if m.to_s.match(/i18n_backend_active_record_translation/) && m.to_s.match(/path|url/)
        translation_client.send m.to_s.gsub('i18n_backend_active_record_translation', 'translation'), *args, &block
      elsif m.to_s.match(/path|url/) && main_app.respond_to?(m)
        main_app.send m, *args, &block
      else
        super m, *args, &block
      end
    end
  end
end
