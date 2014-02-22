package qms.controllers;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import qms.dao.EmployeeDAO;
import qms.model.Employee;
import qms.forms.EmployeeForm;


import qms.dao.JobDAO;
@Controller
@SessionAttributes({"employees"})
public class EmployeeController
{
	@Autowired
	EmployeeDAO employeeDAO;
	
	@Autowired
	JobDAO jobDAO;
	
	//Getting unique id
	@RequestMapping(value={"/addemployee"},method=RequestMethod.GET)
	public String addEmployee(HttpSession session,ModelMap model,Principal principal)
	{
		model.addAttribute("id",employeeDAO.getMax_employeeID());
		model.addAttribute("job_id",jobDAO.get_maxid());
		session.removeAttribute("employees");
		model.addAttribute("menu","employee");
		return "add_employee";
	}
	
	//Insert operation
	@RequestMapping(value={"/addemployee"},method=RequestMethod.POST)
	public String insertEmployee(HttpSession session, @ModelAttribute("Employee") @Valid Employee employee,BindingResult result, ModelMap model)
	{

		session.setAttribute("employees",employee);
			if (result.hasErrors())
			{
				System.out.println("some error while inserting.....");
				EmployeeForm employeeForm=new EmployeeForm();
				employeeForm.setEmployees(employeeDAO.getEmployees());
				model.addAttribute("employeeForm",employeeForm);
				model.addAttribute("Success","true");
				model.addAttribute("id",employeeDAO.getMax_employeeID());
		        return "add_employee";
			}
			
			
		employeeDAO.insert_employee(employee);
		System.out.println("records to be inserted......");
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm",employeeForm);
		model.addAttribute("menu","employee");
		return "view_employees";
	
	}
	
	//view records
	@RequestMapping(value={"/viewemployees"},method=RequestMethod.GET)
	public String viewEmployees(ModelMap model,Principal principal,Employee employee)
	{
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm",employeeForm);
		model.addAttribute("menu","employee");
		return "view_employees";
	}
	
	//delete a record
	@RequestMapping(value={"/deleteemployee"}, method = RequestMethod.GET)
	public String delete_customer(@RequestParam("empid") String employee_id,ModelMap model, Principal principal )
	{
    
		employeeDAO.delete_employee(employee_id);
		EmployeeForm employeeForm = new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm", employeeForm);
		model.addAttribute("menu","employee");
		return "view_employees";
 	}
	
	//Edit a record
	@RequestMapping(value={"/editemployee"}, method = RequestMethod.GET)
	public String edit_customer(@RequestParam("empid") String employee_id,ModelMap model, Principal principal)//,Employee employee )
	{
    	EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployeess_byid(employee_id));
		model.addAttribute("employeeForm",employeeForm);
		model.addAttribute("menu","employee");
		return "edit_employee";
 	}
	
	//Update a record
	@RequestMapping(value={"/updateemployee"}, method = RequestMethod.POST)
	public String update_customer(ModelMap model, @ModelAttribute("Employee") @Valid Employee employee, BindingResult result)
	{

		if (result.hasErrors())
		{
			System.out.println("output");
			EmployeeForm employeeForm=new EmployeeForm();
			employeeForm.setEmployees(employeeDAO.getEmployeess_byid(employee.getEmployee_id()));
			model.addAttribute("employeeForm",employeeForm);
	        return "edit_employee";
		}
    	employeeDAO.update_employee(employee);
    	EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm",employeeForm);
		model.addAttribute("menu","employee");
		return "view_employees";
 	}

	//Search operation 
	@RequestMapping(value="/findemployee",method=RequestMethod.GET)		
	public String findemployee(HttpServletRequest request,HttpSession session,@RequestParam("trainer") String trainer,@RequestParam("type_of_training") String type,@RequestParam("qualified_by") String qualifiedby,ModelMap model)
	{
	
		System.out.println("find");
		session.setAttribute("trainer", trainer);
		session.setAttribute("type", type);
		session.setAttribute("qualifiedby",qualifiedby);

		if(type=="" && qualifiedby=="" && trainer=="")
		{
			EmployeeForm employeeForm = new EmployeeForm();
			employeeForm.setEmployees(employeeDAO.findEmployees(type, qualifiedby,trainer));

			model.addAttribute("employeeForm",employeeForm);
			model.addAttribute("menu", "employee");
			System.out.println("finding....");
			return "view_employees";
		}
		else
		{
			System.out.println("searching started.......");
		EmployeeForm employeeForm = new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.findEmployees(type, qualifiedby,trainer));
        model.addAttribute("employeeForm", employeeForm);
        model.addAttribute("menu","employee");
        System.out.println("finding result");
        model.addAttribute("menu","employees");
		return "view_employees";		
		}
		}

	
// Employee report list page	
	
	@RequestMapping(value = "list_employee", method = RequestMethod.GET)
	public String list_employee(@RequestParam("id") String employee_id,
			ModelMap model, Principal principal) 
	{
		EmployeeForm employeeForm = new EmployeeForm();

		employeeForm.setEmployees(employeeDAO.edit_employee(employee_id));
System.out.println("edit:"+employee_id);
		model.addAttribute("employeeForm",employeeForm);
		model.addAttribute("menu","employees");
		return "list_employee";
	}

	//report page request passing	
	@RequestMapping(value = "/employee_report", method = RequestMethod.GET)
	public String reportEmployee(ModelMap model) {
		  model.addAttribute("menu","employees");
		  System.out.println("get method....");
		return "report_employee";

	}
	
	//This is used for downloading Excel Sheet
	@RequestMapping(value ={ "/employeereport" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view() {
	java.util.List<Employee> employees = new ArrayList<Employee>();
	
	employees = employeeDAO.getEmployees();
	System.out.println("model and view method....");
	return new ModelAndView("employeeDAO","employees",employees);
	
	}
	
	//report generation
	@RequestMapping(value = "/generate_employee_report", method = RequestMethod.POST)
	public ModelAndView generateEmployee_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response) {
		System.out.println("report generating....");
		String[] fields={"employee_id","name","job_title","date_hired","attachments","list_of_functions_needes","documented_in","qualified_by","type_of_training","trainer","training_due_date","training_completion_date","training_effectiveness_review_due_date","training_effectiveness_notes"};
		
		System.out.println(request.getParameter("type_of_report"));
		java.util.List<Employee> employees=new ArrayList<Employee>();
		
			switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  employees=employeeDAO.getEmployee_bytype("trainingneeds");
			  break;
		 /* case 1:
			  employees=employeeDAO.getEmployee_bytype("training_report_for_each_employee");
			  break;
		  case 2:
			  employees=employeeDAO.getEmployee_bytype("qualification_for_each_employee");
			  break;
		*/  case 1:
			  employees=employeeDAO.getEmployee_bytype("opentraining");
			  break;
		  /*case 4:
			  employees=employeeDAO.getEmployee_bytype("opentrainingeffectiveness");
			  break;
		  case 5:
			  employees=employeeDAO.getEmployee_bytype("past_due_training_by_trainer");
			  break;*/
		  default:
			  break;
				  
		}		
		
		
		
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok::::");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("name")+"'");
					
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			 response.setHeader("Content-Disposition","attachment;filename='Employee_Report'");
		
		
		ModelAndView modelAndView=new ModelAndView("employeeDAO","employees",employees);
		
		modelAndView.addObject("fields",fields);
		System.out.println("ok:::::");
	
		return modelAndView ;
	}

	

}