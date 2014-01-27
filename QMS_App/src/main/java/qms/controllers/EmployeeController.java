package qms.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import qms.dao.EmployeeDAO;
import qms.model.Employee;
import qms.model.Maintenance;
import qms.forms.CustomersForm;
import qms.forms.EmployeeForm;
import qms.forms.MaintenanceForm;

@Controller
@SessionAttributes({"employees"})
public class EmployeeController
{
	@Autowired
	EmployeeDAO employeeDAO;
	
	@RequestMapping(value={"/addemployee"},method=RequestMethod.GET)
	public String addEmployee(HttpSession session,ModelMap model,Principal principal)
	{
		model.addAttribute("id",employeeDAO.getMax_employeeID());
		session.removeAttribute("employees");
		return "add_employee";
	}
	
	@RequestMapping(value={"/addemployee"},method=RequestMethod.POST)
	public String insertEmployee(HttpSession session, @ModelAttribute("Employee") @Valid Employee employee,BindingResult result, ModelMap model)
	{

		session.setAttribute("employees",employee);
			if (result.hasErrors())
			{
				EmployeeForm employeeForm=new EmployeeForm();
				employeeForm.setEmployees(employeeDAO.getEmployees());
				model.addAttribute("employeeForm",employeeForm);
				model.addAttribute("Success","true");
				model.addAttribute("id",employeeDAO.getMax_employeeID());
		        return "add_employee";
			}
			
			
		employeeDAO.insert_employee(employee);
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm",employeeForm);
		return "add_employee";
	}
	
	@RequestMapping(value={"/viewemployees"},method=RequestMethod.GET)
	public String viewEmployees(ModelMap model,Principal principal,Employee employee)
	{
		EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm",employeeForm);
		return "view_employees";
	}
	
	@RequestMapping(value={"/deleteemployee"}, method = RequestMethod.GET)
	public String delete_customer(@RequestParam("empid") String employee_id,ModelMap model, Principal principal )
	{
    
		employeeDAO.delete_employee(employee_id);
		return "view_employees";
 	}
	
	@RequestMapping(value={"/editemployee"}, method = RequestMethod.GET)
	public String edit_customer(@RequestParam("empid") String employee_id,ModelMap model, Principal principal)//,Employee employee )
	{
    	EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployeess_byid(employee_id));
		model.addAttribute("employeeForm",employeeForm);
		return "edit_employee";
 	}
	
	
	@RequestMapping(value={"/updateemployee"}, method = RequestMethod.POST)
	public String update_customer(ModelMap model, @ModelAttribute("Employee") @Valid Employee employee, BindingResult result)
	{

		if (result.hasErrors())
		{
			System.out.println("output");
			EmployeeForm employeeForm=new EmployeeForm();
			employeeForm.setEmployees(employeeDAO.getEmployeess_byid(employee.getId()));
			model.addAttribute("employeeForm",employeeForm);
	        return "edit_employee";
		}
    	employeeDAO.update_employee(employee);
    	EmployeeForm employeeForm=new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm",employeeForm);
		return "view_employees";
 	}

}