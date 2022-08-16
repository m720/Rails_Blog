class UsersController < ApplicationController

  # before_action :authorized, only: [:auto_login]
  before_action :set_user, only: [:update, :destroy]
  before_action :userAuthorized , only: [:update, :destroy]

  # GET /users or /users.json
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json (Register)
  def create
    @user = User.new(user_params)
    # byebug
    if @user.valid?
      @user.save!
      # byebug
      exp = Time.now.to_i+ (12*60*60)
      token = encode_token({user_id: @user.id, "exp": exp})
      render json: {user: @user, token: token}
    else
      render json: {errors: @user.errors}
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      render json: { user: @user, notice: "User was successfully updated." }
      
    else
      render json: {errors: @user.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    #TODO must be the same user
    @user.destroy
      render json: { notice: "User was successfully destroyed." }
  end


  # login
  def login
    puts "this is login"
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      exp = Time.now.to_i+ (12*60*60) #valid for 12 hours
      token = encode_token({user_id: @user.id, "exp": exp})
      render json: {user: @user, token: token}
    else
      render json: {error: "invalid username or password"}
    end
  end


  def auto_login
    render json: @user
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

    #check if it's the same user that is trying to update or delete himself or not
    def sameUser 
      puts "same user called"
      if decoded_token
        user_id = decoded_token[0]["user_id"]

        puts "user.id is: "+ user_id.to_s
        puts @user.id

        user_id ==@user.id
      end
    end

    def userAuthorized
      render json: {message: 'Not Authorized'}, status: :unauthorized unless sameUser
    end
end
