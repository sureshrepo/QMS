package qms.controllers;


import java.io.FileOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;



import java.io.IOException;
import java.security.Principal;
import java.util.logging.FileHandler;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.http.HttpRequest;
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
import qms.forms.MaintenanceForm;
import qms.forms.SupplierPerformanceForm;
import qms.dao.FileHandlingDAO;

@Controller
@SessionAttributes({"feedback"})
public class CustomerFeedbackController
{
	@Autowired
	CustomerFeedbackDAO customerFeedbackDAO;
	
	@Autowired
	FileHandlingDAO fileHandlingDAO;
	
	@RequestMapping(value={"/addfeedback"}, method = RequestMethod.GET)
	public String add_customerfeedback(HttpSession session, ModelMap model, Principal principal ) {
		
		model.addAttribute("status","false");
		session.removeAttribute("feedback");
		model.addAttribute("menu","customer");
		return "add_customerfeedback";
	}
	
	
	@RequestMapping(value={"/editfeedback"}, method = RequestMethod.GET)
	public String edit_customerfeedback(@RequestParam("fid") String fid,ModelMap model, Principal principal ) {
		
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getParticular_Customersfeedbacks(fid));
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);
		
		
		//model.addAttribute("status","false");
		model.addAttribute("menu","customer");
		return "edit_customerfeedback";
	}
	
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
	
	@RequestMapping(value={"/deletefeedback"}, method = RequestMethod.GET)
	public String delete_customerfeedback(@RequestParam("fid") String fid,ModelMap model, Principal principal ) {
		
		
		customerFeedbackDAO.delete_customerfeedback(fid);		
		model.addAttribute("status","false");
		return "view_customerfeedback";
	}
	
	
	@RequestMapping(value={"/viewfeedback"}, method = RequestMethod.GET)
	public String view_customerfeedback(ModelMap model, Principal principal ) {
		
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getCustomersfeedbacks());
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);
		model.addAttribute("menu","customer");
		return "view_customerfeedback";
	}
	
	
	@RequestMapping(value={"/download_attachment"}, method = RequestMethod.GET)
	public void download_attachment(@RequestParam("fid") String fid,HttpServletResponse response,ModelMap model, Principal principal ) throws IOException {
		
		System.out.println(fid);
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getParticular_Customersfeedbacks(fid));
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);
		
		System.out.println("Going to download");
		fileHandlingDAO.filedownload(response,customerFeedbackForm.getCustomerFeedbacks().get(0).getAttachment_referrence(),customerFeedbackForm.getCustomerFeedbacks().get(0).getAttachment_name());
		System.out.println("End Download");
		
		//return "view_customerfeedback";
	}
	
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
			    orginal_fileName ="D:/Projects/QMS_Upload/Feedbacks/"+file.getOriginalFilename();
			    duplicate_fileName=orginal_fileName;
			    File create_file=new File(orginal_fileName);
			    int i=1;			    
			    while(create_file.exists())
			    {
			    	duplicate_fileName="D:/Projects/QMS_Upload/Feedbacks/"+file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf('.'))+i+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'));
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