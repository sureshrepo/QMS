package qms.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.http.HttpRequest;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import qms.dao.MaintenanceDAO;
import qms.dao.NonConformanceDAO;
import qms.forms.MaintenanceForm;
import qms.forms.NonConformanceForm;
import qms.model.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Controller
@SessionAttributes({"maintenances"})
public class MaintenanceController {
	@Autowired
	MaintenanceDAO maintenanceDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = { "/add_maintenance" }, method = RequestMethod.GET)
	
	public String addMaintenance(HttpSession session,ModelMap model, Principal principal) {
		session.removeAttribute("maintenances");
		return "add_maintenance";
	}
	
	@RequestMapping(value = "/add_maintenance", method = RequestMethod.POST)
	public String postMaintenance(HttpSession session,@ModelAttribute("Maintenance") @Valid Maintenance maintenance,BindingResult result, ModelMap model) {

		session.setAttribute("maintenances",maintenance);
			if (result.hasErrors())
			{
				MaintenanceForm maintenanceForm= new MaintenanceForm();
				maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
				model.addAttribute("maintenanceForm",maintenanceForm);
				model.addAttribute("Success","true");
		        return "add_maintenance";
			}
		
		maintenanceDAO.insert_maintenance(maintenance);
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);
		return "maintenance_list";
	}
	
	@RequestMapping(value="/maintenance_list", method=RequestMethod.GET)
	public String maintenancelist(HttpServletRequest request,ModelMap model, Principal principal) {
		 
		model.addAttribute("success","false");
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);
		return "maintenance_list";
	}
	
	@RequestMapping(value="/view_maintenance", method=RequestMethod.GET)
	public String viewmaintenance(HttpServletRequest request,@RequestParam("auto_equip") String auto_equip,ModelMap model,Maintenance maintenance)
	{
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(auto_equip));
		model.addAttribute("maintenanceForm",maintenanceForm);
		return "view_maintenance";
	}
	
	@RequestMapping(value = "/edit_maintenance", method = RequestMethod.GET)
	public String editmaintenance_get(@RequestParam("auto_equip") String auto_equip,Maintenance maintenance,ModelMap model) {

		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance(auto_equip));
		model.addAttribute("maintenanceForm",maintenanceForm);
	    return "edit_maintenance";
	}
	
	
	@RequestMapping(value = "/update_maintenance", method = RequestMethod.POST)
	public String update_maintenance(Maintenance maintenance,ModelMap model) {

	    maintenanceDAO.update_maintenance(maintenance);
	   /* MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);*/
	    return "edit_maintenance";
	}
	
	@RequestMapping(value = "/maintenance_report", method = RequestMethod.GET)
	public String view_maintenance_report(Maintenance maintenance,ModelMap model) {

		model.addAttribute("report_table","no");
	    return "maintainence_report";
	}
	
	@RequestMapping(value = "/maintanence_report", method = RequestMethod.POST)
	public String getReport(HttpServletRequest request,ModelMap model) {

		String type=request.getParameter("type_of_report");
		String no_of_days=request.getParameter("number_of_days");
		
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.generate_report(type, no_of_days));
		model.addAttribute("maintenanceForm",maintenanceForm);
		
		model.addAttribute("report_table","yes");
	    return "maintainence_report";
	}
	
	
	@RequestMapping(value = "/delete_maintenance", method = RequestMethod.GET)
	public String deletemaintenance(@RequestParam("auto_equip") String auto_equip,Maintenance maintenance,ModelMap model) {

		maintenanceDAO.delete_maintenance(auto_equip);
		MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);
		return "/maintenance_list";
	}
}