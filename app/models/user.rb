class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_profile, dependent: :destroy
  has_one :cart, dependent: :destroy
  before_create :build_user_profile
  before_create :build_cart
  has_one :shop, dependent: :destroy
end
