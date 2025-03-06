class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo
  geocoded_by :adress
  after_validation :geocode, if: :will_save_change_to_adress?
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :adress, presence: true
end
