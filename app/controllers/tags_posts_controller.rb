class TagsPostsController < ApplicationController
  # before_action :set_tags_post, only: %i[ show edit update destroy ]
  before_action :authorized
  # GET /tags_posts or /tags_posts.json
  def index
    @tags_posts = TagsPost.all
  end

  # GET /tags_posts/1 or /tags_posts/1.json
  def show
  end

  # GET /tags_posts/new
  def new
    @tags_post = TagsPost.new
  end

  # GET /tags_posts/1/edit
  def edit
  end

  # POST /tags_posts or /tags_posts.json
  def create
    @tags_post = TagsPost.new(tags_post_params)

    respond_to do |format|
      if @tags_post.save
        format.html { redirect_to tags_post_url(@tags_post), notice: "Tags post was successfully created." }
        format.json { render :show, status: :created, location: @tags_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tags_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags_posts/1 or /tags_posts/1.json
  def update
    respond_to do |format|
      if @tags_post.update(tags_post_params)
        format.html { redirect_to tags_post_url(@tags_post), notice: "Tags post was successfully updated." }
        format.json { render :show, status: :ok, location: @tags_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tags_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags_posts/1 or /tags_posts/1.json
  def destroy
    @tags_post.destroy

    respond_to do |format|
      format.html { redirect_to tags_posts_url, notice: "Tags post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tags_post
      @tags_post = TagsPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tags_post_params
      params.require(:tags_post).permit(:post_id, :tag_id)
    end
end
