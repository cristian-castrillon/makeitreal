class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  respond_to :html, :js, :json
  def index
    @post = Post.includes(:comments).find(params[:post_id])
    # render json: @post.comments
    # respond_to do |format|
      
    #   format.js
    # end
  end

  def show
    
  end

  def create
    post = Post.find(params[:post_id])
    post.comments.create(comments_params)

    redirect_to(post)
  end

  def destroy
    # comment = Comment.find(params[:id])
    # comment.destroy
    # redirect_to(Post.find(params[:post_id]))
    @post = Post.includes(:user).find params[:post_id]
    if current_user != @post.user
      return render json: { error: 'post does not belongs to you' }, status: :forbbiden
    end
    Comment.destroy params[:id]
    head :no_content
  end

  private
    def comments_params
      params.require(:comment).permit(:content)
    end
end
