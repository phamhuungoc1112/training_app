class Product < ApplicationRecord
    validates :name, presence: true
    validates :quanity, presence: true
    
end
