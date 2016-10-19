package com.spring.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.BillingAddress;
import com.spring.model.Customer;
import com.spring.model.ShippingAddress;
import com.spring.model.Users;
import com.spring.services.CustomerServices;

@Controller
public class RegisterController {

	@Autowired
	private CustomerServices customerServices;

	public CustomerServices getCustomerServices() {
		return customerServices;
	}

	public void setCustomerServices(CustomerServices customerServices) {
		this.customerServices = customerServices;
	}
	
	
	@RequestMapping(value="/customer/registration",method=RequestMethod.GET)
	public ModelAndView getRegistrationForm(){
		Customer customer=new Customer();
		Users users=new Users();
		BillingAddress billingAddress=new BillingAddress();
		ShippingAddress shippingAddress=new ShippingAddress();
		customer.setUsers(users);
		customer.setBillingAddress(billingAddress);
		customer.setShippingAddress(shippingAddress);
		return new ModelAndView("registerCustomer","customer",customer);
		
		
	}
	
	@RequestMapping(value="/customer/registration" ,method=RequestMethod.POST)
	public String registerCustomer( @Valid @ModelAttribute(value="customer") Customer customer,BindingResult result,Model model ){
		
		if(result.hasErrors()){
			return "registerCustomer";
		}
		String username=customer.getUsers().getUsername();
		String email=customer.getCustomerEmail();
		
		List<Customer> clist=customerServices.getCustomers();
		
		for(Customer c:clist){
			if(c.getUsers().getUsername().equals(username)){
				model.addAttribute("duplicatename", "Name already exists...");
				return "registerCustomer";
			}
			if(c.getCustomerEmail().equals(email)){
				model.addAttribute("duplicateemail", "Email already exists...");
				return "registerCustomer";
			}
		}
		
		customerServices.addCustomer(customer);
		//model.addAttribute("registrationSuccess", "You Have Registrated Successfully... To Continue Use Your Credentials");
		return "redirect:/login?registrationSuccess";
	}
	
	
	
	
	
}
