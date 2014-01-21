package qms.controllers;

import java.security.Principal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import qms.dao.NonConformanceDAO;
import qms.forms.NonConformanceForm;
import qms.forms.ParticipantsDetailsForm;
import qms.model.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@SessionAttributes
public class NonConformanceController {
	@Autowired
	NonConformanceDAO nonConformanceDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class); // Logger

	
	@RequestMapping(value = { "/view_nonconformance" }, method = RequestMethod.GET)
	public String showNonconformance(ModelMap model, Principal principal) {
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm", nonConformanceForm);
		return "view_nonconformance";
	}

	@RequestMapping(value = { "/add_nonconformance" }, method = RequestMethod.GET)
	public String addNonconformance_get(ModelMap model, Principal principal) {
		model.addAttribute("id", nonConformanceDAO.get_maxid());
		return "add_nonconformance";
	}

	@RequestMapping(value = "/add_nonconformance", method = RequestMethod.POST)
	public String addNonconformance_post(NonConformance nonConformance) {

		nonConformanceDAO.insert_nonconformance(nonConformance);
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

}
