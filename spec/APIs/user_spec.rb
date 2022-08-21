require "rails_helper"

RSpec.describe "User", type: :request do
    describe "POST /register" do
        
        context "with valid data" do
            it "returns 200" do
                post "/register", :params => {:user => {:name => "test_user6", :email => "user6a@testusers.com", :password => "12345mA$", :image => "adsgasdg"}}
                expect(response).to have_http_status(201)
            end
        end
        context "with non valid data" do
            it "returns 403" do 
                post "/register", :params => {:user => {:name => "test_user5", :email => "user5atestusers.com", :password => "12345mA$", :image => "adsgasdg"}}
                expect(response).to have_http_status(403)
            end
        end
    end

    describe "POST /login"
        before do
            post "/users", :params => {:user => {:name => "test_user5", :email => "user5a@testusers.com", :password => "12345mA$", :image => "adsgasdg"}}
        end
        context "with valid data" do
            it "returns 200" do 
                post "/login", :params => {:email => "user5a@testusers.com", :password => "12345mA$"}
                expect(response).to have_http_status(200)
            end
        end
        context "with non valid data" do
            it "returns 401" do 
                post "/login", :params => {:email => "user5a@testusers.com", :password => "123w45mA$"}
                expect(response).to have_http_status(401)
            end
        end
    end
