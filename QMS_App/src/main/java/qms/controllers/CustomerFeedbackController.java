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

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import qms.dao.CustomerFeedbackDAO;
import qms.model.CustomerFeedback;
import qms.forms.CustomerFeedbackForm;
import qms.dao.FileHandlingDAO;

@Controller
public class CustomerFeedbackController
{
	@Autowired
	CustomerFeedbackDAO customerFeedbackDAO;
	
	@Autowired
	FileHandlingDAO fileHandlingDAO;
	
	@RequestMapping(value={"/addfeedback"}, method = RequestMethod.GET)
	public String add_customerfeedback(ModelMap model, Principal principal ) {
		
		model.addAttribute("status","false");
		return "add_customerfeedback";
	}
	
	
	@RequestMapping(value={"/editfeedback"}, method = RequestMethod.GET)
	public String edit_customerfeedback(@RequestParam("fid") String fid,ModelMap model, Principal principal ) {
		
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getParticular_Customersfeedbacks(fid));
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);
		
		
		//model.addAttribute("status","false");
		return "edit_customerfeedback";
	}
	
	@RequestMapping(value={"/updatefeedback"}, method = RequestMethod.POST)
	public String update_customerfeedback(CustomerFeedback customerFeedback,ModelMap model, Principal principal ) {
		
		
		customerFeedbackDAO.update_customerfeedback(customerFeedback);
		model.addAttribute("status","false");
		return "edit_customerfeedback";
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
	public String insert_customerfeedback(HttpServletRequest request,ModelMap model, Principal principal,CustomerFeedback customerFeedback ) throws IOException {
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
		
		CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
		customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getCustomersfeedbacks());
		model.addAttribute("customerFeedbackForm",customerFeedbackForm);		
		return "/view_customerfeedback";
	}
	
	
}