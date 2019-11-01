class CartItem < ApplicationRecord
  belongs_to :cart

  def self.item_total(quantity, price)
    
    total = quantity * price
    p total 

end


end
