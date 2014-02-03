package qms.controllers;

import java.security.Principal;


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

import qms.dao.FormDAO;
import qms.model.Employee;
import qms.model.Form;
import qms.forms.EmployeeForm;
import qms.forms.FormForm;

@Controller
//@SessionAttributes({"audit_id","audit_process","audit_start_date","audit_due_date","auditor","audit_notes","audit_finding","audit_completion_date","auditors_initials","auditee_name"})
/*@SessionAttributes({"form"})*/
public class FormController
{
	@Autowired
	FormDAO formDAO;
	
	
	
	/*@RequestMapping(value={"/viewform"}, method = RequestMethod.GET)
	public String show_form(HttpSession session,HttpServletRequest request, ModelMap model, Principal principal )
	{
    FormForm formForm=new FormForm();
    formForm.setForm(formDAO.getform());
    model.addAttribute("formForm",formForm);
	return "view_form";
 	}*/
	
	
	@RequestMapping(value={"/addform"}, method = RequestMethod.GET)
	public String add_form(HttpSession session,ModelMap model, Principal principal )
	{
		session.removeAttribute("form");
		model.addAttribute("id", formDAO.get_maxid());
		  model.addAttribute("menu","document");
        return "add_form";
 	}
	

	@RequestMapping(value={"/addform"}, method = RequestMethod.POST)
	public String insert_form(HttpSession session,ModelMap model, @ModelAttribute("Form") @Valid Form form, BindingResult result, Principal principal)

	{	
		
		System.out.println("came");
		formDAO.insert_form(form);
		model.put("form", form);
		model.addAttribute("form",form);
		model.addAttribute("menu","form");
		  model.addAttribute("menu","document");
		return "add_form";
 	}
	
	
	@RequestMapping(value={"/updateform"}, method = RequestMethod.POST)
	public String update_form(HttpSession session,@ModelAttribute("form") @Valid Form form,BindingResult result,ModelMap model, Principal principal)
	{
		/*session.setAttribute("form",form);*/
		
		formDAO.update_form(form);
		
				
		/*FormForm formForm = new FormForm();
		model.addAttribute("formForm", formForm);
		model.addAttribute("success","true");
		model.addAttribute("menu","form");*/
		
		  model.addAttribute("menu","document");
		return "edit_form";
 	}
	
	
	@RequestMapping(value={"/deleteform"}, method = RequestMethod.GET)
	public String delete_form(@RequestParam("auto_no") String auto_no,ModelMap model, Principal principal )
	{
		
		formDAO.delete_form(auto_no);
		FormForm formForm=new FormForm();
	    formForm.setForm(formDAO.getform());
	    model.addAttribute("formForm",formForm);

	    model.addAttribute("menu","document");
		return "view_form";
		
 	}
	
	@RequestMapping(value={"/view_form"},method=RequestMethod.GET)
	public String viewEmployees(ModelMap model,Principal principal,Employee employee)
	{
		FormForm formForm=new FormForm();
	    formForm.setForm(formDAO.getform());
	    model.addAttribute("formForm",formForm);
	    model.addAttribute("menu","document");
		return "view_form";
	}
	
	@RequestMapping(value={"/edit_form"}, method = RequestMethod.GET)
	public String edit_form(@RequestParam("auto_no") String auto_no,Form form,ModelMap model)
	{
    
		FormForm formForm=new FormForm();
		formForm.setForm(formDAO.getform(auto_no));
		model.addAttribute("formForm",formForm);
		  model.addAttribute("menu","document");
		return "edit_form";
 	}
	
	@RequestMapping(value="/searchform",method=RequestMethod.GET)		
	public String searchform(HttpServletRequest request,HttpSession session,@RequestParam("form_or_rec_title") String recordtitle,@RequestParam("form_media_type") String mediatype,@RequestParam("retention_time") String retentiontime,ModelMap model)

	{
		
		System.out.println("find");
		session.setAttribute("recordtitle", recordtitle);
		session.setAttribute("mediatype", mediatype);
		session.setAttribute("retentiontime",retentiontime);

		if(recordtitle=="" && mediatype=="" && retentiontime=="")
		{
			FormForm formForm = new FormForm();
			formForm.setForm(formDAO.getform(recordtitle, mediatype, retentiontime));

			model.addAttribute("formForm",formForm);
			model.addAttribute("menu", "form");
			System.out.println("finding....");
			return "view_form";
		}
		else
		{
			System.out.println("searching.......");
			FormForm formForm = new FormForm();
			formForm.setForm(formDAO.getform(recordtitle, mediatype, retentiontime));
        model.addAttribute("formForm", formForm);
        model.addAttribute("menu","form");
        System.out.println("finding result");
		return "view_form";		
		}
		}
}

