package qms.model;

public class NonConformance
{
private String id;
private String source_of_nonconformance;
private String external_id;
private String type_of_nonconformance;
private String product_id;
private String quantity_suspect;
private String nature_of_nonconformance;
private String date_found;
private String reported_by;
private String temporary_action;
private String corrective_action_required;
private String disposition_required;
private String disposition;
private String disposition_complete_date;
private String name_of_disposition_responsibility;
private String cost_of_nonconformance;
public NonConformance() {
	super();
	// TODO Auto-generated constructor stub
}
public NonConformance(String id, String source_of_nonconformance,
		String external_id, String type_of_nonconformance, String product_id,
		String quantity_suspect, String nature_of_nonconformance,
		String date_found, String reported_by, String temporary_action,
		String corrective_action_required, String disposition_required,
		String disposition, String disposition_complete_date,
		String name_of_disposition_responsibility, String cost_of_nonconformance) {
	super();
	this.id = id;
	this.source_of_nonconformance = source_of_nonconformance;
	this.external_id = external_id;
	this.type_of_nonconformance = type_of_nonconformance;
	this.product_id = product_id;
	this.quantity_suspect = quantity_suspect;
	this.nature_of_nonconformance = nature_of_nonconformance;
	this.date_found = date_found;
	this.reported_by = reported_by;
	this.temporary_action = temporary_action;
	this.corrective_action_required = corrective_action_required;
	this.disposition_required = disposition_required;
	this.disposition = disposition;
	this.disposition_complete_date = disposition_complete_date;
	this.name_of_disposition_responsibility = name_of_disposition_responsibility;
	this.cost_of_nonconformance = cost_of_nonconformance;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getSource_of_nonconformance() {
	return source_of_nonconformance;
}
public void setSource_of_nonconformance(String source_of_nonconformance) {
	this.source_of_nonconformance = source_of_nonconformance;
}
public String getExternal_id() {
	return external_id;
}
public void setExternal_id(String external_id) {
	this.external_id = external_id;
}
public String getType_of_nonconformance() {
	return type_of_nonconformance;
}
public void setType_of_nonconformance(String type_of_nonconformance) {
	this.type_of_nonconformance = type_of_nonconformance;
}
public String getProduct_id() {
	return product_id;
}
public void setProduct_id(String product_id) {
	this.product_id = product_id;
}
public String getQuantity_suspect() {
	return quantity_suspect;
}
public void setQuantity_suspect(String quantity_suspect) {
	this.quantity_suspect = quantity_suspect;
}
public String getNature_of_nonconformance() {
	return nature_of_nonconformance;
}
public void setNature_of_nonconformance(String nature_of_nonconformance) {
	this.nature_of_nonconformance = nature_of_nonconformance;
}
public String getDate_found() {
	return date_found;
}
public void setDate_found(String date_found) {
	this.date_found = date_found;
}
public String getReported_by() {
	return reported_by;
}
public void setReported_by(String reported_by) {
	this.reported_by = reported_by;
}
public String getTemporary_action() {
	return temporary_action;
}
public void setTemporary_action(String temporary_action) {
	this.temporary_action = temporary_action;
}
public String getCorrective_action_required() {
	return corrective_action_required;
}
public void setCorrective_action_required(String corrective_action_required) {
	this.corrective_action_required = corrective_action_required;
}
public String getDisposition_required() {
	return disposition_required;
}
public void setDisposition_required(String disposition_required) {
	this.disposition_required = disposition_required;
}
public String getDisposition() {
	return disposition;
}
public void setDisposition(String disposition) {
	this.disposition = disposition;
}
public String getDisposition_complete_date() {
	return disposition_complete_date;
}
public void setDisposition_complete_date(String disposition_complete_date) {
	this.disposition_complete_date = disposition_complete_date;
}
public String getName_of_disposition_responsibility() {
	return name_of_disposition_responsibility;
}
public void setName_of_disposition_responsibility(
		String name_of_disposition_responsibility) {
	this.name_of_disposition_responsibility = name_of_disposition_responsibility;
}
public String getCost_of_nonconformance() {
	return cost_of_nonconformance;
}
public void setCost_of_nonconformance(String cost_of_nonconformance) {
	this.cost_of_nonconformance = cost_of_nonconformance;
}

	
	
}