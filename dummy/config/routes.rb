Rails.application.routes.draw do

  mount TranslationClient::Engine => "/translation_client"
end
