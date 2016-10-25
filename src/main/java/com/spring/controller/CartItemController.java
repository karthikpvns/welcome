package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.spring.model.Book;
import com.spring.model.Cart;
import com.spring.model.CartItem;
import com.spring.model.Customer;
import com.spring.services.BookService;
import com.spring.services.CartItemService;
import com.spring.services.CartService;
import com.spring.services.CustomerServices;

@Controller
public class CartItemController {

	@Autowired
	private CustomerServices customerServices;
	
	@Autowired
	private BookService bookService;

	@Autowired
		private CartItemService cartItemService;
	@Autowired
	private CartService cartService;

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public CartItemService getCartItemService() {
		return cartItemService;
	}

	public void setCartItemService(CartItemService cartItemService) {
		this.cartItemService = cartItemService;
	}

	public CustomerServices getCustomerServices() {
		return customerServices;
	}

	public void setCustomerServices(CustomerServices customerServices) {
		this.customerServices = customerServices;
	}

	public BookService getBookService() {
		return bookService;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	

	@RequestMapping("/cart/add/{isbn}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void addItem(@PathVariable(value="isbn")int isbn){
		
    User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    String username=user.getUsername();
    Customer customer=customerServices.getCustomerByUsername(username);
    System.out.println("Customer email is"+ customer.getCustomerEmail());
    Cart cart=customer.getCart();
    List<CartItem> cartItems=cart.getCartItem();
    Book book=bookService.getBookByIsbn(isbn);
    for(int i=0;i<cartItems.size();i++){
      CartItem cartItem=cartItems.get(i);
      if(cartItem.getBook().getIsbn()==book.getIsbn()){
    	
    	  cartItem.setQuantity(cartItem.getQuantity()+1);
    	  cartItem.setPrice((cartItem.getBook().getPrice())*(cartItem.getQuantity()));
    	  cartItemService.addcartItem(cartItem);
    	  return;
      }
    	
    }
    CartItem cartItem=new CartItem();
	cartItem.setQuantity(1);
	cartItem.setBook(book);
	cartItem.setPrice(book.getPrice()*1);
	cartItem.setCart(cart);
	cartItemService.addcartItem(cartItem);
	}
	
	@RequestMapping("/cart/removecartitem/{cartItemId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void removeCartItem(@PathVariable(value="cartItemId") int cartItemId){
		cartItemService.removeCartItem(cartItemId);
		
	}
	@RequestMapping("/cart/removeAllItems/{cartId}")
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void removeAllItems(@PathVariable(value="cartId") int cartId){
		Cart cart=cartService.getCartById(cartId);
		cartItemService.removeAllCartItems(cart);
	}
	
}
