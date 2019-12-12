require "pry"

def find_item_by_name_in_collection(name, collection)
  item_index = 0
    
  while item_index < collection.length do 
    if collection[item_index][:item] == name 
      return collection[item_index]
    end 
    item_index += 1 
  end
  nil 
end

def consolidate_cart(cart)
  pp cart 
  cart 
 
  concart = []
  element_index = 0 
 
  
  #grocery_hash = cart[element_index]
  #item_in_concart = find_item_by_name_in_collection(grocery_hash[:item], concart)
 
  #puts item_in_concart
 
  puts 10101010101
  puts concart 
  puts 10101010101
  concart
end


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
