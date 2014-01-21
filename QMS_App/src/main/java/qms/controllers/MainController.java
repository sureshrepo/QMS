package qms.controllers;
 
 

import java.security.Principal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import qms.dao.MainDAO;
import qms.forms.ParticipantsDetailsForm;
import qms.model.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

 
 
@Controller
@SessionAttributes
public class MainController {
	
	@Autowired  
	MainDAO mainDAO; 
	@Autowired  
	EmailSender emailSender;
	@Autowired  
	TwilioSMS messageSender;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class); //Logger
	
 
	@RequestMapping(value={"/", "/welcome"}, method = RequestMethod.GET)
	//TODO Change to Dashboard
	public String printWelcome(ModelMap model, Principal principal ) {
		
		ParticipantsDetailsForm participantsDetailsForm = new ParticipantsDetailsForm();
		participantsDetailsForm.setParticipantsDetails(mainDAO.getParticipants());
        model.addAttribute("participantsDetailsForm", participantsDetailsForm);
		return "dashboard";
 
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "login";
 
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "login";
 
	}
	
	@RequestMapping(value="/createuser", method=RequestMethod.GET)
	public String createSpitterProfile(Model model) {
		model.addAttribute(new UserProfile());
	return "edit";
	}
	
	@RequestMapping(value="/submituser", method=RequestMethod.POST)
	public String addUserProfileFromForm(UserProfile userProfile) {
		
		System.out.println("Save User" + userProfile.getFullName());
		return "/welcome";
	}
	
	@RequestMapping(value="/showaddparticipants", method=RequestMethod.GET)
	public String showAddParticipants(ModelMap model) {
		//model.addAttribute(new UserProfile());
		return "addparticipants";
	}
	@RequestMapping(value="/addparticipants", method=RequestMethod.POST)
	public String addParticipants(ModelMap model) {
		//model.addAttribute(new UserProfile());
		return "addparticipants";
	}
	@RequestMapping(value="/viewparticipants", method=RequestMethod.GET)
	public String viewParticipants(ModelMap model) {
		
		return "viewparticipants";
	}
	@RequestMapping(value="/showaddparticipantgroups", method=RequestMethod.GET)
	public String showAddParticipantGroups(ModelMap model) {
		
		return "addparticipantgroups";
	}
	@RequestMapping(value="/viewparticipantgroups", method=RequestMethod.GET)
	public String viewParticipantGroups(ModelMap model) {
		
		return "viewparticipantgroups";
	}
	
	@RequestMapping(value="/showaddadminuser", method=RequestMethod.GET)
	public String showAddadminUser(ModelMap model) {
		
		return "addadminuser";
	}
	@RequestMapping(value="/viewadminuser", method=RequestMethod.GET)
	public String viewAdminUser(ModelMap model) {
		
		return "viewadminuser";
	}
	
	@RequestMapping(value="/activityofadmin", method=RequestMethod.GET)
	public String activityOfAdmin(ModelMap model) {
		
		return "activityofadmin";
	}
	
	@RequestMapping(value="/textmsgsettings", method=RequestMethod.GET)
	public String textMsgSettings(ModelMap model) {
		
		return "textmsg";
	}
  }