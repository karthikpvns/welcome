package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.Cart;
import com.spring.model.Customer;
import com.spring.services.CartService;
import com.spring.services.CustomerServices;

@Controller
public class CartController {

	@Autowired
	private CustomerServices customerServices;
	
	@Autowired
	private CartService cartService;
	
	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public CustomerServices getCustomerServices() {
		return customerServices;
	}

	public void setCustomerServices(CustomerServices customerServices) {
		this.customerServices = customerServices;
	}

	@RequestMapping("/cart/getCartId")
	public String getCartId(Model model){
	User user=	(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String username=user.getUsername();
	Customer customer= customerServices.getCustomerByUsername(username);
	//Cart cart=customer.getCart();
	//int cartId=cart.getCartId();
	model.addAttribute("cartId", customer.getCart().getCartId());
		return "cart";
	}
	
	@RequestMapping("/cart/getCart/{cartId}")
	public @ResponseBody Cart getCart(@PathVariable(value="cartId") int cartId){
		System.out.println("entering in response body");
      	//Cart cart=cartService.getCartById(cartId);	
      	System.out.println("After Service");
		return cartService.getCartById(cartId);
	}
	
}
