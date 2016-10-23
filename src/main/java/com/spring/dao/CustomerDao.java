package com.spring.dao;

import java.util.List;

import com.spring.model.Customer;

public interface CustomerDao {

	 void addCustomer(Customer customer);
	List<Customer> getCustomers();
    Customer getCustomerByUsername(String username);
}
