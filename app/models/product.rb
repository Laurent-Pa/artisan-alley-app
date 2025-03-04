class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :adress, presence: true
end
