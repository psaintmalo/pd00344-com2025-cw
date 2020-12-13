class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:refresh_comments]
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :check_owner, only: [:update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.post_comments(@post)
    @origin_url = params[:origin_url] == nil ? @post : params[:origin_url]
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.build
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_comments_path(@post), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def refresh_comments

    @data = @post.id

    respond_to do |format|
      format.js
    end
end


  private

    # Check the current user is the owner of a comment
    def check_owner
      if @comment.user != current_user
        respond_to do |format|
          format.html { redirect_to post_comments_path, alert: "You dont have permissions for this action!"}
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:commentText)
    end

    # Set the parent post of the comment
    def set_post
      @post = Post.find(params[:post_id])
    end
end
