class CommentsPostsController < ApplicationController
  before_action :set_comments_post, only: %i[ show edit update destroy ]

  # GET /comments_posts or /comments_posts.json
  def index
    @comments_posts = CommentsPost.all
  end

  # GET /comments_posts/1 or /comments_posts/1.json
  def show
  end

  # GET /comments_posts/new
  def new
    @comments_post = CommentsPost.new
  end

  # GET /comments_posts/1/edit
  def edit
  end

  # POST /comments_posts or /comments_posts.json
  def create
    @comments_post = CommentsPost.new(comments_post_params)

    respond_to do |format|
      if @comments_post.save
        format.html { redirect_to comments_post_url(@comments_post), notice: "Comments post was successfully created." }
        format.json { render :show, status: :created, location: @comments_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comments_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments_posts/1 or /comments_posts/1.json
  def update
    respond_to do |format|
      if @comments_post.update(comments_post_params)
        format.html { redirect_to comments_post_url(@comments_post), notice: "Comments post was successfully updated." }
        format.json { render :show, status: :ok, location: @comments_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comments_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments_posts/1 or /comments_posts/1.json
  def destroy
    @comments_post.destroy

    respond_to do |format|
      format.html { redirect_to comments_posts_url, notice: "Comments post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_post
      @comments_post = CommentsPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comments_post_params
      params.require(:comments_post).permit(:comment_id, :post_id)
    end
end
