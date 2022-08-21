require "rails_helper"

RSpec.describe "User", type: :request do
    describe "POST /users" do
        
        it "with valid data" do
            @user = User.new(:name=>"test_user1", :email=> "user1@test_users.com", :password => "12345mA$", :image=>"adsgasdg")
            expect(@user).to be
        end
        it "with not valid data" do 
            @user = UsersController.create(:name=>"test_user1", :email=> "user1test_users.com", :password => "12345mA$", :image=>"adsgasdg")
            puts "this is not valid user#{@user}"

            expect(@user).to be_nil
        end
    end
end
