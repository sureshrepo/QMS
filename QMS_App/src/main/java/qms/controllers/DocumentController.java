package qms.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.apache.velocity.runtime.directive.Foreach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import qms.dao.DocumentControlDAO;
import qms.dao.FileHandlingDAO;
import qms.model.ExternalDocument;
import qms.model.DocumentMain;
import qms.model.NonConformance;
import qms.dao.ProcessDAO;
import qms.forms.EmployeeForm;
import qms.forms.ProcessForm;
import qms.dao.EmployeeDAO;
import qms.forms.DocumentMainForm;

@Controller
@SessionAttributes({ "temp_list" })
public class DocumentController {
	@Autowired
	DocumentControlDAO documentControlDAO;

	@Autowired
	ProcessDAO processDAO;

	@Autowired
	EmployeeDAO employeeDAO;


	@Autowired
	FileHandlingDAO fileHandlingDAO;


	@RequestMapping(value = { "/adddocument" }, method = RequestMethod.GET)
	public String add_document(HttpSession session, ModelMap model,
			Principal principal) {

		List<ExternalDocument> tempDocuments = new ArrayList<ExternalDocument>();
		session.setAttribute("temp_list", tempDocuments);
		/*
		 * To generate process drop down
		 */
		ProcessForm processForm = new ProcessForm();
		processForm.setProcesses(processDAO.getProcess());
		model.addAttribute("processForm", processForm);

		/*
		 * Load Employee list
		 */

		EmployeeForm employeeForm = new EmployeeForm();
		employeeForm.setEmployees(employeeDAO.getEmployees());
		model.addAttribute("employeeForm", employeeForm);

		model.addAttribute("id", "1001");
		return "add_documents";
	}


	

