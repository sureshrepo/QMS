package qms.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import qms.dao.CustomersDAO;
import qms.forms.MaintenanceForm;
import qms.forms.ParticipantsDetailsForm;
import qms.model.Customers;
import qms.model.Maintenance;
import qms.forms.CustomersForm;

@Controller
@SessionAttributes({"customer"})
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
    model.addAttribute("menu","customer");
	return "view_customers";
 	}
	
	
	@RequestMapping(value={"/addcustomer"}, method = RequestMethod.GET)
	public String add_customer(HttpSession session,ModelMap model, Principal principal )
	{
     model.addAttribute("id",customersDAO.getMax_customerID());	
     session.removeAttribute("customer");
     model.addAttribute("menu","customer");
	return "add_customers";
 	}
	

	@RequestMapping(value={"/addcustomer"}, method = RequestMethod.POST)
	public String insert_customer(HttpSession session,@ModelAttribute("Customers") @Valid Customers customers,BindingResult result,ModelMap model)
	{
		session.setAttribute("customer",customers);
			if (result.hasErrors())
			{
				CustomersForm customersForm=new CustomersForm();
				customersForm.setCustomers(customersDAO.getCustomers());
				model.addAttribute("customersForm",customersForm);
				model.addAttribute("Success","true");
				model.addAttribute("id",customersDAO.getMax_customerID());	
		        return "view_customers";
			}
    // model.addAttribute("id",customersDAO.getMax_customerID());
    customersDAO.insert_customer(customers);
    CustomersForm customersForm=new CustomersForm();
	customersForm.setCustomers(customersDAO.getCustomers());
	model.addAttribute("customersForm",customersForm);
	model.addAttribute("menu","customer");
	return "edit_customers";
 	}
	
	@RequestMapping(value={"/updatecustomer"}, method = RequestMethod.POST)

	public String update_customer(ModelMap model,@ModelAttribute("Customers") @Valid Customers customers,BindingResult result) throws IOException{

		if (result.hasErrors())
		{
			
			System.out.println("output");
			CustomersForm customersForm=new CustomersForm();
			customersForm.setCustomers(customersDAO.getCustomers_byid(customers.getCustomer_id()));
			model.addAttribute("customersForm",customersForm);	
	        return "edit_customers";
		}

    // model.addAttribute("id",customersDAO.getMax_customerID());
    customersDAO.update_customer(customers);

    CustomersForm customersForm=new CustomersForm();
    customersForm.setCustomers(customersDAO.getCustomers());
    model.addAttribute("customerForm",customersForm);
    model.addAttribute("menu","customer");
	return "view_customers";

	

 	}
	
	
	@RequestMapping(value={"/deletecustomer"}, method = RequestMethod.GET)
	public String delete_customer(@RequestParam("cid") String customer_id,ModelMap model, Principal principal )
	{
    
		customersDAO.delete_customer(customer_id);
		model.addAttribute("menu","customer");
		return "add_customers";
 	}
	
	@RequestMapping(value={"/editcustomer"}, method = RequestMethod.GET)
	public String edit_customer(@RequestParam("cid") String customer_id,ModelMap model, Principal principal )
	{
    
		CustomersForm customersForm=new CustomersForm();
		customersForm.setCustomers(customersDAO.getCustomers_byid(customer_id));
		model.addAttribute("customersForm",customersForm);
		model.addAttribute("menu","customer");
		return "edit_customers";
 	}
	
}