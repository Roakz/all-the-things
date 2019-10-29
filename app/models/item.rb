class Item < ApplicationRecord
  has_one_attached :item_picture
  belongs_to :shop
  has_many :items_category
  has_many :categories, through: :items_category
end
