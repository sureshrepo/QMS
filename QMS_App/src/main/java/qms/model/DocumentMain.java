package qms.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class DocumentMain
{
	private String document_id;
	
	private String document_title;
	
	private String media_type;
	
	private String location;
	
	private String external;
	
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
	
	public DocumentMain(String document_id, String document_title,
			String media_type, String location, String external,
			String attachment_name, String attachment_type,
			String attachment_referrence) {
		super();
		this.document_id = document_id;
		this.document_title = document_title;
		this.media_type = media_type;
		this.location = location;
		this.external = external;
		this.attachment_name = attachment_name;
		this.attachment_type = attachment_type;
		this.attachment_referrence = attachment_referrence;
	}

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