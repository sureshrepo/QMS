package qms.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class DocumentMain
{

	private String document_id;
	
	
	private String document_type_id;
	
	public String getDocument_type_id() {
		return document_type_id;
	}

	public void setDocument_type_id(String document_type_id) {
		this.document_type_id = document_type_id;
	}

	public DocumentMain(String document_id, String document_title,
			String document_type, String media_type, String location,
			String external, String attachment_name, String attachment_type,
			String attachment_referrence) {
		super();
		this.document_id = document_id;
		this.document_title = document_title;
		this.document_type = document_type;
		this.media_type = media_type;
		this.location = location;
		this.external = external;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
	}

	@NotEmpty
	private String document_title;
	
	@NotEmpty
	private String document_type;
	
	@NotEmpty
	private String media_type;
	
	@NotEmpty
	private String location;
	
	@NotEmpty
	private String process;
	
	@NotEmpty
	private String issuer;
	
	@NotEmpty
	private String revision_level;
	
	@NotEmpty
	private String date;
	
	@NotEmpty
	private String approver1;
	
	@NotEmpty
	private String approver2;
	
	@NotEmpty
	private String approver3;
	
	@NotEmpty
	private String comments;
	
	@NotEmpty
	private String status;

	
	public DocumentMain(String document_id, String document_title,
			String document_type, String media_type, String location,
			String process, String issuer, String revision_level, String date,
			String approver1, String approver2, String approver3,
			String comments, String status, String external,
			String attachment_name, String attachment_type,
			String attachment_referrence) {
		super();
		this.document_id = document_id;
		this.document_title = document_title;
		this.document_type = document_type;
		this.media_type = media_type;
		this.location = location;
		this.process = process;
		this.issuer = issuer;
		this.revision_level = revision_level;
		this.date = date;
		this.approver1 = approver1;
		this.approver2 = approver2;
		this.approver3 = approver3;
		this.comments = comments;
		this.status = status;
		this.external = external;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
	}

	public String getIssuer() {
		return issuer;
	}

	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}

	public String getRevision_level() {
		return revision_level;
	}

	public void setRevision_level(String revision_level) {
		this.revision_level = revision_level;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getApprover1() {
		return approver1;
	}

	public void setApprover1(String approver1) {
		this.approver1 = approver1;
	}

	public String getApprover2() {
		return approver2;
	}

	public void setApprover2(String approver2) {
		this.approver2 = approver2;
	}

	public String getApprover3() {
		return approver3;
	}

	public void setApprover3(String approver3) {
		this.approver3 = approver3;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public DocumentMain(String document_id, String document_title,
			String document_type, String media_type, String location,
			String process, String external, String attachment_name,
			String attachment_type, String attachment_referrence) {
		super();
		this.document_id = document_id;
		this.document_title = document_title;
		this.document_type = document_type;
		this.media_type = media_type;
		this.location = location;
		this.process = process;
		this.external = external;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	private String external;
	
	public String getDocument_type() {
		return document_type;
	}

	public void setDocument_type(String document_type) {
		this.document_type = document_type;
	}

	public String getAttachment_name() {
		return attachment_name;
	}

	public void setAttachment_name(String attachment_name) {
		this.attachment_name = attachment_name;
	}

	public String getAttachment_type() {
		return attachment_type;
	}

	public void setAttachment_type(String attachment_type) {
		this.attachment_type = attachment_type;
	}

	public String getAttachment_referrence() {
		return attachment_referrence;
	}

	public void setAttachment_referrence(String attachment_referrence) {
		this.attachment_referrence = attachment_referrence;
	}

	private CommonsMultipartFile attachments;
	
	private String attachment_name;	
	private String attachment_type;
	
	



	private String attachment_referrence;

	public CommonsMultipartFile getAttachments() {
		return attachments;
	}

	public void setAttachments(CommonsMultipartFile attachments) {
		this.attachments = attachments;
	}

	public DocumentMain() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public String getDocument_id() {
		return document_id;
	}

	public void setDocument_id(String document_id) {
		this.document_id = document_id;
	}

	public String getDocument_title() {
		return document_title;
	}

	public void setDocument_title(String document_title) {
		this.document_title = document_title;
	}

	public String getMedia_type() {
		return media_type;
	}

	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getExternal() {
		return external;
	}

	public void setExternal(String external) {
		this.external = external;
	}
	
	
	
	
}