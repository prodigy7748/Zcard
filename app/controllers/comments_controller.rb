class CommentsController < ApplicationController
  before_action :session_required
  before_action :find_post, only: [:create]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    #挑出現在使用者的所有comment
    comment.destroy
    #comment.update(deleted_at: Time.now)搬到model
    redirect_to comment.post, notice: '留言刪除！'
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end