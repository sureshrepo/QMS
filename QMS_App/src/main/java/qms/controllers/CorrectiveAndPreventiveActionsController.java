package qms.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.security.Principal;
import java.util.ArrayList;

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
import org.springframework.web.servlet.ModelAndView;

import qms.dao.CorrectiveAndPreventiveActionsDAO;
import qms.forms.CorrectiveAndPreventiveActionsForm;
import qms.model.CorrectiveAndPreventiveActions;



@Controller
@SessionAttributes({"correctiveAndPreventiveActions"})
public class CorrectiveAndPreventiveActionsController
{
	@Autowired
	CorrectiveAndPreventiveActionsDAO correctiveAndPreventiveActionsDAO;

	
	
	
	//CorrectiveAndPreventiveActions Report generation
	@RequestMapping(value = "/capas_report", method = RequestMethod.POST)
	public ModelAndView generateActions_Report(HttpServletRequest request,ModelMap model) {
		
	String[] fields={"capa_id","nc_id","source_of_nonconformance","external_id",
			"type_of_nonconformance","date_found",
			"temporary_action","nature_of_nc",
			"capa_requestor","request_date","capa_due_date",
			"assigned_team_leader","team_members",
			"root_cause_analysis_file","use_5_why_in_system",
			"why","root_cause_statement",
			"upload_external_analysis","upload","action",
			"responsibility","due_date","completion_date",
			"verified_by","verification_date"};	
		String title = "Corrective And Preventive Actions";
		java.util.List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions=new ArrayList<CorrectiveAndPreventiveActions>();
		
		 switch(Integer.parseInt(request.getParameter("actions_report_type")))
				  {
					  case 0:
						  correctiveAndPreventiveActions=correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions_bytype("Open_Corrective_Actions");
			  title="Open_Corrective_Actions";
			  break;
		  case 1:
			  correctiveAndPreventiveActions=correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions_bytype("Open_Corrective_Actions_for_Over_30_Days");
			  title="Open_Corrective_Actions_for_Over_30_Days";
			  break;
		  case 2:
			  correctiveAndPreventiveActions=correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions_bytype("Corrective_Actions_for_A_Certain_Period");
			  title="Corrective_Actions_for_A_Certain_Period";
			  break;
		  default:
			  break;
				  
		}		
		 
	if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		if(request.getParameterValues("report_field[]")!=null)
			
			for (@SuppressWarnings("unused") String field : request.getParameterValues("report_field[]")) 
			{
				title=request.getParameter("report_title");
				System.out.println(title);
						
				//fields=request.getParameterValues("report_type");
				
				ModelAndView modelAndView=new ModelAndView("CorrectiveAndPreventiveActionsDAO","correctiveAndPreventiveActions",correctiveAndPreventiveActions);
				modelAndView.addObject("fields",request.getParameterValues("report_field[]"));
				modelAndView.addObject("title",title);
				return modelAndView ;
			}
		}
		
		
		ModelAndView modelAndView=new ModelAndView("CorrectiveAndPreventiveActionsDAO","correctiveAndPreventiveActions",correctiveAndPreventiveActions);
		modelAndView.addObject("fields",fields);
		modelAndView.addObject("title",title);
		 
		return modelAndView ;
		
	}
	
