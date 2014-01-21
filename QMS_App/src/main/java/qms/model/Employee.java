package qms.model;

public class Employee
{
	private String id;
	private String name;
	private String job_title;
	private String date_hired;
	private String attachments;
	private String list_of_functions_needes;
	private String documented_in;
	private String qualified_in;
    private String type_of_training;
    private String trainer;
    private String training_due_date;
    private String training_completion_date;
    private String training_effectiveness_review_due_date;
    private String training_effectiveness_notes;
    
	public Employee(String id, String name, String job_title,
			String date_hired, String attachments,
			String list_of_functions_needes, String documented_in,
			String qualified_in, String type_of_training, String trainer,
			String training_due_date, String training_completion_date,
			String training_effectiveness_review_due_date,
			String training_effectiveness_notes) {
		super();
		this.id = id;
		this.name = name;
		this.job_title = job_title;
		this.date_hired = date_hired;
		this.attachments = attachments;
		this.list_of_functions_needes = list_of_functions_needes;
		this.documented_in = documented_in;
		this.qualified_in = qualified_in;
		this.type_of_training = type_of_training;
		this.trainer = trainer;
		this.training_due_date = training_due_date;
		this.training_completion_date = training_completion_date;
		this.training_effectiveness_review_due_date = training_effectiveness_review_due_date;
		this.training_effectiveness_notes = training_effectiveness_notes;
	}
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public String getDate_hired() {
		return date_hired;
	}
	public void setDate_hired(String date_hired) {
		this.date_hired = date_hired;
	}
	public String getAttachments() {
		return attachments;
	}
	public void setAttachments(String attachments) {
		this.attachments = attachments;
	}
	public String getList_of_functions_needes() {
		return list_of_functions_needes;
	}
	public void setList_of_functions_needes(String list_of_functions_needes) {
		this.list_of_functions_needes = list_of_functions_needes;
	}
	public String getDocumented_in() {
		return documented_in;
	}
	public void setDocumented_in(String documented_in) {
		this.documented_in = documented_in;
	}
	public String getQualified_in() {
		return qualified_in;
	}
	public void setQualified_in(String qualified_in) {
		this.qualified_in = qualified_in;
	}
	public String getType_of_training() {
		return type_of_training;
	}
	public void setType_of_training(String type_of_training) {
		this.type_of_training = type_of_training;
	}
	public String getTrainer() {
		return trainer;
	}
	public void setTrainer(String trainer) {
		this.trainer = trainer;
	}
	public String getTraining_due_date() {
		return training_due_date;
	}
	public void setTraining_due_date(String training_due_date) {
		this.training_due_date = training_due_date;
	}
	public String getTraining_completion_date() {
		return training_completion_date;
	}
	public void setTraining_completion_date(String training_completion_date) {
		this.training_completion_date = training_completion_date;
	}
	public String getTraining_effectiveness_review_due_date() {
		return training_effectiveness_review_due_date;
	}
	public void setTraining_effectiveness_review_due_date(
			String training_effectiveness_review_due_date) {
		this.training_effectiveness_review_due_date = training_effectiveness_review_due_date;
	}
	public String getTraining_effectiveness_notes() {
		return training_effectiveness_notes;
	}
	public void setTraining_effectiveness_notes(String training_effectiveness_notes) {
		this.training_effectiveness_notes = training_effectiveness_notes;
	}
    
    
	
}