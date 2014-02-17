class Note < ActiveRecord::Base
  
  belongs_to :user
  validates :name, length: {minimum: 1, maximum: 100}
  validates :content, presence: true

end
