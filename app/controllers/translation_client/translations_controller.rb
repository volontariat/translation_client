class TranslationClient::TranslationsController < ApplicationController
  before_filter :find_resource, only: [:edit, :update, :destroy]
  
  respond_to :html
  
  before_filter :authenticate_user!
  
  def index
    @translations = Translation.order('translation_key ASC')
  end
  
  def new
    @translation = Translation.new(params[:i18n_backend_active_record_translation])
  end
  
  def create
    @translation = Translation.new(params[:i18n_backend_active_record_translation])
    
    if @translation.save
      I18n.backend.reload!
      
      redirect_to [:edit, @translation], notice: t('general.form.successfully_created')
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @translation.update_attributes(params[:i18n_backend_active_record_translation])
      I18n.backend.reload!
      
      redirect_to [:edit, @translation], notice: t('general.form.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    @translation.destroy
    I18n.backend.reload!
    
    redirect_to translation_client.translations_path, notice: t('general.form.destroyed')
  end
  
  def resource
    @translation
  end
  
  private
  
  def find_resource
    @translation = Translation.find(params[:id])
  end

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
