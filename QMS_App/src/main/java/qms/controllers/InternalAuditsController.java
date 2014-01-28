package qms.controllers;

import java.awt.List;
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

import qms.dao.InternalAuditsDAO;

import qms.forms.CustomersForm;
import qms.forms.InternalAuditsForm;

import qms.model.InternalAudits;

@Controller
@SessionAttributes({ "internalaudits" })
public class InternalAuditsController {

	@Autowired
	InternalAuditsDAO internalAuditsDAO;

	// getting unique id
	@RequestMapping(value = { "/addinternalaudits" }, method = RequestMethod.GET)
	public String add_internalaudits(ModelMap model, Principal principal) {
		model.addAttribute("id", internalAuditsDAO.get_maxid());
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
		return "view_internalaudits";
	}

	@RequestMapping(value = "edit_internalaudit", method = RequestMethod.GET)
	public String edit_internalaudits(@RequestParam("id") String id,
			ModelMap model, Principal principal) {
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();

		internalAuditsForm.setInternalAudits(internalAuditsDAO.edit_internalaudit(id));

		model.addAttribute("internalAuditsForm", internalAuditsForm);

		return "edit_internalaudit";
	}

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

		return "view_internalaudits";
	}

	@RequestMapping(value = { "/view_internalaudits" }, method = RequestMethod.GET)
	public String showInternalAudits(ModelMap model, Principal principal) {

		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();

		internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());

		model.addAttribute("internalAuditsForm", internalAuditsForm);

		return "view_internalaudits";
	}

	@RequestMapping(value = { "/delete_internalaudit" }, method = RequestMethod.GET)
	public String delete_internalaudits(@RequestParam("id") String id,
			ModelMap model, Principal principal) {

		internalAuditsDAO.delete_internalAudits(id);
		return "view_internalaudits";
	}

	
	@RequestMapping(value = { "/internalaudit_report" }, method = RequestMethod.POST)
	public String internalaudits_report(HttpServletRequest request,ModelMap model, Principal principal) 
	{
		String type=request.getParameter("type_of_report");
		
		InternalAuditsForm internalAuditsForm = new InternalAuditsForm();
		internalAuditsForm.setInternalAudits(internalAuditsDAO.get_report_internalaudits(type));
		model.addAttribute("internalAuditsForm", internalAuditsForm);
		model.addAttribute("type",type);		
		model.addAttribute("report_table","yes");
		return "internalaudit_report";
	}
	
	/*@RequestMapping(value ={ "/export" }, method = RequestMethod.GET)
	  public ModelAndView getExcel() {
		System.out.println("i am in new request mapping");
	    List<InternalAudits> internalAudits=new ArrayList<InternalAudits>();
	    
	    internalAudits=internalAuditsDAO.get_internalaudits();
	    java.util.List<Animal> animalList = animalService.getAnimalList();
		return new ModelAndView("AnimalListExcel", "animalList", animalList);

	   // return new ModelAndView("AnimalListExcel", "internalAudits", internalAudits);
	  }*/
	
	@RequestMapping(value ={ "/export" }, method = RequestMethod.GET)
	  public ModelAndView getExcel_view(@RequestParam("type") String type) {
		java.util.List<InternalAudits> internalAudits=new ArrayList<InternalAudits>();
	
	internalAudits=internalAuditsDAO.get_report_internalaudits(type);
	
	return new ModelAndView("InternalAuditsExcelView","internalAudits",internalAudits);
	
	}
	
	
	
	@RequestMapping(value = { "/internalaudit_report" }, method = RequestMethod.GET)
	public String get_internalaudits_report(ModelMap model, Principal principal) 
	{
		model.addAttribute("report_table","no");
		return "internalaudit_report";
	}
	
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