	@RequestMapping(value={"/adddocument"}, method = RequestMethod.GET)
	public String add_document(HttpSession session,ModelMap model, Principal principal )
	{
List<ExternalDocument> tempDocuments=new ArrayList<ExternalDocument>();
session.setAttribute("temp_list",tempDocuments);
/*
 * To generate process drop down
 */
	ProcessForm processForm=new ProcessForm();
	processForm.setProcesses(processDAO.getProcess());
	model.addAttribute("processForm",processForm);
	
	/*
	 * Load Employee list
	 */
	
	EmployeeForm employeeForm=new EmployeeForm();
	employeeForm.setEmployees(employeeDAO.getEmployees());
	model.addAttribute("employeeForm",employeeForm);
	
    model.addAttribute("id","1001");
    model.addAttribute("menu","document");
    return "add_documents";
 	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "/insert_documents" }, method = RequestMethod.POST)
	public String insert_document(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal,
			DocumentMain documentMain, BindingResult result) throws IOException {
		int flag = 0;
		documentMain.setDocument_id(request.getParameter("document_type") + '-'
				+ documentMain.getDocument_id());

		System.out.println("Started Inserting documents");
		// Started to handle upload document
		byte[] buffer;
		try {
			MultipartFile file = documentMain.getAttachments();
			String orginal_fileName = null;
			String duplicate_fileName = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (file != null) {
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					if (file.getSize() > 100000) {
						System.out.println("File Size:::" + file.getSize());
						return "/add_document";
					}
					orginal_fileName = "D:/Projects/Upload/DocumentControl/"
							+ file.getOriginalFilename();
					duplicate_fileName = orginal_fileName;
					File create_file = new File(orginal_fileName);
					int i = 1;
					while (create_file.exists()) {
						duplicate_fileName = "D:/Projects/Upload/DocumentControl/"
								+ file.getOriginalFilename().substring(
										0,
										file.getOriginalFilename().lastIndexOf(
												'.'))
								+ i
								+ file.getOriginalFilename().substring(
										file.getOriginalFilename().lastIndexOf(
												'.'));
						create_file = new File(duplicate_fileName);
						i++;
					}
					outputStream = new FileOutputStream(duplicate_fileName);
					System.out
							.println("fileName:" + file.getOriginalFilename());

					// ------Lines to changes------//

					documentMain.setAttachment_type(file.getContentType());
					documentMain.setAttachment_name(file.getOriginalFilename());
					documentMain.setAttachment_referrence(duplicate_fileName);

					// ----End Lines to changed----//

					int readBytes = 0;
					buffer = new byte[(int) file.getSize()];
					while ((readBytes = inputStream.read(buffer, 0,
							(int) file.getSize())) != -1) {
						outputStream.write(buffer, 0, readBytes);
					}
					outputStream.close();
					inputStream.close();

				}
			}
			if (documentControlDAO.insert_document(documentMain)) {
				model.addAttribute("success", "true");
				model.addAttribute("success_message", "Inserted Successfully");
				flag = 1;
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}

		model.addAttribute("id", "1001");
		if (flag == 1)
		{
			DocumentMainForm documentMainForm = new DocumentMainForm();
			documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
			model.addAttribute("documentMainForm", documentMainForm);
			
			return "view_documents";
		}
		else
			return "add_documents";

	}

	
	model.addAttribute("id","1001");
	model.addAttribute("menu","document");
    return "add_documents";

 	}
	

	@SuppressWarnings("unchecked")
	@RequestMapping(value = { "/addexternaldoc" }, method = RequestMethod.POST)
	public @ResponseBody
	String insert_external_document(HttpSession session,
			HttpServletRequest request, ModelMap model, Principal principal) {

		// temp_list.add(externalDocument);
		String issuer = request.getParameter("issuer");
		String edocument_id = request.getParameter("document_id");
		String approver1 = request.getParameter("approver1");
		String approver2 = request.getParameter("approver2");
		String approver3 = request.getParameter("approver3");
		String revision_level = request.getParameter("revision_level");
		String date = request.getParameter("date");
		String comments = request.getParameter("comments");
		String status = request.getParameter("status");
		ExternalDocument externalDocument = new ExternalDocument(edocument_id,
				issuer, revision_level, date, approver1, approver2, approver3,
				comments, status);
		List<ExternalDocument> temp_list = new ArrayList<ExternalDocument>();

		temp_list = (List<ExternalDocument>) session.getAttribute("temp_list");
		temp_list.add(externalDocument);
		session.setAttribute("temp_list", temp_list);
		String resultHTML = "";
		int i = 0;

		resultHTML += "<tr class='row1' style='font-weight:bold;color:brown;'>"
				+ "<td valign='top' align='center' width='15%' >S.no</td>"
				+ "<td valign='top' align='center' width='10%'>Issuer</td>"
				+ "<td valign='top' align='center' width='12%'>Revision Level</td>"
				+ "<td valign='top' align='center' width='10%'>Date</td>"
				+ "<td valign='top' align='center' width='15%'>Approver1</td>"
				+ "<td valign='top' align='center' width=15%'>Approver2</td>"
				+ "<td valign='top' align='center' width='15%'>Approver3</td>"
				+ "<td valign='top' align='center' width='20%'>Action</td>"
				+ "</tr>";

		for (ExternalDocument externalDoc : temp_list) {
			i = i + 1;
			if (i % 2 == 0)
				resultHTML += "<tr id='document_list' class='row1'>";
			else
				resultHTML += "<tr id='document_list' class='row2'>";
			resultHTML += "<td valign='top' align='center'  width='15%'>"
					+ i
					+ "</td>"
					+ "<td valign='top' align='center'  width='10%'>"
					+ externalDoc.getIssuer()
					+ "</td>"
					+ "<td valign='top' align='center'  width='12%'>"
					+ externalDoc.getRevision_level()
					+ "</td>"
					+ "<td valign='top' align='center'  width='10%'>"
					+ externalDoc.getDate()
					+ "</td>"
					+ "<td valign='top' align='center'  width='15%'>"
					+ externalDoc.getApprover1()
					+ "</td>"
					+ "<td valign='top' align='center'  width='15%'>"
					+ externalDoc.getApprover2()
					+ "</td>"
					+ "<td valign='top' align='center'  width='15 %'>"
					+ externalDoc.getApprover3()
					+ "</td>"
					+ "<td valign='top' align='center' width='25%'><a href='#'>Remove</a></td></tr>";

		}

		System.out.println(temp_list.get(0).getIssuer());
		System.out.println(issuer);
		System.out.println(date);
		return resultHTML;
	}

	// Document Views

	@RequestMapping(value = "/viewdocuments", method = RequestMethod.GET)
	public String login(ModelMap model) {

		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.getDocuments());
		model.addAttribute("documentMainForm", documentMainForm);
		return "view_documents";

	}

	@RequestMapping(value = "/downloadMaindoc", method = RequestMethod.GET)
	public String downloadMaindoc(HttpServletResponse response,
			@RequestParam("id") String document_id, ModelMap model)
			throws IOException {

		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO
				.getDocuments(document_id));
		model.addAttribute("documentMainForm", documentMainForm);

		fileHandlingDAO
				.filedownload(response, documentMainForm.getDocumentMains()
						.get(0).getAttachment_referrence(), documentMainForm
						.getDocumentMains().get(0).getAttachment_name());

		return "view_documents";

	}

	@RequestMapping(value = "/findDocument", method = RequestMethod.GET)
	public String findDocument(
			@RequestParam("search_document_id") String search_document_id,
			@RequestParam("search_document_title") String search_document_title,
			@RequestParam("search_process") String search_process,
			ModelMap model) {

		DocumentMainForm documentMainForm = new DocumentMainForm();
		documentMainForm.setDocumentMains(documentControlDAO.findDocuments(
				search_document_id, search_document_title, search_process));
		model.addAttribute("documentMainForm", documentMainForm);
		return "view_documents";

	}

	@RequestMapping(value = "/document_report", method = RequestMethod.GET)
	public String reportDocument(ModelMap model) {

		return "report_document";

	}
	
	@RequestMapping(value = "/generate_doc_report", method = RequestMethod.POST)
	public ModelAndView generateDocument_Report(HttpServletRequest request,ModelMap model) {
		
		System.out.println(request.getParameter("type_of_report"));
		java.util.List<DocumentMain> documentMains=new ArrayList<DocumentMain>();
		if(request.getParameter("type_of_report").equals("document_list_by_type"))
		{
		  switch(Integer.parseInt(request.getParameter("doc_type")))
				  {
		  case 0:
			  documentMains=documentControlDAO.getDocuments_bytype("Manual");
			  break;
		  case 1:
			  documentMains=documentControlDAO.getDocuments_bytype("Procedure");
			  break;
		  case 2:
			  documentMains=documentControlDAO.getDocuments_bytype("Work Instruction");
			  break;
		  case 3:
			  documentMains=documentControlDAO.getDocuments_bytype("Standard");
			  break;
		  case 4:
			  documentMains=documentControlDAO.getDocuments_bytype("Goverment Reg");
			  break;
		  case 5:
			  documentMains=documentControlDAO.getDocuments_bytype("Specification");
			  break;
		  default:break;
				  }
			
			
		}
		else
		{
			documentMains=documentControlDAO.getDocuments_byExternal();
		}
		
		if(Integer.parseInt(request.getParameter("report_type"))==1)
		{
			//if(request.getParameterValues("report_field[]"))
			/*
			for (String field : request.getParameterValues("report_field[]")) {
				
			}*/
		}
		
		System.out.println("coming............");
	//	documentMains=documentControlDAO.getDocuments();
		
		ModelAndView modelAndView=new ModelAndView("documentcontrolDAO","documentMains",documentMains);
		
		modelAndView.addObject("fields",request.getParameterValues("report_field[]"));
		
		return modelAndView ;
		

	}
	
	
}