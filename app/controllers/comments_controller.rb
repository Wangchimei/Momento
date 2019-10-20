class CommentsController < ApplicationController
  before_action :set_feed, only: [:create, :destroy]

  def create
    @user = User.find(current_user.id)
    @comment = @feed.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to feed_path(@feed), notice: '投稿できませんでした' }
      end
    end
  end

  def destroy
    @comment = @feed.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
  end

  private

  def set_feed
    @feed = Feed.find(params[:feed_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :feed_id, :user_id)
  end

end
