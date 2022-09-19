class Product < ApplicationRecord
  validates :name, presence: true
  validates :quanity, presence: true
  belongs_to :user
end
