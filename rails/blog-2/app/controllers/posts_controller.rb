class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # Me autentica todos los métodos del controlador, excepto index

  def index
    
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
      format.js #{ render partial: 'form', content_type: 'text/plain' }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      if current_user.posts.length == 1
        FirstPostMailer.first_post_email(current_user).deliver_now
        # FirstPostMailer.first_post_email(current_user).deliver_later
      end
      redirect_to(user_post_path(current_user, @post))
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      respond_to do |format|
        format.html
        format.js
      end
    else
      render :show
    end

  end

  def update
    post = Post.find(params[:id])
    unless current_user == post.user
      # redirect_to(user_posts_path(current_user))
      return :forbidden
    end
    if post.update(post_params)
      # redirect_to(posts_path, notice: 'El producto ha sido modificado con éxito')
      redirect_to(user_post_path(post.user, post))
    else
      render :edit
    end
  end

  def destroy
    
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
