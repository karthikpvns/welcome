package com.spring.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.CartItemDao;
import com.spring.model.Cart;
import com.spring.model.CartItem;

@Service
public class CartItemServiceImpl implements CartItemService {
	
	@Autowired
	private CartItemDao cartItemDao;

	public CartItemDao getCartItemDao() {
		return cartItemDao;
	}

	public void setCartItemDao(CartItemDao cartItemDao) {
		this.cartItemDao = cartItemDao;
	}

	@Transactional
	public void addcartItem(CartItem cartItem) {
		// TODO Auto-generated method stub
		cartItemDao.addcartItem(cartItem);

	}

	@Transactional
	public void removeCartItem(int cartItemId) {
		// TODO Auto-generated method stub
		
		cartItemDao.removeCartItem(cartItemId);
	}

	@Transactional
	public void removeAllCartItems(Cart cart) {
		// TODO Auto-generated method stub
		
		cartItemDao.removeAllCartItems(cart);
	}

	
}
