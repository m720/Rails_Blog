class CommentsPostsController < ApplicationController
  # before_action :set_comments_post, only: %i[ show edit update destroy ]
  before_action :authorized
  before_action :userAuthorized , only: [:update, :destroy]
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

      if @comments_post.save
        render(json: {message: "Comments post was successfully created."  }, status: :created)
      else
        render(json: {message: "Comments post was not created."  }, status: :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /comments_posts/1 or /comments_posts/1.json
  def update
    respond_to do |format|
      if @comments_post.update(comments_post_params)
        render(json: {message: "Comments post was successfully updated."  }, status: :ok)

      else
        render(json: {message: "Comments post was not updated."  }, status: :unprocessable_entity)
      end
    end
  end

  # DELETE /comments_posts/1 or /comments_posts/1.json
  def destroy
    @comments_post.destroy
    render(json: {message: "Comments post was successfully deleted."  }, status: :ok)

    respond_to do |format|

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
