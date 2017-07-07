class CommentsController < ApplicationController
  respond_to :html, :js, :json
  def index
    
  end
  def create
    post = Post.find(params[:post_id])
    post.comments.create(comments_params)

    redirect_to(post)
  end

  private
    def comments_params
      params.require(:comment).permit(:content)
    end
end
