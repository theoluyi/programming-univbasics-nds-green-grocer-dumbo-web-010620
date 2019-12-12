#### 焦点 #### 
def consolidate_cart(cart)
  concart = []
  element_index = 0 
  
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

PSEUDO 
  pointer for item? 
  grocery = element_index[:item]
  grocery_tally = element_index[:count]
if element.index[:item] exists in concart
# if find_item_by_name_in_collection(grocery, cart)
  then grocery_tally += 1 
else grocery_tally = 1 
end 
  



 #consolidate_cart
[{:item=>"TEMPEH", :price=>3.0, :clearance=>true},
 {:item=>"PEANUTBUTTER", :price=>3.0, :clearance=>true},
 {:item=>"ALMONDS", :price=>9.0, :clearance=>false}]
    adds a count of one to each item when there are no duplicates (FAILED - 1)
[{:item=>"AVOCADO", :price=>3.0, :clearance=>true},
 {:item=>"AVOCADO", :price=>3.0, :clearance=>true},
 {:item=>"KALE", :price=>3.0, :clearance=>false}]
    increments count when there are multiple items (FAILED - 2)

# DRAFT 2, 太乱
def consolidate_cart(cart)
  concart = []
  element_index = 0 
  
  while element_index < cart.length do 
    grocery = cart[element_index]
    grocery_name = cart[element_index][:item]
    grocery_tally = cart[element_index][:count]
    if find_item_by_name_in_collection(grocery, cart)
      grocery_tally += 1
      concart.push(grocery)
    else grocery_tally = 1
      concart.push(grocery)
    end 
    element_index += 1 
  end 
  concart
end


