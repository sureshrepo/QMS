package qms.controllers;

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

//import com.sun.mail.iap.Response;

import qms.dao.InternalAuditsDAO;
import qms.forms.InternalAuditsForm;

import qms.model.InternalAudits;

@Controller
@SessionAttributes({ "internalaudits" })
public class InternalAuditsController {

	@Autowired
	InternalAuditsDAO internalAuditsDAO;

	
	//Internal Audit Report generation
	@RequestMapping(value = "/internal_audit_report", method = RequestMethod.POST)
	public ModelAndView generateAudit_Report(HttpServletRequest request,ModelMap model) {
		
	String[] fields={"report_id","process","auditee_name","audit_start_date","audit_due_date","auditor","audit_notes","finding","completion_date","auditors_initial","type"};	
		String title = "internal_audit";
		java.util.List<InternalAudits> internalAudits=new ArrayList<InternalAudits>();
		
		 switch(Integer.parseInt(request.getParameter("audit_report_type")))
				  {
					  case 0:
			  internalAudits=internalAuditsDAO.getAudit_bytype("past_due_audits");
			  title="past_due_audits";
			  break;
		  case 1:
			  internalAudits=internalAuditsDAO.getAudit_bytype("audits_with_nonconformance");
			  title="audits_with_nonconformance";
			  break;
		  case 2:
			  internalAudits=internalAuditsDAO.getAudit_bytype("area_of_improvements");
			  title="area_of_improvements";
			  break;
		  case 3:
			  internalAudits=internalAuditsDAO.getAudit_bytype("past_due_audits_by_auditor");
			  title="past_due_audits_by_auditor";
			  break;
		  case 4:
			  internalAudits=internalAuditsDAO.getAudit_bytype("audit_schedule");
			  title="audit_schedule";
			  break;
		  default:
			  break;
				  
		}		
		 System.out.println(title);
	if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
		if(request.getParameterValues("report_field[]")!=null)
			
			for (@SuppressWarnings("unused") String field : request.getParameterValues("report_field[]")) 
			{
				title=request.getParameter("report_title");
				System.out.println(title);
						
				//fields=request.getParameterValues("report_type");
				
				ModelAndView modelAndView=new ModelAndView("internalauditsDAO","internalAudits",internalAudits);
				modelAndView.addObject("fields",request.getParameterValues("report_field[]"));
				modelAndView.addObject("title",title);
				return modelAndView ;
			}
		}
		
		
		ModelAndView modelAndView=new ModelAndView("internalauditsDAO","internalAudits",internalAudits);
		modelAndView.addObject("fields",fields);
		modelAndView.addObject("title",title);
		 
