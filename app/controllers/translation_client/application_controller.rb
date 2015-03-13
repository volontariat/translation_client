class TranslationClient::ApplicationController < ActionController::Base
  before_filter :my_method
  
  def my_method
    raise 'ok3:' + translation_client.translations_path
  end
end