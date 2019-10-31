class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def cart_total(user_id)
    @item_total = 0
    @user = User.find(user_id) 
    @user.cart.cart_items.each do |cart_item|
    @item_total += CartItem.item_total((cart_item.quantity).to_d, (cart_item.price).to_d)
    end
    p sprintf('%.2f', @item_total)
   end

end
