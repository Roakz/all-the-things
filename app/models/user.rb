class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :assign_default_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_profile, dependent: :destroy
  has_one :cart, dependent: :destroy
  before_create :build_user_profile
  before_create :build_cart
  has_one :shop, dependent: :destroy

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def self.admin_check(current_user)
  return current_user.has_role?(:admin)
  end


end
