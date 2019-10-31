class Item < ApplicationRecord
  has_one_attached :item_picture
  belongs_to :shop
  has_many :items_category, dependent: :destroy
  has_many :categories, through: :items_category, dependent: :destroy
  accepts_nested_attributes_for :categories
end
