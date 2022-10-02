class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    @list = flickr.photos.getRecent(per_page: 15)
    if params[:user_id]
      @photos = flickr.photos.search(user_id: search_params, per_page: 15)
    end
  end

  private

  def search_params
    params.require(:user_id)
  end


    
end