@RequestMapping(value={"/search_correctiveactions"}, method = RequestMethod.GET)
	
	public String search_correctiveactions(@RequestParam("capa_requestor") String capa_requestor,@RequestParam("request_date") String request_date,@RequestParam("action") String action,ModelMap model, Principal principal)
{
	
	
	CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();

	correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.search_correctiveactions(capa_requestor,request_date,action));

	model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
	
	return "correctiveactions_list";


}
	// getting unique id
	@RequestMapping(value = { "/addcorrectiveAndPreventiveActions" }, method = RequestMethod.GET)
	public String add_correctiveAndPreventiveActions(ModelMap model, Principal principal) {
		model.addAttribute("capa_id",correctiveAndPreventiveActionsDAO.get_maxid());
	//	model.addAttribute("menu","audits");
		return "add_correctiveAndPreventiveActions";

	}

	// inserting audit
	@RequestMapping(value = "/add_correctiveAndPreventiveActions", method = RequestMethod.POST)
	public String insert_correctiveAndPreventiveActions(HttpSession session,
			@ModelAttribute("CorrectiveAndPreventiveActions") @Valid CorrectiveAndPreventiveActions correctiveAndPreventiveActions,
			BindingResult result, ModelMap model, Principal principal) {

		session.setAttribute("correctiveAndPreventiveActions",correctiveAndPreventiveActions);

		if (result.hasErrors()) {
			// session.removeAttribute("audit_start_date");
			model.addAttribute("capa_id",correctiveAndPreventiveActionsDAO.get_maxid());
			return "add_correctiveAndPreventiveActions";
		} else {

			if (!correctiveAndPreventiveActionsDAO.insert_correctiveAndPreventiveActions(correctiveAndPreventiveActions)) {
				CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
				correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO
						.getCorrectiveAndPreventiveActions());
				model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);

			}
			CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();

			correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());

			model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		}
	//	model.addAttribute("menu","audits");
		return "correctiveactions_list";
	}
	
	
	
	@RequestMapping(value="/correctiveactions_list", method=RequestMethod.GET)
	public String correctiveactionslist(HttpServletRequest request,ModelMap model, Principal principal) {
		 
		model.addAttribute("success","false");
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();

		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());

		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		
		return "correctiveactions_list";
	}
	
	
	
	@RequestMapping(value = "edit_correctiveAndPreventiveActions", method = RequestMethod.GET)
	public String edit_correctiveAndPreventiveActions(@RequestParam("capa_id") String capa_id,
			ModelMap model, Principal principal) {
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
System.out.println(capa_id);

		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.edit_CorrectiveAndPreventiveActions(capa_id));

		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		
		return "edit_correctiveactions";
	}
	//update record
	@RequestMapping(value = "/updatecorrectiveAndPreventiveActions", method = RequestMethod.POST)
	public String update_correctiveAndPreventiveActions(ModelMap model, Principal principal,@ModelAttribute("CorrectiveAndPreventiveActions") @Valid CorrectiveAndPreventiveActions correctiveAndPreventiveActions,
			BindingResult result) {
		
		if (result.hasErrors())
		{
			
			//System.out.println("output");
			CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
			correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.edit_CorrectiveAndPreventiveActions(correctiveAndPreventiveActions.getCapa_id()));
			model.addAttribute("correctiveAndPreventiveActionsForm", correctiveAndPreventiveActionsForm);
	        return "edit_internalaudit";
		}
		
		correctiveAndPreventiveActionsDAO.update_correctiveAndPreventiveActions(correctiveAndPreventiveActions);
	//	model.addAttribute("menu","audits");
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();

		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions());

		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
	//	model.addAttribute("menu","audits");
		return "view_internalaudits";
	}

	//view records
	@RequestMapping(value = { "/view_correctiveandpreventive" }, method = RequestMethod.GET)
	public String showInternalAudits(ModelMap model, Principal principal,@RequestParam("capa_id") String capa_id) {

		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();

		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions(capa_id));

		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		//model.addAttribute("menu","audits");
		return "view_correctiveactions";
	}

	//delete a record 
	@RequestMapping(value = { "delete_correctiveAndPreventiveActions" }, method = RequestMethod.GET)
	public String delete_internalaudits(@RequestParam("capa_id") String capa_id,
			ModelMap model, Principal principal) {

		correctiveAndPreventiveActionsDAO.delete_correctiveAndPreventiveActions(capa_id);
		return "correctiveactions_list";
	}

	
	@RequestMapping(value = { "/capa_report" }, method = RequestMethod.POST)
	public String capa_report(HttpServletRequest request,ModelMap model, Principal principal) 
	{		
		String[] fields={"capa_id","nc_id","source_of_nonconformance","external_id",
				"type_of_nonconformance","date_found",
				"temporary_action","nature_of_nc",
				"capa_requestor","request_date","capa_due_date",
				"assigned_team_leader","team_members",
				"root_cause_analysis_file","use_5_why_in_system",
				"why","root_cause_statement",
				"upload_external_analysis","upload","action",
				"responsibility","due_date","completion_date",
				"verified_by","verification_date"};	
		
		String type=request.getParameter("type_of_report");
		
		CorrectiveAndPreventiveActionsForm correctiveAndPreventiveActionsForm = new CorrectiveAndPreventiveActionsForm();
		//InternalAuditsForm.setInternalAudits(internalAuditsDAO.get_report_internalaudits(type));
		correctiveAndPreventiveActionsForm.setCorrectiveAndPreventiveActions(correctiveAndPreventiveActionsDAO.getCorrectiveAndPreventiveActions_bytype(type));
		model.addAttribute("correctiveAndPreventiveActionsForm",correctiveAndPreventiveActionsForm);
		model.addAttribute("type",type);		
		model.addAttribute("report_table","yes");
	//	model.addAttribute("menu","audits");
		return "capa_report";
	}
	
	//report page request passing
	@RequestMapping(value = { "/capa_report" }, method = RequestMethod.GET)
	public String get_capa_report(ModelMap model, Principal principal) 
	{
		model.addAttribute("report_table","no");
	//	model.addAttribute("menu","audits");
		return "capa_report";
	}
	
}