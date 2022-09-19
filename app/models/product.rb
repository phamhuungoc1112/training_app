class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :quanity, presence: true
end
