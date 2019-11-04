class Category < ApplicationRecord
    has_many :items_category, dependent: :destroy
    has_many :items, through: :items_category, dependent: :destroy
    validates :name, length: { in:2..20 }
    validates :name, uniqueness: true
end
