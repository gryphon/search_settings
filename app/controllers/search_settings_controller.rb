class SearchSettingsController < ApplicationController

  respond_to :html

  before_action :authenticate_user!
  before_action :load_class, except: :index

  def index
    @search_settings = current_user.search_settings
    respond_with(@search_settings)
  end

  def show
    @search_settings = current_user.search_settings_for(@cls)
    respond_with(@search_settings)
  end

  def update
    @search_settings = current_user.set_search_settings_for(@cls, search_settings_params)
    respond_to do |format|
      format.json { render json: @search_settings }
    end
  end

  private

    def load_class
      @cls = params[:id].singularize.camelize.constantize
    end

    def search_settings_params
      params.require(:user).permit(fields: [])
    end

end
