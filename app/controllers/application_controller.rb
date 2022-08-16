class ApplicationController < ActionController::API
    # protect_from_forgery unless: -> { request.format.json? }
    # before_action :authorized, only: [:login, :register]


    def encode_token(payload)
        JWT.encode(payload, ENV['SECRET'] )
    end

    def auth_header
        request.headers['Authorization']
    end

    #TODO: save tokens in memory, verify claims

    def decoded_token #return nil if decoding error
        if auth_header 
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, ENV['SECRET'], true, algorithm: 'HS256')
            
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def logged_in_user
        #returns nil if decoded_token
        if decoded_token
            user_id = decoded_token[0]["user_id"]
            @user = User.find_by(id: user_id)
        end
    end     

    def logged_in?
        !!logged_in_user
    end
    
    def authorized
        render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
    end
end
