class Shop < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :shop_image
  validates :name, presence: true, length: { in: 3..20 }
  validates :hook, presence: true, length: { in: 3..45 }

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
