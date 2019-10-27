class FavoritesController < ApplicationController
  respond_to? :js

  def create
    @feed = Feed.find(params[:feed_id])
    current_user.favorite!(@feed)
  end


  def destroy
    @feed = Feed.find(params[:id])
    current_user.unfavorite!(@feed)
  end
end
