class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true

  validates :price, presence: true
  validates :adress, presence: true
end
