module TranslationClient
  module Concerns
    module Model
      module Translation
        extend ActiveSupport::Concern
        
        included do
          attr_accessible :locale, :translation_key, :value, :interpolations
        end
      end
    end
  end
end