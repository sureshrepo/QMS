package qms.model;


import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class Maintenance
{
	
	private String auto_equip;
	
	@NotEmpty
	private String equipment_id;
	@NotEmpty
	private String equipment_name;
	@NotEmpty
	private String equipment_model;
	@NotEmpty
	private String serial_number;
	@NotEmpty
	private String date_acquired;

	private String equipment_status;
	
	private String frequency_maintenance;

	private String calibration;
	
	private String equipmentid;
	
	private String type_of_maintenance;
	@NotEmpty
	private String maintenance_frequency;
	@NotEmpty
	private String reference; 
	@NotEmpty
	private String instructions;
	@NotEmpty
	private String due_date;
	@NotEmpty
	private String completion_date;
	@NotEmpty
	private String completed_by;
	@NotEmpty
	private String notes;
	@NotEmpty
	public Maintenance() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Maintenance(String auto_equip,String equipment_id, String equipment_name,
			String equipment_model, String serial_number, String date_acquired,
			String equipment_status, String frequency_maintenance,
			String calibration, String equipmentid, String type_of_maintenance,
			String maintenance_frequency, String reference,
			String instructions, String due_date, String completion_date,
			String completed_by, String notes) {
		super();
		this.auto_equip=auto_equip;
		this.equipment_id = equipment_id;
		this.equipment_name = equipment_name;
		this.equipment_model = equipment_model;
		this.serial_number = serial_number;
		this.date_acquired = date_acquired;
		this.equipment_status = equipment_status;
		this.frequency_maintenance = frequency_maintenance;
		this.calibration = calibration;
		this.equipmentid = equipmentid;
		this.type_of_maintenance = type_of_maintenance;
		this.maintenance_frequency = maintenance_frequency;
		this.reference = reference;
		this.instructions = instructions;
		this.due_date = due_date;
		this.completion_date = completion_date;
		this.completed_by = completed_by;
		this.notes = notes;
	}

	
	public String getAuto_equip() {
		return auto_equip;
	}

	public void setAuto_equip(String auto_equip) {
		this.auto_equip = auto_equip;
	}

	public String getEquipment_id() {
		return equipment_id;
	}

	public void setEquipment_id(String equipment_id) {
		this.equipment_id = equipment_id;
	}

	public String getEquipment_name() {
		return equipment_name;
	}

	public void setEquipment_name(String equipment_name) {
		this.equipment_name = equipment_name;
	}

	public String getEquipment_model() {
		return equipment_model;
	}

	public void setEquipment_model(String equipment_model) {
		this.equipment_model = equipment_model;
	}

	public String getSerial_number() {
		return serial_number;
	}

	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}

	public String getDate_acquired() {
		return date_acquired;
	}

	public void setDate_acquired(String date_acquired) {
		this.date_acquired = date_acquired;
	}

	public String getEquipment_status() {
		return equipment_status;
	}

	public void setEquipment_status(String equipment_status) {
		this.equipment_status = equipment_status;
	}

	public String getFrequency_maintenance() {
		return frequency_maintenance;
	}

	public void setFrequency_maintenance(String frequency_maintenance) {
		this.frequency_maintenance = frequency_maintenance;
	}

	public String getCalibration() {
		return calibration;
	}

	public void setCalibration(String calibration) {
		this.calibration = calibration;
	}

	public String getEquipmentid() {
		return equipmentid;
	}

	public void setEquipmentid(String equipmentid) {
		this.equipmentid = equipmentid;
	}

	public String getType_of_maintenance() {
		return type_of_maintenance;
	}

	public void setType_of_maintenance(String type_of_maintenance) {
		this.type_of_maintenance = type_of_maintenance;
	}

	public String getMaintenance_frequency() {
		return maintenance_frequency;
	}

	public void setMaintenance_frequency(String maintenance_frequency) {
		this.maintenance_frequency = maintenance_frequency;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public String getDue_date() {
		return due_date;
	}

	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	public String getCompletion_date() {
		return completion_date;
	}

	public void setCompletion_date(String completion_date) {
		this.completion_date = completion_date;
	}

	public String getCompleted_by() {
		return completed_by;
	}

	public void setCompleted_by(String completed_by) {
		this.completed_by = completed_by;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}	
	
	
}