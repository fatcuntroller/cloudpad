class Identity < OmniAuth::Identity::Models::ActiveRecord

  # Friendly reminder that password digest doesn't need has_secure_password anymore
  before_save { self.email = email.downcase }
  validates :email, presence: true, uniqueness: true, email: true #EmailValidator
  validates :password, length: { minimum: 8 }
  validates :name, length: { minimum: 4, maximum: 20 }, format: { with: /\A[a-zA-Z0-9_]+\z/,
    message: "only allows alphanumeric characters" }
end
