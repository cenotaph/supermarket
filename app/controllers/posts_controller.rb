class PostsController < ApplicationController
  
  def index
    @posts = Post.by_subsite(@subsite.id).published.order('published_at DESC').page(params[:page]).per(5)
  end
  
  def show
    @post = Post.friendly.find(params[:id])
  end
  

end