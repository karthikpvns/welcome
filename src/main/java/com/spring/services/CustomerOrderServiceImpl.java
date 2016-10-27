package com.spring.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.CustomerOrderDao;
import com.spring.model.Cart;
import com.spring.model.CartItem;
import com.spring.model.CustomerOrder;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {

	@Autowired
	private CustomerOrderDao customerOrderDao; 
	
	@Autowired
    private CartService cartService;
	
	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public CustomerOrderDao getCustomerOrderDao() {
		return customerOrderDao;
	}

	public void setCustomerOrderDao(CustomerOrderDao customerOrderDao) {
		this.customerOrderDao = customerOrderDao;
	}

	
	public void addCustomerOrder(CustomerOrder customerOrder) {
		// TODO Auto-generated method stub
	customerOrderDao.addCustomerOrder(customerOrder);	

	}

	public double getCustomerOrderGrandTotal(int cartId) {
		// TODO Auto-generated method stub
		double grandTotal=0;
		Cart cart=cartService.getCartById(cartId);
		List<CartItem>cartItems=cart.getCartItem();
		for(CartItem item:cartItems){
		grandTotal+=item.getPrice();
		}
		return grandTotal;
	}

}
