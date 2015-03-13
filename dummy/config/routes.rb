Rails.application.routes.draw do
  mount TranslationClient::Engine => "/"
end
