class Review < ApplicationRecord
    
    #create one to many relationship with users (it belongs to users)
    belongs_to :user
    
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: {minimum: 10, maximum: 500 }
    
end
