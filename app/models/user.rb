class User < ActiveRecord::Base
   
  has_secure_password
  
  before_save { self.email = email.downcase }
  validates :email, presence: true, uniqueness: true, email: true #EmailValidator
  validates :password, length: { minimum: 8 }
  
end
