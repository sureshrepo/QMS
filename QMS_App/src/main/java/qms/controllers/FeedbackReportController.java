package qms.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
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

import qms.dao.CustomerFeedbackDAO;
import qms.forms.*;
import qms.model.*;


@Controller
@SessionAttributes({"feedback","fromdate","todate"})
public class FeedbackReportController {

	
	@Autowired
	CustomerFeedbackDAO customerFeedbackDAO;
	
@RequestMapping(value = { "/feedback_report" }, method = RequestMethod.GET)
	
	public String addFeedbackreport(HttpSession session,ModelMap model, Principal principal) {
		
		return "feedback_report";
}





@RequestMapping(value={"/feedback_report"}, method = RequestMethod.POST)
public String view_feedbackreport(HttpSession session,HttpServletRequest request, ModelMap model, Principal principal,CustomerFeedback customerFeedback ) {
	session.setAttribute("feedback", customerFeedback.getType_of_feedback());
	
	String from_date=request.getParameter("from_date");
	session.setAttribute("fromdate", from_date);
	String to_date=request.getParameter("to_date");
	session.setAttribute("todate", to_date);
	System.out.println("from_date"+from_date);
	
	CustomerFeedbackForm customerFeedbackForm=new CustomerFeedbackForm();
	System.out.println("customerfeed"+customerFeedback.getType_of_feedback());
	customerFeedbackForm.setCustomerFeedbacks(customerFeedbackDAO.getfeedback_report(customerFeedback.getType_of_feedback(),from_date,to_date));
	System.out.println("type of report"+customerFeedback.getType_of_feedback());
	model.addAttribute("customerFeedbackForm",customerFeedbackForm);
	return "feedback_report";
}
}


	
