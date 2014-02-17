package qms.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import qms.dao.FileHandlingDAO;
import qms.dao.NonConformanceDAO;
import qms.forms.CorrectiveAndPreventiveActionsForm;
import qms.forms.EmployeeForm;
import qms.forms.NonConformanceForm;
import qms.model.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@SessionAttributes({"nonconformance"})
public class NonConformanceController {
	@Autowired
	NonConformanceDAO nonConformanceDAO;
	
	@Autowired
	FileHandlingDAO fileHandlingDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class); // Logger

	
	@RequestMapping(value = { "/view_nonconformance" }, method = RequestMethod.GET)
	public String showNonconformance(ModelMap model, Principal principal) {
		model.addAttribute("success","false");
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm", nonConformanceForm);
		model.addAttribute("menu","nonconformance");
		return "view_nonconformance";
	}

	@RequestMapping(value = { "/add_nonconformance" }, method = RequestMethod.GET)
	public String addNonconformance_get(HttpSession session,ModelMap model, Principal principal) {
		model.addAttribute("id", nonConformanceDAO.get_maxid());
		session.removeAttribute("nonconformance");
		model.addAttribute("menu","nonconformance");
		return "add_nonconformance";
	}

	@RequestMapping(value = "/add_nonconformance", method = RequestMethod.POST)
	public String addNonconformance_post(HttpSession session,@ModelAttribute("Nonconformance") @Valid NonConformance nonConformance,BindingResult result,@ModelAttribute("CorrectiveAndPreventiveActions") @Valid CorrectiveAndPreventiveActions correctiveAndPreventiveActions,BindingResult result2,ModelMap model) {
		session.setAttribute("nonconformance",nonConformance);
       System.out.println(nonConformance.getCost_of_nonconformance());
       System.out.println(correctiveAndPreventiveActions.getAssigned_team_leader());
		
       if(nonConformance.getCorrective_action_required()=="1")
       {
		if (result.hasErrors()||result2.hasErrors())
			{
			
			model.addAttribute("id",nonConformanceDAO.get_maxid());
				return "add_nonconformance";
			}
       }
       else if(result.hasErrors())
       {
    	   model.addAttribute("id",nonConformanceDAO.get_maxid());
			return "add_nonconformance"; 
       }
		nonConformanceDAO.insert_nonconformance(nonConformance,correctiveAndPreventiveActions);
		NonConformanceForm nonConformanceForm=new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
	    model.addAttribute("nonConformanceForm",nonConformanceForm);
	    model.addAttribute("menu","nonconformance");
		return "view_nonconformance";
	}

	@RequestMapping(value = "/delete_nonconformance", method = RequestMethod.GET)
	public String deleteNonconformance_get(@RequestParam("id") String id,
			NonConformance nonConformance,ModelMap model) {

		nonConformanceDAO.delete_nonconformance(id);
		NonConformanceForm nonConformanceForm = new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm",nonConformanceForm);
		model.addAttribute("menu","nonconformance");
		return "/view_nonconformance";
	}
	
	@RequestMapping(value = "/edit_nonconformance", method = RequestMethod.GET)
	public String editNonconformance_get(@RequestParam("id") String id,
			NonConformance nonConformance,ModelMap model) {

		NonConformanceForm nonConformanceForm=new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.edit_nonconformance(id));
	    model.addAttribute("nonConformanceForm",nonConformanceForm);
		
	    model.addAttribute("menu","nonconformance");
	    return "/edit_nonconformance";
	}
	
	
	@RequestMapping(value = "/update_nonconformance", method = RequestMethod.POST)
	public String editNonconformance_post(ModelMap model,@ModelAttribute("Nonconformance") @Valid NonConformance nonConformance,BindingResult result) {

		if (result.hasErrors())
		{
			
			System.out.println("output");
			NonConformanceForm nonConformanceForm=new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.edit_nonconformance(nonConformance.getId()));
			model.addAttribute("nonConformanceForm",nonConformanceForm);	
	        return "edit_nonconformance";
		}
		
		
		nonConformanceDAO.update_nonconformance(nonConformance);
		NonConformanceForm nonConformanceForm=new NonConformanceForm();
		nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		model.addAttribute("nonConformanceForm",nonConformanceForm);
		model.addAttribute("menu","nonconformance");
		return "view_nonconformance";
	}

	
	@RequestMapping(value = "/findnonconformance", method = RequestMethod.GET)
	public String findNonconformance(@RequestParam("id") String id,@RequestParam("type_of_nonconformance") String type_of_nonconformance,@RequestParam("product_id") String product_id,NonConformance nonConformance,ModelMap model) {

		if(id.equals("")&&type_of_nonconformance.equals("")&&product_id.equals(""))
		{
			NonConformanceForm nonConformanceForm=new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.get_nonconformance());
		    model.addAttribute("nonConformanceForm",nonConformanceForm);
			
		}
		else
		{
		NonConformanceForm nonConformanceForm=new NonConformanceForm();
			nonConformanceForm.setNonconformance(nonConformanceDAO.find_nonconformance(id, type_of_nonconformance, product_id));
		    model.addAttribute("nonConformanceForm",nonConformanceForm);
				}
	  
		return "view_nonconformance";
		
	}
	

	//This is used for downloading Excel Sheet
	@RequestMapping(value ={ "/nonconformancereport" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view() {
	java.util.List<NonConformance> nonConformances=new ArrayList<NonConformance>();
	
	nonConformances=nonConformanceDAO.get_nonconformance();
	
	return new ModelAndView("nonconformanceDAO","nonConformances",nonConformances);
	
	}
	//report page request passing
	@RequestMapping(value = "/nonconformance_report", method = RequestMethod.GET)
	public String reportnonconformance(ModelMap model) {
		  model.addAttribute("menu","nonconformance");
		return "report_nonconformance";

	}
	
	//Nonconformance Report Generation
	@RequestMapping(value = "/generate_nonconformance_report", method = RequestMethod.POST)
	public ModelAndView generatenonnonconformance_Report(HttpServletRequest request,ModelMap model, HttpServletResponse response)
	{
		String start = null,end = null;
		String[] fields={"id","source_of_nonconformance","external_id","type_of_nonconformance","product_id","quantity_suspect","nature_of_nonconformance","date_found","reported_by","temporary_action","corrective_action_required","disposition","disposition_complete_date","name_of_disposition_responsibility","cost_of_nonconformance"};
		System.out.println(request.getParameter("type_of_report"));
		java.util.List<NonConformance> nonConformances=new ArrayList<NonConformance>();
			switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  nonConformances=nonConformanceDAO.get_nonconformance_type("opennonconformance",start,end);
			  break;
		  case 1:
			  nonConformances=nonConformanceDAO.get_nonconformance_type("nodispositionover30days","start","end");
			  break;
		  case 2:
			  start=request.getParameter("start_date");
				end=request.getParameter("end_date");
				
			  nonConformances=nonConformanceDAO.get_nonconformance_type("opennonconformance","start","end");
			  break;
		  
		  default:
			  break;
				  
				
		}
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		
				System.out.println("now ok");
				 response.setHeader("Content-Disposition","attachment;filename='"+request.getParameter("name_of_disposition_responsibility")+"'");
					
				fields=request.getParameterValues("report_field[]");
			
		}
		else
			
		response.setHeader("Content-Disposition","attachment;filename='NonConformance_Report'");
		
		
		ModelAndView modelAndView=new ModelAndView("nonconformanceDAO","nonConformances",nonConformances);
		
		modelAndView.addObject("fields",fields);
		
		System.out.println("now ok::::");
		return modelAndView ;
	}


	@RequestMapping(value = { "/edit_correctiveactions" }, method = RequestMethod.GET)
	public String add_corrective(@RequestParam("nc_id") String nc_id,HttpSession session,ModelMap model, Principal principal) {
		
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(nonConformanceDAO.edit_corrective(nc_id));
		model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective");
		return "edit_correctiveactions";
	}
	
	@RequestMapping(value = "/update_corrective", method = RequestMethod.POST)
	public String update_corrective(ModelMap model,CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {

		
		nonConformanceDAO.update_corrective(correctiveAndPreventiveActions);
	   /* MaintenanceForm maintenanceForm= new MaintenanceForm();
		maintenanceForm.setMaintenance(maintenanceDAO.getmaintenance());
		model.addAttribute("maintenanceForm",maintenanceForm);*/
		model.addAttribute("menu","corrective");
	    return "edit_correctiveactions";
	}
	
	

	@RequestMapping(value="/view_correctiveactions", method=RequestMethod.GET)
	public String viewcorrective(HttpServletRequest request,ModelMap model, Principal principal) {
		 
		model.addAttribute("success","false");
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(nonConformanceDAO.get_corrective());
		model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);
		model.addAttribute("menu","corrective");
		return "view_correctiveactions";
	}

	}
	
	
	
	

