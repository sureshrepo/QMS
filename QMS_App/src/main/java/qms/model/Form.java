package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class Form {
	

	private String auto_number;

	@NotEmpty
	private String location;
	
	@NotEmpty
	private String form_or_rec_id;

	@NotEmpty
	private String responsibility;

	@NotEmpty
	private String form_or_rec_title;

	@NotEmpty
	private String process;
	
	@NotEmpty
	private String media_type;
	
	@NotEmpty
	private String retention_time;
	
	@NotEmpty
	private String form;
	
	@NotEmpty
	private String auto_no;
	
	@NotEmpty
	private String effective_date;
	
	@NotEmpty
	private String document_id;
	
	@NotEmpty
	private String approver1;
	
	@NotEmpty
	private String issuer;
	
	@NotEmpty
	private String comments;

	

	
	public Form() {
		super();
		// TODO Auto-generated constructor stub
	}




	public Form(String auto_number, String location, String form_or_rec_id,
			String responsibility, String form_or_rec_title, String process,
			String media_type, String retention_time, String form,
			String auto_no, String effective_date, String document_id,
			String approver1, String issuer, String comments) {
		super();
		this.auto_number = auto_number;
		this.location = location;
		this.form_or_rec_id = form_or_rec_id;
		this.responsibility = responsibility;
		this.form_or_rec_title = form_or_rec_title;
		this.process = process;
		this.media_type = media_type;
		this.retention_time = retention_time;
		this.form = form;
		this.auto_no = auto_no;
		this.effective_date = effective_date;
		this.document_id = document_id;
		this.approver1 = approver1;
		this.issuer = issuer;
		this.comments = comments;
	}




	public String getAuto_number() {
		return auto_number;
	}




	public void setAuto_number(String auto_number) {
		this.auto_number = auto_number;
	}




	public String getLocation() {
		return location;
	}




	public void setLocation(String location) {
		this.location = location;
	}




	public String getForm_or_rec_id() {
		return form_or_rec_id;
	}




	public void setForm_or_rec_id(String form_or_rec_id) {
		this.form_or_rec_id = form_or_rec_id;
	}




	public String getResponsibility() {
		return responsibility;
	}




	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}




	public String getForm_or_rec_title() {
		return form_or_rec_title;
	}




	public void setForm_or_rec_title(String form_or_rec_title) {
		this.form_or_rec_title = form_or_rec_title;
	}




	public String getProcess() {
		return process;
	}




	public void setProcess(String process) {
		this.process = process;
	}




	public String getMedia_type() {
		return media_type;
	}




	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}




	public String getRetention_time() {
		return retention_time;
	}




	public void setRetention_time(String retention_time) {
		this.retention_time = retention_time;
	}




	public String getForm() {
		return form;
	}




	public void setForm(String form) {
		this.form = form;
	}




	public String getAuto_no() {
		return auto_no;
	}




	public void setAuto_no(String auto_no) {
		this.auto_no = auto_no;
	}




	public String getEffective_date() {
		return effective_date;
	}




	public void setEffective_date(String effective_date) {
		this.effective_date = effective_date;
	}




	public String getDocument_id() {
		return document_id;
	}




	public void setDocument_id(String document_id) {
		this.document_id = document_id;
	}




	public String getApprover1() {
		return approver1;
	}




	public void setApprover1(String approver1) {
		this.approver1 = approver1;
	}




	public String getIssuer() {
		return issuer;
	}




	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}




	public String getComments() {
		return comments;
	}




	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
	
}
