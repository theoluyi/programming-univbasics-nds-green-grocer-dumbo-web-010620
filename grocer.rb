def find_item_by_name_in_collection(name, collection)
  counter = 0
  while counter < collection.length do 
    if collection[counter][:item] == name 
      return collection[counter]
    end 
    counter += 1 
  end
end

# rspec spec/grocer_spec.rb:49
def consolidate_cart(cart)
  new_cart = [] 
  counter = 0
  while counter < cart.length
    if find_item_by_name_in_collection(cart[counter][:item], new_cart)  #item hash, item IS present
      find_item_by_name_in_collection(cart[counter][:item], new_cart)[:count] += 1
    end 
    if !find_item_by_name_in_collection(cart[counter][:item], new_cart) #nil, no item present
      cart[counter][:count] = 1
      new_cart.push(cart[counter])
    end
    counter += 1 
  end
  new_cart
end

# ends at 50:00, summary ends at 52:35 https://www.youtube.com/watch?v=JAOL4dbtfLQ&t=28s
def apply_coupons(cart, coupons)
  counter = 0
  while counter < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    # designed to deal with multiple coupons. Will help us increment item count if 
    # if couponed item is already in cart
    if cart_item && cart_item[:count] >= coupons[counter][:num] # returns cart item or nil
      if cart_item_with_coupon 
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else 
        cart_item_with_coupon = {
          item: couponed_item_name,
          price: coupons[counter][:cost] / coupons[counter][:num],
          count: coupons[counter][:num],
          clearance: cart_item[:clearance]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end 
    end 
    counter += 1
  end 
  cart 
end 
 
# rspec spec/grocer_spec.rb:196
def apply_clearance(cart)
  counter = 0 
  while counter < cart.length do
    if cart[counter][:clearance] == true 
      cart[counter][:price] = (cart[counter][:price] * 0.8).round(2)
    end 
    counter += 1 
  end 
  cart
end

# rspec spec/grocer_spec.rb:225
  #

def checkout(cart, coupons)
  grand_total = 0
  counter = 0 

  ccart = consolidate_cart(cart)
  apply_coupons(ccart, coupons)
  apply_clearance(ccart)

  while counter < ccart.length do
    grand_total += ccart[counter][:price]*ccart[counter][:count]
    counter += 1
  end 

   grand_total >= 100 ?  grand_total *= 0.9 : grand_total
end