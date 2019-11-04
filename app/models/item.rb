class Item < ApplicationRecord
  has_one_attached :item_picture
  belongs_to :shop
  has_many :items_category, dependent: :destroy
  has_many :categories, through: :items_category, dependent: :destroy
  accepts_nested_attributes_for :categories, allow_destroy: true
  validates :name, presence: true, length: { in: 3..20 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: true, presence: true
  validates :hook, length: { maximum: 45}

  # def category_invalid(attributes)

  #   if attributes[:name].chars.length < 3


  # end

end
