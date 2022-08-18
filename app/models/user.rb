class User < ApplicationRecord
   has_secure_password

    #validation
    validates :name, presence: true , uniqueness: true
    validates :password, presence: true , length: {in: 8..30}, format: {with: /(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]/ } 
    
    #validate email format with regex expression
    validates :email, presence: true, uniqueness: true ,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}
    
    
end
