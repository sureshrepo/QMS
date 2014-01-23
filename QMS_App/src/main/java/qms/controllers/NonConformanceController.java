package qms.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import qms.dao.NonConformanceDAO;
import qms.forms.MaintenanceForm;
import qms.forms.NonConformanceForm;
import qms.forms.ParticipantsDetailsForm;
import qms.model.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@SessionAttributes({"nonconformance"})
public class NonConformanceController {
	@Autowired
	NonConformanceDAO nonConformanceDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class); // Logger

	
	@RequestMapping(value = { "/view_nonconformance" }, method = RequestMethod.GET)
	public String showNonconformance(ModelMap model, Principal principal) {
		model.addAttribute("success","false");
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm", nonConformanceForm);
		return "view_nonconformance";
	}

	@RequestMapping(value = { "/add_nonconformance" }, method = RequestMethod.GET)
	public String addNonconformance_get(HttpSession session,ModelMap model, Principal principal) {
		model.addAttribute("id", nonConformanceDAO.get_maxid());
		session.removeAttribute("nonconformance");
		return "add_nonconformance";
	}

	@RequestMapping(value = "/add_nonconformance", method = RequestMethod.POST)
	public String addNonconformance_post(HttpSession session,@ModelAttribute("Nonconformance") @Valid NonConformance nonConformance,BindingResult result, ModelMap model) {
		session.setAttribute("nonconformance",nonConformance);
         if (result.hasErrors())
			{
			
				NonConformanceForm nonConformanceForm=new NonConformanceForm();
				nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
			    model.addAttribute("nonConformanceForm",nonConformanceForm);
				model.addAttribute("Success","true");
		        return "add_nonconformance";
			}
		nonConformanceDAO.insert_nonconformance(nonConformance);
		NonConformanceForm nonConformanceForm=new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
	    model.addAttribute("nonConformanceForm",nonConformanceForm);
		return "/view_nonconformance";
	}

	@RequestMapping(value = "/delete_nonconformance", method = RequestMethod.GET)
	public String deleteNonconformance_get(@RequestParam("id") String id,
			NonConformance nonConformance) {

		nonConformanceDAO.delete_nonconformance(id);
		return "/view_nonconformance";
	}
	
	@RequestMapping(value = "/edit_nonconformance", method = RequestMethod.GET)
	public String editNonconformance_get(@RequestParam("id") String id,
			NonConformance nonConformance,ModelMap model) {

		NonConformanceForm nonConformanceForm=new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.edit_nonconformance(id));
	    model.addAttribute("nonConformanceForm",nonConformanceForm);
		
		
	    return "/edit_nonconformance";
	}
	
	
	@RequestMapping(value = "/update_nonconformance", method = RequestMethod.POST)
	public String editNonconformance_post(NonConformance nonConformance,ModelMap model) {

	    nonConformanceDAO.update_nonconformance(nonConformance);
		return "/edit_nonconformance";
	}

	
	@RequestMapping(value = "/findnonconformance", method = RequestMethod.GET)
	public String findNonconformance(@RequestParam("nc_id") String nc_id,@RequestParam("type_of_non_conformance") String type_of_nonconformance,@RequestParam("product_id") String product_id,NonConformance nonConformance,ModelMap model) {

		if(nc_id.equals("")&&type_of_nonconformance.equals("")&&product_id.equals(""))
		{
			NonConformanceForm nonConformanceForm=new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		    model.addAttribute("nonConformanceForm",nonConformanceForm);
			
		}
		else
		{
		NonConformanceForm nonConformanceForm=new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.find_nonconformance(nc_id, type_of_nonconformance, product_id));
		    model.addAttribute("nonConformanceForm",nonConformanceForm);
				}
	  
		return "view_nonconformance";
		
	}
	
	
}
