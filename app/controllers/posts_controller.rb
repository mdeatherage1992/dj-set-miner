class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :api_show, :api_next]
  before_action :authenticate_user!, except: [:index, :show]



  def upvote
      @post = Post.find(params[:id])
      @post.upvote_by current_user
      redirect_to :back
    end

    def downvote
    @post= Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end

  def index
    @posts = Post.all
    @users = User.all
    @genres = Genre.all
    if !params[:genre].blank?
      @posts = Post.by_genre(params[:genre].to_i)
    end
    # render json: @posts
  end

  def api_index
    @posts = Post.all
    render json: @posts
  end

  def api_show
    # raise "hello".inspect
    render json: @post
  end

  def api_next
    @next_post = @post.next
    render json: @next_post
  end

  def popular
    @posts = Post.popular
  end




  def show
    @comments = @post.comments
    @comment = @post.comments.build
  end


  def new
    @post = Post.new
    @genres = Genre.all
    @post.genres.build
  end


  def edit
    @post.genres.build
  end


  def create
  @post = current_user.posts.build(post_params)
respond_to do |format|
    if @post.save
      format.html { redirect_to @post, notice: 'Link was successfully created.' }
      format.json { render :show, status: :created, location: @post }
    else
      format.html { render :new }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end


  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post).permit(:title, :url, :audience, :description, :video, genre_ids:[], genres_attributes: [:name])
    end
end
