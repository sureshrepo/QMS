package qms.controllers;


import java.io.FileOutputStream;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;



import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;

import qms.dao.CustomerFeedbackDAO;
import qms.model.CustomerFeedback;
import qms.forms.CustomerFeedbackForm;

import qms.dao.FileHandlingDAO;

@Controller
@SessionAttributes({"feedback"})
public class CustomerFeedbackController
{
	@Autowired
	CustomerFeedbackDAO customerFeedbackDAO;
	
	@Autowired
	FileHandlingDAO fileHandlingDAO;
	
	//Get method for customer feedback insertion 
	@RequestMapping(value={"/addfeedback"}, method = RequestMethod.GET)
	public String add_customerfeedback(HttpSession session, ModelMap model, Principal principal ) {
		
		model.addAttribute("status","false");
		session.removeAttribute("feedback");
		model.addAttribute("menu","customer");
		return "add_customerfeedback";
	}
	
	//edit a record
	@RequestMapping(value={"/editfeedback"}, method = RequestMethod.GET)
	public String edit_customerfeedback(@RequestParam("fid") String fid,ModelMap model, Principal principal ) {
		
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getParticular_Customersfeedbacks(fid));
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);
		
		
		//model.addAttribute("status","false");
		model.addAttribute("menu","customer");
		return "edit_customerfeedback";
	}
	
	//update a record
	@RequestMapping(value={"/updatefeedback"}, method = RequestMethod.POST)
	public String update_customerfeedback(CustomerFeedback customerFeedback,ModelMap model, Principal principal,BindingResult result ) {
		
		/*if (result.hasErrors())
		{
			CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
			customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getParticular_Customersfeedbacks(fid));
			model.addAttribute("customerFeedbackForm",customerFeedbackForm);	
	
		        return "edit_customerfeedback";
		}*/
		customerFeedbackDAO.update_customerfeedback(customerFeedback);
		model.addAttribute("menu","customer");
		return "view_customerfeedback";
	}
	
	//delete a record
	@RequestMapping(value={"/deletefeedback"}, method = RequestMethod.GET)
	public String delete_customerfeedback(@RequestParam("fid") String fid,ModelMap model, Principal principal ) {
		
		
		customerFeedbackDAO.delete_customerfeedback(fid);		
		model.addAttribute("status","false");
		return "view_customerfeedback";
	}
	
	//view a record
	@RequestMapping(value={"/viewfeedback"}, method = RequestMethod.GET)
	public String view_customerfeedback(ModelMap model, Principal principal ) {
		
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		model.addAttribute("menu","customer");
		model.addAttribute("noofrows",5);
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getlimitedfeedbackreport(1));
		model.addAttribute("noofpages",(int) Math.ceil(customerFeedbackDAO.getnooffeedbackreport() * 1.0 / 5));	 
        model.addAttribute("button","viewall");
        model.addAttribute("success","false");
        model.addAttribute("currentpage",1);
        
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);
		//model.addAttribute("menu","customer");
		return "view_customerfeedback";
	}
	

	


	@RequestMapping(value="/viewfeedbackreport_page", method=RequestMethod.GET)
	public String viewfeedbackreport_page(HttpServletRequest request,@RequestParam("page") int page,ModelMap model) {	
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getlimitedfeedbackreport(page));
		model.addAttribute("noofpages",(int) Math.ceil(customerFeedbackDAO.getnooffeedbackreport() * 1.0 / 5));
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);	
	  	model.addAttribute("noofrows",5);   
	    model.addAttribute("currentpage",page);
	    model.addAttribute("menu","customer");
	    model.addAttribute("button","viewall");
	    
	    return "view_customerfeedback";
		
	}


	@RequestMapping(value={"/viewallfeedbackreport"}, method = RequestMethod.GET)
	public String viewallfeedbackreport(HttpServletRequest request,ModelMap model, Principal principal ) {
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getCustomersfeedbacks());
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);	

	  	model.addAttribute("noofrows",5);    
	   //narrativereportForm.getNarrativereport().size()
	    model.addAttribute("menu","customer");
	    model.addAttribute("button","close");
	      
	    	model.addAttribute("menu","customer");
	        model.addAttribute("success","false");
	        model.addAttribute("button","close");
	        return "view_customerfeedback";

	}
	
	//downloading the attachment
	@RequestMapping(value={"/download_attachment"}, method = RequestMethod.GET)
	public String download_attachment(@RequestParam("fid") String feedback_id,HttpServletResponse response,ModelMap model, Principal principal ) throws IOException {
		
	
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getParticular_Customersfeedbacks(feedback_id));
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);
		System.out.println("Feedback id is:::"+feedback_id);	
		System.out.println("Going to download");
		fileHandlingDAO.filedownload(response,customerFeedbackForm.getCustomerFeedbacks().get(0).getAttachment_referrence(),customerFeedbackForm.getCustomerFeedbacks().get(0).getAttachment_name());
		System.out.println("End Download");
		
		return "view_customerfeedback";
	}
	
	//insert operation
	@RequestMapping(value={"/insertfeedback"}, method = RequestMethod.POST)
	public String insert_customerfeedback(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal,@ModelAttribute("CustomerFeedback") @Valid CustomerFeedback customerFeedback,BindingResult result ) throws IOException {
		System.err.println("-------------------------------------------");
		byte[] buffer=null;// = new byte[10000];
		try {
			MultipartFile file = customerFeedback.getAttachments();
			String orginal_fileName = null;
			String duplicate_fileName=null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			    if (file.getSize() > 0) {
				inputStream = file.getInputStream();
				if (file.getSize() > 100000) 
				{
					System.out.println("File Size:::" + file.getSize());
					return "/login";
				}				
			    orginal_fileName ="E:/Projects/"+file.getOriginalFilename();
			    duplicate_fileName=orginal_fileName;
			    File create_file=new File(orginal_fileName);
			    int i=1;			    
			    while(create_file.exists())
			    {
			    	duplicate_fileName="E:/Projects/"+file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf('.'))+i+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
			    	create_file=new File(duplicate_fileName);
			    	i++;
			    }
			    outputStream = new FileOutputStream(duplicate_fileName);
			    System.out.println("fileName:" + file.getOriginalFilename());
         
			    
			    //------Lines to changes------//
			    
			    customerFeedback.setAttachments_type(file.getContentType());
                customerFeedback.setAttachment_name(file.getOriginalFilename());
                customerFeedback.setAttachment_referrence(duplicate_fileName);
                
                //----End Lines to changed----//
              
                int readBytes = 0;
				buffer=new byte[(int)file.getSize()];
				while ((readBytes = inputStream.read(buffer, 0,(int) file.getSize())) != -1) {
				outputStream.write(buffer, 0, readBytes);			
				}
				outputStream.close();
				inputStream.close();
				customerFeedbackDAO.insert_customerfeedback(customerFeedback);
			}
	
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		session.setAttribute("feedback",customerFeedback);
		if (result.hasErrors())
		{
			CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
			customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getCustomersfeedbacks());
			model.addAttribute("customerFeedbackForm",customerFeedbackForm);	
			model.addAttribute("Success","true");
	        return "add_customerfeedback";
		}
		
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getCustomersfeedbacks());
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);		
		model.addAttribute("menu","customer");
		return "/view_customerfeedback";
	}
	
	//Search operation
	@RequestMapping(value="/findcustomerfeedback",method=RequestMethod.GET)		
	public String findcustomerfeedback(HttpServletRequest request,HttpSession session,@RequestParam("date_of_feedback") String date,@RequestParam("type_of_feedback") String type,ModelMap model)
	{
	
		System.out.println("find");
		
		session.setAttribute("date", date);
		session.setAttribute("type",type);
		if(date=="" && type=="")
		{
			CustomerFeedbackForm customerFeedbackForm = new CustomerFeedbackForm();
			customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getfindcustomerfeedback(date, type));
			model.addAttribute("customerFeedbackForm",customerFeedbackForm);
			model.addAttribute("menu", "customer");
			System.out.println("finding....");
			return "view_customerfeedback";
		}
		else
		{
			System.out.println("searching.......");
		CustomerFeedbackForm customerFeedbackForm = new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getfindcustomerfeedback(date, type));
       
		System.out.println("the search operation is perform well.....");
		model.addAttribute("customerFeedbackForm", customerFeedbackForm);
        model.addAttribute("menu","customer");
        System.out.println("finding result");
        model.addAttribute("menu","customer");
		return "view_customerfeedback";		
		}
		}

}