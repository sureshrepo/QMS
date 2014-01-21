package qms.controllers;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import qms.dao.DocumentControlDAO;
import qms.model.ExternalDocument;
import qms.model.DocumentMain;

@Controller
@SessionAttributes({"temp_list"})
public class DocumentController
{
	@Autowired
	DocumentControlDAO documentControlDAO;
	
	
	@RequestMapping(value={"/adddocument"}, method = RequestMethod.GET)
	public String add_document(HttpSession session,ModelMap model, Principal principal )
	{
List<ExternalDocument> tempDocuments=new ArrayList<ExternalDocument>();
session.setAttribute("temp_list",tempDocuments);
    model.addAttribute("id","1001");
    return "add_documents";
 	}
	
	@RequestMapping(value={"/insert_documents"}, method = RequestMethod.POST)
	public String insert_document(ModelMap model, Principal principal,DocumentMain documentMain,ExternalDocument externalDocument )
	{
	
	documentControlDAO.insert_document(documentMain,externalDocument);
    model.addAttribute("id","1001");
    return "add_documents";
 	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/addexternaldoc"}, method = RequestMethod.POST)
	public @ResponseBody String insert_external_document(HttpSession session,HttpServletRequest request,ModelMap model, Principal principal)
	{
	
	//temp_list.add(externalDocument);
	String issuer=request.getParameter("issuer");
	String edocument_id=request.getParameter("edocument_id");
	String approver1=request.getParameter("approver1");
	String approver2=request.getParameter("approver2");
	String approver3=request.getParameter("approver3");
	String revision_level=request.getParameter("revision_level");
	String date=request.getParameter("date");
	String comments=request.getParameter("comments");
	String status=request.getParameter("status");
	ExternalDocument externalDocument=new ExternalDocument(edocument_id, issuer, revision_level, date, approver1, approver2, approver3, comments, status);
	List<ExternalDocument> temp_list=new ArrayList<ExternalDocument>();
	
	
	temp_list=(List<ExternalDocument>) session.getAttribute("temp_list");
	temp_list.add(externalDocument);	
	session.setAttribute("temp_list", temp_list);
	String resultHTML="";
	int i=0;
	
	

	resultHTML+="<tr class='title'>"+
		"<td valign='top' align='center' width='15%'>External Document</td>"+
     	"<td valign='top' align='center' width='15%'>Issuer</td>"+
     	"<td valign='top' align='center' width='10%'>Revision Level</td>"+
		"<td valign='top' align='center' width='10%'>Date</td>"+
			"<td valign='top' align='center' width='15%'>Approver1</td>"+
			"<td valign='top' align='center' width='15%'>Approver2</td>"+
			"<td valign='top' align='center' width='15%'>Approver3</td></tr>";
	

	
	for(ExternalDocument externalDoc:temp_list)
	{
		i=i+1;
		if(i%2==0)
	resultHTML+="<tr id='document_list' class='row2'>";
		else
			resultHTML+="<tr id='document_list' class='row1'>";				
	resultHTML+="<td valign='top' align='center'  width='15%'>'"+externalDoc.getEdocument_id()+i+"'</td>"+
	"<td valign='top' align='center'  width='15%'>'"+externalDoc.getIssuer()+"'</td>"+
	"<td valign='top' align='center'  width='10%'>'"+externalDoc.getRevision_level()+"'</td>"+
	"<td valign='top' align='center'  width='10%'>'"+externalDoc.getDate()+"'</td>"+
	"<td valign='top' align='center'  width='15%'>'"+externalDoc.getApprover1()+"'</td>"+
	"<td valign='top' align='center'  width='15%'>'"+externalDoc.getApprover2()+"'</td>"+
	"<td valign='top' align='center'  width='15 %'>'"+externalDoc.getApprover3()+"'</td></tr>";
	
	}
	
	System.out.println(temp_list.get(0).getIssuer());
	System.out.println(issuer);
	System.out.println(date);
    return resultHTML;
 	}
	
}