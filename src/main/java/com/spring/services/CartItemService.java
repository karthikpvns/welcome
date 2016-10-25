package com.spring.services;

import com.spring.model.Cart;
import com.spring.model.CartItem;

public interface CartItemService {

	void addcartItem(CartItem cartItem);

	void removeCartItem(int cartItemId);

	void removeAllCartItems(Cart cart);

}
