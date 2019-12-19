
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
  # VERSION 1
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
  
  
  
# VERSION 2 

def consolidate_cart(cart)

concart = []
element_index = 0

while element_index < cart.length do
grocery_hash = cart[element_index] # √ (90% certain) # grocery_hash[:item] => returns an item name, eg Tempeh Avocado Cheese
item_in_concart = find_item_by_name_in_collection(grocery_hash[:item], concart) # item_in_concart seems to be working, issue is what to do with return value
  # returns item HASH if present or nil if absent
  
  if item_in_concart
    concart.push(grocery_hash)
    concart[grocery_hash][:count] += 1 # implemented below change for consistency
  else concart.push(grocery_hash)
    concart[grocery_hash][:count] = 1 # [item_in_cart] ∆ [grocery_hash] bc former should be nil in this case
      # line 29 is wrong. 
  end 
    element_index += 1 
end
  puts concart
  puts 1234567
  concart
end 
  
  
  
# V3
# rspec spec/grocer_spec.rb:77
def apply_coupons(cart, coupons)
  coupon_cart = []
  pos = 0 # position

  while pos < cart.length do
    cart_hash = cart[pos]
    matching_coupon_hash = find_item_by_name_in_collection(cart[pos][:item], coupons)

    if coupons.length == 0 
      return cart 
    end
    
    # if !matching_coupon_hash
    #   coupon_cart.push(cart[pos][:item]) 
    # don't need this because changing to use old cart, getting rid of coupon cart
    # end

    if matching_coupon_hash && cart_hash[:count] >= matching_coupon_hash[:num]
      new_hash = cart_hash # let's say this is the one that has coupons applied
      new_hash[:item] = new_hash[:item] + ' W/COUPON'
      new_hash[:price] = (matching_coupon_hash[:cost]/cart_hash[:count]).floor # seems to be rounding down effectively

      
      new_hash[:count] = (cart_hash[:count]/matching_coupon_hash[:num]).floor # this one is broken and needs fixing 
      # why is key item instead of count? cart_hash[:item]
      # Failing this test:       removes the number of discounted items from the original item's count (FAILED - 2)
      # fixing this will solve the latter half of this method
      
      # adjustments go here:  
      
      # Then we adjust that item hash's count to be the result of
      # item :count % coupon :num
      # Then we use that item hash's features to push a new hash to that array
      # Then we adjust that new hash's features
      # we concatenate 'W/COUPON' onto the :item key
      # we make the :count equal item :count / coupon :num rounded down
      # we make the :price equal coupons :cost / items :count
      coupon_cart.push(new_hash)
    end 
    pos += 1 
  end


  # V4

  def apply_coupons(cart, coupons)
    coupon_cart = []
    pos = 0 # position
  
    while pos < cart.length do
      cart_hash = cart[pos]
      matching_coupon_hash = find_item_by_name_in_collection(cart[pos][:item], coupons)
  
      if coupons.length == 0 
        return cart 
      end
      
      # if !matching_coupon_hash
      #   coupon_cart.push(cart[pos][:item]) 
      # don't need this because changing to use old cart, getting rid of coupon cart
      # end
  
      if matching_coupon_hash && cart_hash[:count] >= matching_coupon_hash[:num] 
        #if matching coupon exists AND the we have sufficient number of items in cart to apply coupon
        if cart_hash[:count] == matching_coupon_hash[:num]
          cart_hash[:item] = cart_hash[:item] + ' W/COUPON'
          cart_hash[:price] = (matching_coupon_hash[:cost]/cart_hash[:count]).round(2) # UPDATED, SEE RESULTS!
          # cart_hash[:count] = (cart_hash[:count]/matching_coupon_hash[:num]).floor # this line should be unneccessary
          ## matching_coupon_hash.delete how do I delete that hash? 
        end 
  
        ## cart_hash[:item] = new_hash[:item] + ' W/COUPON'
        ## new_hash[:price] = (matching_coupon_hash[:cost]/cart_hash[:count]).floor # seems to be rounding down effectively
  
  
        ### new_hash[:count] = (cart_hash[:count]/matching_coupon_hash[:num]).floor # this one is broken and needs fixing 
        # why is key item instead of count? cart_hash[:item]
        # Failing this test:       removes the number of discounted items from the original item's count (FAILED - 2)
        # fixing this will solve the latter half of this method
        
        # adjustments go here:  
        
        # Then we adjust that item hash's count to be the result of
        # item :count % coupon :num
        # Then we use that item hash's features to push a new hash to that array
        # Then we adjust that new hash's features
        # we concatenate 'W/COUPON' onto the :item key
        # we make the :count equal item :count / coupon :num rounded down
        # we make the :price equal coupons :cost / items :count
        ## coupon_cart.push(new_hash)
      end 
      pos += 1 
    end
  
    puts 'coupon_cart'
    pp coupon_cart # => [{:item=>"CHEESE", :price=>6.5, :clearance=>false, :count=>4},{:item=>"AVOCADO", :price=>3.0, :clearance=>true, :count=>3}]
    
    puts 'coupons'
    pp coupons # => [{:item=>"AVOCADO", :num=>2, :cost=>5.0},{:item=>"CHEESE", :num=>3, :cost=>15.0}]
  
    puts 'cart'
    pp cart
    
    coupon_cart
  end 
    
    # POINTERS # pp cart[pos][:count] # pp coupons[0][:cost] √ 
  
    
    # we receive the cart and coupons, which are both AoH format
    # this is a bit complicated, so let's create coupon_cart # actually no for now
    # first we want to check each item in the cart
    # then we want to compare that item to every coupon and see if they match
    # NEW: if no cart + coupon match, just add item to cart √ 
  
    # if the item's [:item] key matches the coupon's [:item] key
    # && the item's [:count] key >= the coupon's [:num]
    
    # THEN we add the item hash to coupon_cart XXXX
    # PREVIOUS STEP IS WRONG AND THUS SKIPPED FOR NOW. ONCE WE PUSH TO COUPON_CART WE SHOULD BE DONE. ADJUSTMENTS MUST BE MADE BEFORE PUSHING. 
  
    # Then we adjust that item hash's count to be the result of
    # item :count % coupon :num
    # Then we use that item hash's features to push a new hash to that array
    # Then we adjust that new hash's features
    # we concatenate 'W/COUPON' onto the :item key
    # we make the :count equal item :count / coupon :num rounded down
    # we make the :price equal coupons :cost / items :count
    
    # if the item doesn't match any coupon we simply add it to the coupon_cart 
    # and move on
  
  
  
    # CODE: if cart[i][:count] % coupons[:num]
    #         new_cart.push({cart[i][:item]+ 'W/COUPON', cart[i][:price].... UNFINISHED, jumped back to pseudo})
    #         cart[i][:count] = cart[i][:count] % coupons[:num]
    #         changing the
    #       end 
    # and set 
  
    # Consult README for inputs and outputs
    # REMEMBER: This method **should** update cart