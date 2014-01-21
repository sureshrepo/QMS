package qms.model;


public class DocumentMain
{
	private String document_id;
	
	private String document_title;
	
	private String media_type;
	
	private String location;
	
	private String external;

	public DocumentMain() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DocumentMain(String document_id, String document_title,
			String media_type, String location, String external) {
		super();
		this.document_id = document_id;
		this.document_title = document_title;
		this.media_type = media_type;
		this.location = location;
		this.external = external;
	}

	public String getDocument_id() {
		return document_id;
	}

	public void setEdocument_id(String document_id) {
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