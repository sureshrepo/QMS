package qms.controllers;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
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
import qms.model.Customers;
import qms.forms.CustomersForm;

@Controller
@SessionAttributes({"customer"})
public class CustomersController
{
	@Autowired
	CustomersDAO customersDAO;
	
	
	//view records
	@RequestMapping(value={"/viewcustomers"}, method = RequestMethod.GET)
	public String show_customers(ModelMap model, Principal principal )
	{
    CustomersForm customersForm=new CustomersForm();
    customersForm.setCustomers(customersDAO.getCustomers());
    model.addAttribute("customerForm",customersForm);
    model.addAttribute("menu","customer");
	return "view_customers";
 	}
	
	//getting unique id
	@RequestMapping(value={"/addcustomer"}, method = RequestMethod.GET)
	public String add_customer(HttpSession session,ModelMap model, Principal principal )
	{
     model.addAttribute("id",customersDAO.getMax_customerID());	
     session.removeAttribute("customer");
     model.addAttribute("menu","customer");
	return "add_customers";
 	}
	

	//insert a record
	@RequestMapping(value={"/addcustomer"}, method = RequestMethod.POST)
	public String insert_customer(HttpSession session,@ModelAttribute("Customers") @Valid Customers customers,BindingResult result,ModelMap model)
	{
		session.setAttribute("customer",customers);
			if (result.hasErrors())
			{
			/*	CustomersForm customersForm=new CustomersForm();
				customersForm.setCustomers(customersDAO.getCustomers());
				model.addAttribute("customersForm",customersForm);
				model.addAttribute("Success","true");
			*/	model.addAttribute("id",customersDAO.getMax_customerID());	
		        return "add_customers";
			}
    // model.addAttribute("id",customersDAO.getMax_customerID());
    customersDAO.insert_customer(customers);
    CustomersForm customersForm=new CustomersForm();
	customersForm.setCustomers(customersDAO.getCustomers());
	model.addAttribute("customersForm",customersForm);
	model.addAttribute("id", customersDAO.getMax_customerID());
	model.addAttribute("menu","customer");
	return "view_customers";
 	}
	
	//Update a record
	@RequestMapping(value={"/updatecustomer"}, method = RequestMethod.POST)

	public String update_customer(ModelMap model,@ModelAttribute("Customers") @Valid Customers customers,BindingResult result) throws IOException{

		if (result.hasErrors())
		{
			
			System.out.println("output");
			CustomersForm customersForm=new CustomersForm();
			//customersForm.setCustomers(customersDAO.getCustomers_byid(customers.getCustomer_id()));
			customersForm.setCustomers(customersDAO.getCustomers());
			model.addAttribute("customersForm",customersForm);	
	        return "edit_customers";
		}

    // model.addAttribute("id",customersDAO.getMax_customerID());
    customersDAO.update_customer(customers);

    CustomersForm customersForm=new CustomersForm();
    customersForm.setCustomers(customersDAO.getCustomers());
    model.addAttribute("customerForm",customersForm);
    model.addAttribute("success","true");
    model.addAttribute("menu","customer");
	return "view_customers";

	

 	}
	
	//delete a record
	@RequestMapping(value={"/deletecustomer"}, method = RequestMethod.GET)
	public String delete_customer(@RequestParam("cid") String customer_id,ModelMap model, Principal principal )
	{
    
		customersDAO.delete_customer(customer_id);
		CustomersForm customersForm = new CustomersForm();
	    customersForm.setCustomers(customersDAO.getCustomers());
	    model.addAttribute("customersForm",customersForm);
		model.addAttribute("menu","customer");
		return "view_customers";
 	}
	
	//edit a record
	@RequestMapping(value={"/editcustomer"}, method = RequestMethod.GET)
	public String edit_customer(@RequestParam("cid") String customer_id,ModelMap model, Principal principal )
	{
    
		CustomersForm customersForm=new CustomersForm();
		customersForm.setCustomers(customersDAO.getCustomers_byid(customer_id));
		model.addAttribute("customersForm",customersForm);
		model.addAttribute("menu","customer");
		return "edit_customers";
 	}
	
	//search a record
	@RequestMapping(value="/findcustomer",method=RequestMethod.GET)		
	public String findcustomer(HttpServletRequest request,HttpSession session,@RequestParam("customer_id") String id,@RequestParam("customer_name") String name,@RequestParam("address") String address,ModelMap model)
	{
	
		System.out.println("find");
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("address",address);

		if(id=="" && name=="" && address=="")
		{
			CustomersForm customersForm = new CustomersForm();
			customersForm.setCustomers(customersDAO.getfindcustomer(id, name, address));
			model.addAttribute("customersForm",customersForm);
			model.addAttribute("menu", "customer");
			System.out.println("finding....");
			return "view_customers";
		}
		else
		{
			System.out.println("searching.......");
		CustomersForm customersForm = new CustomersForm();
		customersForm.setCustomers(customersDAO.getfindcustomer(id, name, address));
        model.addAttribute("customersForm", customersForm);
        model.addAttribute("menu","customer");
        System.out.println("finding result");
        model.addAttribute("menu","customer");
		return "view_customers";		
		}
		}
	
	
	// Customer list page	
		
		@RequestMapping(value = "list_customer", method = RequestMethod.GET)
		public String list_customer(@RequestParam("id") String customer_id,
				ModelMap model, Principal principal) 
		{
			CustomersForm customersForm = new CustomersForm();

			customersForm.setCustomers(customersDAO.listCustomers(customer_id));
			System.out.println("list id::"+customer_id);
			model.addAttribute("customersForm", customersForm);
			model.addAttribute("menu","customer");
			return "list_customer";
		}

	
}