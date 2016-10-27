package com.spring.dao;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.model.Cart;
import com.spring.services.CustomerOrderService;

@Repository
@Qualifier("cartDaoImpl")
@Transactional
public class CartDaoImpl implements CartDao {

	public CustomerOrderService getCustomerOrderService() {
		return customerOrderService;
	}

	public void setCustomerOrderService(CustomerOrderService customerOrderService) {
		this.customerOrderService = customerOrderService;
	}

	@Autowired
	private CustomerOrderService customerOrderService;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Cart getCartById(int cartId) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Cart cart=(Cart) session.get(Cart.class, cartId);
		session.close();
		return cart;
	}

	public Cart validate(int cartId) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("inside validate..."+cartId);
		Cart cart=getCartById(cartId);
		System.out.println("after cart object");
		if(cart==null||cart.getCartItem().size()==0){
			throw new IOException(cartId + "");
		}
		update(cart);
		
		return cart;
	}

	public void update(Cart cart) {
		// TODO Auto-generated method stub
		int cartId=cart.getCartId();
		double grandTotal=customerOrderService.getCustomerOrderGrandTotal(cartId);
		cart.setTotalPrice(grandTotal);
		Session session=sessionFactory.openSession();
		session.saveOrUpdate(cart);
		session.flush();
		session.close();
	}

}
