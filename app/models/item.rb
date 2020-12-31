class Item < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: {minimum: 10, maximum: 500 }
    validates :price, presence: true
    validates :image_url, presence: true
end
