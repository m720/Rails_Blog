class TagsController < ApplicationController
  # before_action :set_tag, only: %i[ show edit update destroy ]
  before_action :authorized
  before_action :userAuthorized , only: [:update, :destroy]
  # GET /tags or /tags.json
  def index
    @tags = Tag.all
    render( json: {tags: @tags}, status: :ok)

  end

  # GET /tags/1 or /tags/1.json
  def show
  end

  # POST /tags or /tags.json
  def create
    @tag = Tag.new(tag_params)

      if @tag.save
        render(json: { message: "Tag was successfully created." }, status: :created )
      else
        render(json: {message: "tag was not created!", errors: @tag.errors}, status: :forbidden)
      end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        render( json: {message: "tag was updated succesfully"}, status: :ok )
      else
        render( json: {errors: @tag.errors}, status: :unprocessable_entity )
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    if @tag.destroy
      render(json: {notice: "Tag was successfully destroyed." }, status: :ok)
    else
      render(json: {notice: "Tag was not destroyed." }, status: :unauthorized)
    end

  end

  # find one or more tags by name
  def find_multiple(tags_names)
    # tags_number = 0 #counter for found tags
    tags_IDs= []
    puts "ids length befor add #{tags_IDs}"
    tags_names.each do |tag|
      @tag= Tag.find_by(title: tag)
      if(@tag)
        puts "tag #{tag} found!"
        tags_IDs.push(@tag.id)
      else 
        puts "tag #{tag} not found!"
      end
    end
    tags_IDs
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:title)
    end
end