		return modelAndView ;
		
	}
	
	
	// getting unique id
	@RequestMapping(value = { "/addinternalaudits" }, method = RequestMethod.GET)
	public String add_internalaudits(ModelMap model, Principal principal) {
		model.addAttribute("id", internalAuditsDAO.get_maxid());
		model.addAttribute("menu","audits");
		return "add_internalaudits";

	}

	
	
	// inserting audit
	@RequestMapping(value = "/add_internalaudits", method = RequestMethod.POST)
	public String insert_internalaudits(HttpSession session,
			@ModelAttribute("InternalAudits") @Valid InternalAudits internalAudits,
			BindingResult result, ModelMap model, Principal principal) {

		session.setAttribute("internalaudits", internalAudits);

		if (result.hasErrors()) {
			// session.removeAttribute("audit_start_date");
			System.out.println(internalAudits.getProcess());
			System.out.println("Errors found");
			model.addAttribute("id", internalAuditsDAO.get_maxid());
			return "add_internalaudits";
		} else {

			if (!internalAuditsDAO.insert_internalAudits(internalAudits)) {
				InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
				internalAuditsForm.setInternalAudits(internalAuditsDAO
						.get_internalaudits());
				model.addAttribute("internalAuditsForm", internalAuditsForm);

			}

		}
		model.addAttribute("menu","audits");
		return "view_internalaudits";
	}
	// Internal audits report list page	
	
	@RequestMapping(value = "list_internalaudit", method = RequestMethod.GET)
	public String list_internalaudits(@RequestParam("id") String id,
			ModelMap model, Principal principal) 
	{
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();

		internalAuditsForm.setInternalAudits(internalAuditsDAO.edit_internalaudit(id));

		model.addAttribute("internalAuditsForm", internalAuditsForm);
		model.addAttribute("menu","audits");
		return "auditslist";
	}
	// Internal audits edit page
	@RequestMapping(value = "edit_internalaudit", method = RequestMethod.GET)
	public String edit_internalaudits(@RequestParam("id") String id,
			ModelMap model, Principal principal) {
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();

		internalAuditsForm.setInternalAudits(internalAuditsDAO.edit_internalaudit(id));

		model.addAttribute("internalAuditsForm", internalAuditsForm);
		model.addAttribute("menu","audits");
		return "edit_internalaudit";
	}

	
	//update record
	@RequestMapping(value = "/updateinternalaudits", method = RequestMethod.POST)
	public String update_internalaudits(ModelMap model, Principal principal,@ModelAttribute("InternalAudits") @Valid InternalAudits internalAudits,
			BindingResult result) {
		
		if (result.hasErrors())
		{
			
			System.out.println("output");
			InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
			internalAuditsForm.setInternalAudits(internalAuditsDAO.edit_internalaudit(internalAudits.getId()));
			model.addAttribute("internalAuditsForm", internalAuditsForm);
	        return "edit_internalaudit";
		}
		
		internalAuditsDAO.update_internalaudits(internalAudits);
		model.addAttribute("menu","audits");
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();

		internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());

		model.addAttribute("internalAuditsForm", internalAuditsForm);
		model.addAttribute("menu","audits");
		return "view_internalaudits";
	}

	
	//view records
	@RequestMapping(value = { "/view_internalaudits" }, method = RequestMethod.GET)
	public String showInternalAudits(ModelMap model, Principal principal) {
	InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
	//internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());
	model.addAttribute("menu","audits");
	model.addAttribute("noofrows",5); 
	
	internalAuditsForm.setInternalAudits(internalAuditsDAO.getlimitedinternalreport(1));
	 model.addAttribute("noofpages",(int) Math.ceil(internalAuditsDAO.getnoofinternalreport() * 1.0 / 5));	 
	 model.addAttribute("button","viewall");
     model.addAttribute("success","false");
     model.addAttribute("currentpage",1);
     model.addAttribute("internalAuditsForm", internalAuditsForm);

		return "view_internalaudits";
	}

	



	@RequestMapping(value="/viewinternalreport_page", method=RequestMethod.GET)
	public String viewinternalreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.getlimitedinternalreport(page));
		model.addAttribute("noofpages",(int) Math.ceil(internalAuditsDAO.getnoofinternalreport() * 1.0 / 5));
		 model.addAttribute("internalAuditsForm", internalAuditsForm);	
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","audits");
	    model.addAttribute("button","viewall");
	    
	    return "view_internalaudits";
	    
		
	}


	@RequestMapping(value={"/", "/viewallinternalreport"}, method = RequestMethod.GET)
	public String viewallinternalreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());
		model.addAttribute("internalAuditsForm", internalAuditsForm);

	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","audits");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","audits");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "view_internalaudits";

	}

	
	//delete a record 
	@RequestMapping(value = { "/delete_internalaudit" }, method = RequestMethod.GET)
	public String delete_internalaudits(@RequestParam("id") String id,
			ModelMap model, Principal principal) {

		internalAuditsDAO.delete_internalAudits(id);
		return "view_internalaudits";
	}

	
	
	// Report Generation
	@RequestMapping(value = { "/internalaudit_report" }, method = RequestMethod.POST)
	public String internalaudits_report(HttpServletRequest request,ModelMap model, Principal principal) 
	{
		String type=request.getParameter("type_of_report");
		
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		//InternalAuditsForm.setInternalAudits(internalAuditsDAO.get_report_internalaudits(type));
		model.addAttribute("internalAuditsForm", internalAuditsForm);
		model.addAttribute("type",type);		
		model.addAttribute("report_table","yes");
		model.addAttribute("menu","audits");
		return "internalaudit_report";
	}
	
	
	//report page request passing
	@RequestMapping(value = { "/internalaudit_report" }, method = RequestMethod.GET)
	public String get_internalaudits_report(ModelMap model, Principal principal) 
	{
		model.addAttribute("report_table","no");
		model.addAttribute("menu","audits");
		return "internalaudit_report";
	}
	
   
	
	//search for record in view 
	@RequestMapping(value={"/search_audits"}, method = RequestMethod.GET)
	public String search_internalaudits(@RequestParam("id") String id,@RequestParam("process") String process,@RequestParam("auditee_name") String auditee_name,ModelMap model, Principal principal)
{
	System.out.println(id);
	
InternalAuditsForm internalAuditsForm= new InternalAuditsForm();
	
	internalAuditsForm.setInternalAudits(internalAuditsDAO.search_internalaudit(id,process,auditee_name));
	
	model.addAttribute("internalAuditsForm",internalAuditsForm);
	
    return "view_internalaudits";

}
	
}
