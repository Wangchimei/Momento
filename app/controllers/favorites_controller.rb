class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(feed_id: params[:feed_id])
    @feed = @favorite.feed
    respond_to do |format|
      if @favorite.save
        format.js { render action_name == "index"? :index : :show }
      else
        format.html { redirect_to request.referrer, notice: 'お気に入り登録できませんでした' }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @favorite = current_user.favorites.find_by(id: params[:id])
    unless current_user == @user
      flash[:error] = "権限がありません"
      redirect_to favorite_path(current_user)
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    respond_to do |format|
      if favorite.destroy
        format.js { render current_page }
      else
        format.html { redirect_to request.referrer, notice: 'お気に入り登録できませんでした' }
      end
    end
  end
end
