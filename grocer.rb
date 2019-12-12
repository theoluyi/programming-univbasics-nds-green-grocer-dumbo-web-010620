
def find_item_by_name_in_collection(name, collection) 
  # Implement me first!
  item_index = 0
  
  while item_index < collection.length do 
    if collection[item_index][:item] == name 
      return collection[item_index]
    end 
    item_index += 1 
  end
  nil 
end 
# this returns the item hash, NOT the index. It returns a whole HASH 
  


#### 焦点 ####
# current problems: 
# 1: not pushing to concart 
# 2: grocery poorly named, should be grocery_name
# 3: pushing the wrong thing to concart 
# 4: tally should be located in concart


# # rspec spec/grocer_spec.rb:49 

def consolidate_cart(cart)
  concart = []
  element_index = 0 
  
  grocery_hash = cart[element_index]
  item_in_concart = find_item_by_name_in_collection(grocery_hash[:item], concart)
  puts grocery_hash
  puts item_in_concart
  
  # while element_index < cart.length do
  #   grocery_hash = cart[element_index]
  #   item_in_concart = find_item_by_name_in_collection(grocery_hash[:item], concart)
  #   # returns item index if present or nil if absent
    
  #   if item_in_concart
  #   concart.push(grocery_hash)
  #   concart[item_in_concart][:count] += 1 
  #   else concart.push(grocery_hash)
  #   concart[item_in_concart][:count] = 1 
  #   end 
  #   element_index += 1 
  # end 

  puts concart
  puts concart
  puts concart
  concart
end

#        no implicit conversion of Symbol into Integer



# PSEUDO 
#   pointer for item? 
#   grocery = element_index[:item]
#   grocery_tally = element_index[:count]
# if element.index[:item] exists in concart
# # if find_item_by_name_in_collection(grocery, cart)
#   then grocery_tally += 1 
# else grocery_tally = 1 
# end 
  



# #consolidate_cart
# [{:item=>"TEMPEH", :price=>3.0, :clearance=>true},
# {:item=>"PEANUTBUTTER", :price=>3.0, :clearance=>true},
# {:item=>"ALMONDS", :price=>9.0, :clearance=>false}]
#     adds a count of one to each item when there are no duplicates (FAILED - 1)
# [{:item=>"AVOCADO", :price=>3.0, :clearance=>true},
# {:item=>"AVOCADO", :price=>3.0, :clearance=>true},
# {:item=>"KALE", :price=>3.0, :clearance=>false}]
#     increments count when there are multiple items (FAILED - 2)










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
  # some irritated customers)
end
