class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(feed_id: params[:feed_id])
    @feed = @favorite.feed
    # @feed = Feed.find(params[:feed_id])
    respond_to do |format|
      if @favorite.save
        # format.js { render action_name == "index"? :index : :show }
        format.js { render :index }
      else
        format.html { redirect_to request.referrer, notice: 'お気に入り登録できませんでした' }
      end
    end
  end

  # def show
  #   @user = User.find(params[:id])
  #   @favorite = current_user.favorites.find_by(id: params[:id])
  #   unless current_user == @user
  #     flash[:error] = "権限がありません"
  #     redirect_to favorite_path(current_user)
  #   end
  # end

  def destroy
    # @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    @favorite = current_user.favorites.find_by(feed_id: params[:id]).destroy
    # @feed = Feed.find(params[:id])
    respond_to do |format|
      if @favorite.destroy
        format.js { render :index }
      else
        format.html { redirect_to request.referrer, notice: 'お気に入り登録できませんでした' }
      end
    end
  end
end
