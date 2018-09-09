class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post
  # only: [:index,:show,:edit,:update, :create]

  def index
    @comments = @post.comments
  end

  def new
    @comment = Comment.new
  end

  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.create(comment_params)
  #   @comment.user = current_user
  #   respond_to do |format|
  #     binding.pry
  #     if @comment.save
  #       format.json { render json: @comment, status: :created, location: @comment }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  #
  # def index
  #   @comments = @post.comments
  #   # It went to implicit rendering
  #   # render :layout => false
  #   # render :json => @comments
  #   # render :layout => false
  #
  #   respond_to do |format|
  #     format.html {render 'index.html', :layout => false}
  #     format.js {render 'index.js', :layout => false}
  #   end
  # end
  #
  # def create
  #   @comment = @post.comments.build(comment_params)
  #   if @comment.save
  #     # I need to render something that just has the LI I want...
  #     # why not just create a comments/show view that shows the LI of one comment?
  #     render 'comments/show', :layout => false
  #   else
  #     render "posts/show"
  #   end
  # end
  #
  # def show
  # end




  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
private

    def set_post
      @post = Post.find_by(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:post_id, :body, :user_id)
    end
end
