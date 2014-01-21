package qms.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import qms.dao.EmployeeDAO;
import qms.model.Employee;
import qms.forms.EmployeeForm;

@Controller
public class EmployeeController
{
	@Autowired
	EmployeeDAO employeeDAO;
	
	@RequestMapping(value={"/addemployee"},method=RequestMethod.GET)
	public String addEmployee(ModelMap model,Principal principal)
	{
		model.addAttribute("id",employeeDAO.getMax_employeeID());
		return "add_employee";
	}
	
	@RequestMapping(value={"/addemployee"},method=RequestMethod.POST)
	public String insertEmployee(ModelMap model,Principal principal,Employee employee)
	{
		employeeDAO.insert_employee(employee);
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
	public String update_customer(Employee employee,ModelMap model, Principal principal)
	{
    	employeeDAO.update_employee(employee);		
		return "edit_employee";
 	}

}