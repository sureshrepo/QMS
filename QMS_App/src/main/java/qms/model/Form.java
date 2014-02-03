package qms.model;

import org.hibernate.validator.constraints.NotEmpty;

public class Form {
	

	private String form_or_record_id;

	@NotEmpty
	private String form_or_record_title;
	
	@NotEmpty
	private String form_yes_or_no;

	@NotEmpty
	private String form_media_type;

	@NotEmpty
	private String responsibility;

	@NotEmpty
	private String process;
	
	@NotEmpty
	private String retention_time;
	
	@NotEmpty
	private String issuer;
	
	@NotEmpty
	private String effective_date;
	
	@NotEmpty
	private String approver1;
	
	@NotEmpty
	private String comments;

	public String getForm_or_record_id() {
		return form_or_record_id;
	}

	public void setForm_or_record_id(String form_or_record_id) {
		this.form_or_record_id = form_or_record_id;
	}

	public String getForm_or_record_title() {
		return form_or_record_title;
	}

	public void setForm_or_record_title(String form_or_record_title) {
		this.form_or_record_title = form_or_record_title;
	}

	public String getForm_yes_or_no() {
		return form_yes_or_no;
	}

	public void setForm_yes_or_no(String form_yes_or_no) {
		this.form_yes_or_no = form_yes_or_no;
	}

	public String getForm_media_type() {
		return form_media_type;
	}

	public void setForm_media_type(String form_media_type) {
		this.form_media_type = form_media_type;
	}

	public String getResponsibility() {
		return responsibility;
	}

	public void setResponsibility(String responsibility) {
		this.responsibility = responsibility;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public String getRetention_time() {
		return retention_time;
	}

	public void setRetention_time(String retention_time) {
		this.retention_time = retention_time;
	}

	public String getIssuer() {
		return issuer;
	}

	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}

	public String getEffective_date() {
		return effective_date;
	}

	public void setEffective_date(String effective_date) {
		this.effective_date = effective_date;
	}

	public String getApprover1() {
		return approver1;
	}

	public void setApprover1(String approver1) {
		this.approver1 = approver1;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Form(String form_or_record_id, String form_or_record_title,
			String form_yes_or_no, String form_media_type,
			String responsibility, String process, String retention_time,
			String issuer, String effective_date, String approver1,
			String comments) {
		super();
		this.form_or_record_id = form_or_record_id;
		this.form_or_record_title = form_or_record_title;
		this.form_yes_or_no = form_yes_or_no;
		this.form_media_type = form_media_type;
		this.responsibility = responsibility;
		this.process = process;
		this.retention_time = retention_time;
		this.issuer = issuer;
		this.effective_date = effective_date;
		this.approver1 = approver1;
		this.comments = comments;
	}

	public Form() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
