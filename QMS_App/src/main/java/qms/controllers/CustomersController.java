package qms.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import qms.dao.CustomersDAO;
import qms.forms.ParticipantsDetailsForm;
import qms.model.Customers;
import qms.forms.CustomersForm;

@Controller
public class CustomersController
{
	@Autowired
	CustomersDAO customersDAO;
	
	@RequestMapping(value={"/viewcustomers"}, method = RequestMethod.GET)
	public String show_customers(ModelMap model, Principal principal )
	{
    CustomersForm customersForm=new CustomersForm();
    customersForm.setCustomers(customersDAO.getCustomers());
    model.addAttribute("customerForm",customersForm);
	return "view_customers";
 	}
	
	
	@RequestMapping(value={"/addcustomer"}, method = RequestMethod.GET)
	public String add_customer(ModelMap model, Principal principal )
	{
     model.addAttribute("id",customersDAO.getMax_customerID());		
	return "add_customers";
 	}
	

	@RequestMapping(value={"/addcustomer"}, method = RequestMethod.POST)
	public String insert_customer(ModelMap model, Principal principal,Customers customers)
	{
    // model.addAttribute("id",customersDAO.getMax_customerID());
    customersDAO.insert_customer(customers);
	return "add_customers";
 	}
	
	@RequestMapping(value={"/updatecustomer"}, method = RequestMethod.POST)
	public String update_customer(ModelMap model, Principal principal,Customers customers)
	{
    // model.addAttribute("id",customersDAO.getMax_customerID());
    customersDAO.update_customer(customers);
	return "add_customers";
 	}
	
	
	@RequestMapping(value={"/deletecustomer"}, method = RequestMethod.GET)
	public String delete_customer(@RequestParam("cid") String customer_id,ModelMap model, Principal principal )
	{
    
		customersDAO.delete_customer(customer_id);
		return "add_customers";
 	}
	
	@RequestMapping(value={"/editcustomer"}, method = RequestMethod.GET)
	public String edit_customer(@RequestParam("cid") String customer_id,ModelMap model, Principal principal )
	{
    
		CustomersForm customersForm=new CustomersForm();
		customersForm.setCustomers(customersDAO.getCustomers_byid(customer_id));
		model.addAttribute("customersForm",customersForm);
		return "edit_customers";
 	}
	
}