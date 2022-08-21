require "rails_helper"

RSpec.describe "Post", type: :request do
    before do
        post "/register", :params => {:user => {:name => "test_user5", :email => "user5a@testusers.com", :password => "12345mA$", :image => "adsgasdg"}}
        $id = JSON.parse(response.body)["user"]["id"]
        $token = JSON.parse(response.body)["token"]

        post '/tags',
        as: :json, headers: {:Authorization => "Bearer #{$token}"} ,
        :params => { :title => "arabic"}



    end
    describe "POST /posts" do
        context "with valid data" do
            it "returns 200" do
                puts "the id is: #{$id}"
                puts "Bearer #{$token}"
                post "/posts", 
                as: :json, headers: {:Authorization => "Bearer #{$token}"} ,
                :params => {  :post => {:title => "test_user6", :body => "user6a@testusers.com", :user_id => $id}, :tags => ["arabic", "useful"]  }
                expect(response).to have_http_status(201)
            end
        end
    end
end
