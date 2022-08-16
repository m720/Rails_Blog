class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]
  before_action :authorized
  # GET /posts or /posts.json
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1 or /posts/1.json
  def show
    render json: @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
      if @post.valid?
        @post.save!
        render json: {post: @post, notice: "Post was successfully created." }
      else
        render json: {errors: @post.errors}
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      render json: { post: @post, notice: "post was successfully updated." }
      
    else
      render json: {errors: @post.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    #TODO must be the same post
    @post.destroy
      render json: { notice: "post was successfully destroyed." }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
