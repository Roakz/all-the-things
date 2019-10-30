class Shop < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :shop_image

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
