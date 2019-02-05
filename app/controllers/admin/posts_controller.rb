# frozen_string_literal: true

class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[show edit update destroy]

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Saved.'
      redirect_to admin_posts_path
    else
      flash[:error] = 'Error saving post: ' + @post.errors.full_messages.join('; ')
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end
  
  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy!
    flash[:notice] = 'Post deleted.'
    redirect_to admin_posts_path    
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = 'Post updated.'
      redirect_to admin_posts_url
    else
      flash[:error] = 'Error saving post: ' + @post.errors.full_messages
    end
  end

  def new
    @post = Post.new(posted_by_id: current_user.id)
  end

  protected

  def post_params
    params.require(:post).permit(:published, :subsite_id, :promoted, :post_as_supermarket, :last_edited_by_id, :postimage, :slug, :published_at, :posted_by_id, :dont_show_image,
                         translations_attributes: %i[locale id subject body],
                         postslides_attributes: %i[id caption credit image _destroy])
  end
end
