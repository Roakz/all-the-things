module ApplicationHelper

    def cart_item_quant
        total = 0
        current_user.cart.cart_items.each do |cart_item|
            total += 1
        end
       
        return total
      
      end

end
