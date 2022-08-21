class CommentsController < ApplicationController
  # before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authorized
  before_action :userAuthorized , only: [:update, :destroy]
  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        render(json: {notice: "Comment is successfully created." }, status: :created)
      else
        render(json: {notice: "Comment is not created." }, status: :unauthorized)
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        render(json: {notice: "Comment is successfully updated." }, status: :ok)

      else
        render(json: {notice: "Comment is not updated." }, status: :unprocessable_entity)

      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      render(json: {notice: "Comment is successfully destroyed." }, status: :unprocessable_entity)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :title, :body)
    end


       #check if it's the same user that is trying to update or delete for himself or not
  def sameUser 
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      comment_user_id  = (JSON.parse(request.raw_post))["commnet"]["user_id"]
      user_id ==comment_user_id
    end
  end

  def userAuthorized
    render json: {message: 'Not Authorized'}, status: :unauthorized unless sameUser
  end
end
