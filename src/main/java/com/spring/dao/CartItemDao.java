package com.spring.dao;

import com.spring.model.Cart;
import com.spring.model.CartItem;

public interface CartItemDao {

	void addcartItem(CartItem cartItem);

	void removeCartItem(int cartItemId);

	void removeAllCartItems(Cart cart);

}
