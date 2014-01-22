package qms.controllers;
import java.security.Principal;

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

import qms.dao.InternalAuditsDAO;
import qms.forms.InternalAuditsForm;
import qms.model.InternalAudits;

@Controller
@SessionAttributes({"internalaudits"})
public class InternalAuditsController
{
	
	@Autowired
	InternalAuditsDAO internalAuditsDAO;
	
	
	
//getting unique id
@RequestMapping(value={"/addinternalaudits"}, method = RequestMethod.GET)
	
	public String add_internalaudits(ModelMap model, Principal principal)  {
	model.addAttribute("id", internalAuditsDAO.get_maxid());
return "add_internalaudits";

}
//inserting audit
@RequestMapping(value="/add_internalaudits", method = RequestMethod.POST)

public String insert_internalaudits(HttpSession session,@ModelAttribute("InternalAudits") @Valid InternalAudits internalAudits, BindingResult result,ModelMap model, Principal principal)  {
	
	session.setAttribute("internalaudits",internalAudits);
	
	
	if(result.hasErrors())
	{
		//session.removeAttribute("audit_start_date");
		System.out.println(internalAudits.getProcess());
		System.out.println("Errors found");
		model.addAttribute("id", internalAuditsDAO.get_maxid());
		return "add_internalaudits";
	}
	else
	{
	
	if(!internalAuditsDAO.insert_internalAudits(internalAudits))
	{
		System.out.println("success");
		
	}
	
	return "view_internalaudits";
	}
}


@RequestMapping(value = "edit_internalaudit", method = RequestMethod.GET)
public String edit_internalaudits(@RequestParam("id") String id,ModelMap model,Principal principal) {
InternalAuditsForm internalAuditsForm= new InternalAuditsForm();
	
	internalAuditsForm.setInternalAudits(internalAuditsDAO.edit_internalaudit(id));
	
	model.addAttribute("internalAuditsForm",internalAuditsForm);
	
    return "edit_internalaudit";
}

@RequestMapping(value = "/updateinternalaudits", method = RequestMethod.POST)
public String update_internalaudits(ModelMap model,Principal principal,InternalAudits internalAudits) {
  internalAuditsDAO.update_internalaudits(internalAudits);
   
	return "view_internalaudits";
}



@RequestMapping(value = { "/view_internalaudits" }, method = RequestMethod.GET)
public String showInternalAudits(ModelMap model, Principal principal) {
	
	InternalAuditsForm internalAuditsForm= new InternalAuditsForm();
	
	internalAuditsForm.setInternalAudits(internalAuditsDAO.get_internalaudits());
	
	model.addAttribute("internalAuditsForm",internalAuditsForm);
	
	return "view_internalaudits";
}




	@RequestMapping(value={"/delete_internalaudit"}, method = RequestMethod.GET)
	public String delete_internalaudits(@RequestParam("id") String id,ModelMap model, Principal principal )
	{
    
		internalAuditsDAO.delete_internalAudits(id);
		return "add_internalaudits";
 	}
	
	
	
	
}
