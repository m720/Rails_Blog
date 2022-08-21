class UsersController < ApplicationController

  before_action :set_user, only: [:update, :destroy]
  before_action :userAuthorized , only: [:update, :destroy]

  # GET /users or /users.json
  def index
    @users = User.all
    render( json: {users: @users}, status: :ok)
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    render( json: {user: @user}, status: :ok)
  end


  # POST /users or /users.json (Register)
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save!
      exp = Time.now.to_i+ (12*60*60)
      token = encode_token({user_id: @user.id, "exp": exp})
      render( json: {user: @user, token: token}, status: :ok)
    else
      render(json: {
        errors: @user.errors, 
        }, status: :forbidden
      ) 
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      render( json: { user: @user, notice: "User was successfully updated." }, status: :created)
      
    else
      render(json: {errors: @user.errors}, status: :unprocessable_entity )
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if @user.destroy
      render( json: { notice: "User was successfully destroyed." }, status: :ok)
    else
      render( json: { notice: "User couldn't be destroyed" }, status: :forbidden)
    end

  end


  # login
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      exp = Time.now.to_i+ (12*60*60) #valid for 12 hours
      token = encode_token({user_id: @user.id, "exp": exp})
      render( json: {user: @user, token: token}, status: :ok)
    else
      render(json: {error: "invalid username or password"}, status: :unauthorized)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :image)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    #check if it's the same user that is trying to update or delete for himself or not
    def sameUser 
      if decoded_token
        user_id = decoded_token[0]["user_id"]

        user_id ==@user.id
      end
    end

    def userAuthorized
      render(json: {message: 'Not Authorized'}, status: :unauthorized) unless sameUser
    end
end
