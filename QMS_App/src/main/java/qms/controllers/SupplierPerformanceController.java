	package qms.controllers;

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

	import qms.dao.SupplierPerformanceDAO;
	import qms.model.SupplierPerformance;
	import qms.forms.SupplierPerformanceForm;;

	@Controller
	@SessionAttributes({"supplier"})
	public class SupplierPerformanceController
	{
		@Autowired
		SupplierPerformanceDAO supplierPerformanceDAO;
		
		
		
		@RequestMapping(value={"/view_supplierperformance"}, method = RequestMethod.GET)
		public String show_supplierperformance(HttpSession session,HttpServletRequest request, ModelMap model, Principal principal )
		{
	    SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
	    supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
	    model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
	    model.addAttribute("menu","supplier");
		return "view_supplierperformance";
	 	}
		
		
		@RequestMapping(value={"/add_supplierperformance"}, method = RequestMethod.GET)
		public String add_supplierperformance(HttpSession session,ModelMap model, Principal principal )
		{
			session.removeAttribute("supplier");
			model.addAttribute("id", supplierPerformanceDAO.get_maxid());
			System.out.println("get method");
			 model.addAttribute("menu","supplier");
	     return "add_supplierperformance";
	    
	 	}
		

		@RequestMapping(value={"/add_supplierperformance"}, method = RequestMethod.POST)
		public String insert_supplierperformance(HttpSession session, @ModelAttribute("supplierperformance") @Valid SupplierPerformance supplierPerformance, BindingResult result, ModelMap model, Principal principal)

		{	
			
			System.out.println("came");
			session.setAttribute("supplier",supplierPerformance);
			if(result.hasErrors())
			{
				
				System.out.println("going to return");
				return "add_supplierperformance";
				
			}
			System.out.println("inserting....");
			supplierPerformanceDAO.insert_supplierperformance(supplierPerformance);
			System.out.println("inserted.........");
			model.put("supplier", supplierPerformance);
			model.addAttribute("supplierperformance",supplierPerformance);
			
			model.addAttribute("menu","supplier");
			return "view_supplierperformance";
	 	}
		
		
		@RequestMapping(value={"/updatesupplierperformance"}, method = RequestMethod.POST)
		public String update_supplierperformance(HttpSession session,@ModelAttribute("supplierperformance") @Valid SupplierPerformance supplierPerformance,BindingResult result,ModelMap model, Principal principal)
		{
			session.setAttribute("supplier",supplierPerformance);
			if(result.hasErrors())
			{
				return "edit_supplierperformance";
			}	
			supplierPerformanceDAO.update_supplierperformance(supplierPerformance);
			
					
			SupplierPerformanceForm supplierPerformanceForm = new SupplierPerformanceForm();
			model.addAttribute("supplierPerformanceForm", supplierPerformanceForm);
			model.addAttribute("success","true");
			model.addAttribute("menu","supplier");
			
			
			return "view_supplierperformance";
	 	}
		
		
		@RequestMapping(value={"/deletesupplierperformance"}, method = RequestMethod.GET)
		public String delete_supplierperformance(@RequestParam("sid") String supplier_id,ModelMap model, Principal principal )
		{
			
			supplierPerformanceDAO.delete_supplierperformance(supplier_id);
			SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
		    supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance());
		    model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);

		    model.addAttribute("menu","supplier");
			return "view_supplierperformance";
			
	 	}
		
		@RequestMapping(value={"/editsupplierperformance"}, method = RequestMethod.GET)
		public String edit_supplierperformance(@RequestParam("sid") String supplier_id,ModelMap model, Principal principal )
		{
	    
			model.addAttribute("id", supplierPerformanceDAO.get_maxid());
			SupplierPerformanceForm supplierPerformanceForm=new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getsupplierperformance_byid(supplier_id));
			model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
			model.addAttribute("menu","supplier");
			return "edit_supplierperformance";
	 	}
		
		@RequestMapping(value="/findsupplierperformance",method=RequestMethod.GET)		
		public String findsupplierperformance(HttpServletRequest request,HttpSession session,@RequestParam("supplier_name") String suppliername,@RequestParam("phone") String phone,@RequestParam("email_address") String email,ModelMap model)
		{
		
			System.out.println("find");
			session.setAttribute("suppliername", suppliername);
			session.setAttribute("phone", phone);
			session.setAttribute("email",email);

			if(suppliername=="" && phone=="" && email=="")
			{
				SupplierPerformanceForm supplierPerformanceForm = new SupplierPerformanceForm();
				supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getSupplierPerformances(suppliername, phone, email));

				model.addAttribute("supplierPerformanceForm",supplierPerformanceForm);
				model.addAttribute("menu", "supplierperformance");
				System.out.println("finding....");
				return "view_supplierperformance";
			}
			else
			{
				System.out.println("searching.......");
			SupplierPerformanceForm supplierPerformanceForm = new SupplierPerformanceForm();
			supplierPerformanceForm.setSupplierperformance(supplierPerformanceDAO.getSupplierPerformances(suppliername, phone, email));
	        model.addAttribute("supplierPerformanceForm", supplierPerformanceForm);
	        model.addAttribute("menu","supplierperformance");
	        System.out.println("finding result");
	        model.addAttribute("menu","supplier");
			return "view_supplierperformance";		
			}
			}
	}



