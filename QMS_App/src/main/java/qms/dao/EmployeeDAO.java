package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import qms.model.Employee;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;
import qms.model.Employee;



public class EmployeeDAO extends AbstractExcelView{
	private DataSource dataSource;
	 
	
	public DataSource getDataSource() {
		return dataSource;
	}


	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
			
		/**
		 * Excel Sheet Generation
		 */
		
		@Override
		protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
				HttpServletRequest request, HttpServletResponse response)
				throws Exception {

			HSSFSheet excelSheet = workbook.createSheet("Employee Report");
			excelSheet.setDefaultColumnWidth(20);
			  
			//Style 1
			CellStyle style = workbook.createCellStyle();
		        Font font = workbook.createFont();
		        font.setFontName("Arial");
		        style.setFillForegroundColor(HSSFColor.BROWN.index);
		        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		        style.setWrapText(true);
		        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		        font.setColor(HSSFColor.WHITE.index);
		        style.setFont(font);
			
		    //Style2
		        CellStyle style2 = workbook.createCellStyle();
		        Font font2 = workbook.createFont();
		        font2.setFontName("Arial");
		        style2.setFillForegroundColor(HSSFColor.YELLOW.index);
		        style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
		        style2.setWrapText(true);
		        font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		        font2.setColor(HSSFColor.WHITE.index);
		        style2.setFont(font2); 
			
			@SuppressWarnings("unchecked")
			List<Employee> employees = (List<Employee>) model.get("employees");
			String[] fields=(String[])model.get("fields");
			

	        setExcelHeader(excelSheet,style,fields);
			
			setExcelRows(excelSheet,employees,fields,style2);
			
		}
		
		
		public void setExcelHeader(HSSFSheet excelSheet,CellStyle style,String[] fields) {
			HSSFRow excelHeader = excelSheet.createRow(0);	
		//	String[] fields={"document_id","document_title","document_type","media_type","location","process","external","issuer","revision_level","date","approver1","approver2","approver3","status","comments"};
			int i=0;
			for (String field : fields) {
				
				if(field.equals("employee_id"))
				{
					excelHeader.createCell(i).setCellValue("ID");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
				else if(field.equals("name"))	
				{
					excelHeader.createCell(i).setCellValue("Name");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
				else if(field.equals("job_title"))	
				{
					excelHeader.createCell(i).setCellValue("Job Title");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
				else if(field.equals("date_hired"))	
				{
					excelHeader.createCell(i).setCellValue("Date Hired");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
				else if(field.equals("attachments"))	
				{
					excelHeader.createCell(i).setCellValue("Attachments");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
				
				else if(field.equals("list_of_functions_needes"))
				{
					excelHeader.createCell(i).setCellValue("List Of Function Needes");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
				else if(field.equals("qualified_by"))
				{
					excelHeader.createCell(i).setCellValue("Qualified By");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}
				else if(field.equals("type_of_training"))	
				{
					excelHeader.createCell(i).setCellValue("Type of Training");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}else if(field.equals("trainer"))	
				{
					excelHeader.createCell(i).setCellValue("Trainer");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}else if(field.equals("training_due_date"))	
				{
					excelHeader.createCell(i).setCellValue("Training Due Date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}else if(field.equals("training_completion_date"))
				{
					excelHeader.createCell(i).setCellValue("Training Completion Date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}else if(field.equals("training_effectiveness_review_due_date"))	
				{
					excelHeader.createCell(i).setCellValue("Training Effectiveness Review Due Date");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}else if(field.equals("training_effectiveness_notes"))	
				{
					excelHeader.createCell(i).setCellValue("Effectiveness Notes");
					excelHeader.getCell(i).setCellStyle(style);
					i++;
				}		
			}
		
		}
		
		
		//End
		
		
		public void setExcelRows(HSSFSheet excelSheet, List<Employee> employees,String[] fields,CellStyle style2){
			int record = 1;
			int i=0;
			for (Employee employee:employees){	
				HSSFRow excelRow = excelSheet.createRow(record++);
		//		excelRow.setRowStyle((HSSFCellStyle) style2);
			i=0;
					for (String field : fields) {
						
						if(field.equals("employee_id"))
						{
							excelRow.createCell(i).setCellValue(
									employee.getEmployee_id());
								i++;
						}
						else if(field.equals("name"))
						{
							excelRow.createCell(i).setCellValue(
									employee.getName());

							i++;
						}
						else if(field.equals("job_title"))
						{
							excelRow.createCell(i).setCellValue(
									employee.getJob_title()
									);	i++;
						}
						else if(field.equals("date_hired"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getDate_hired());
							i++;
						}else if(field.equals("attachments"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getAttachments());
							i++;
						}
						else if(field.equals("process"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getProcess());
							i++;
						}
						else if(field.equals("process_name"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getProcess_name());
							i++;
						}
						else if(field.equals("doc_control"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getDoc_control());
							i++;
						}
						else if(field.equals("management_rep"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getManagement_rep());
							i++;
						}
						
						else if(field.equals("list_of_functions_needes"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getList_of_functions_needes());
							i++;
						}else if(field.equals("documented_in"))
						{
							excelRow.createCell(i).setCellValue(
									employee.getDocumented_in());
							i++;
						}else if(field.equals("qualified_by"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getQualified_by());
							i++;
						}else if(field.equals("type_of_training"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getType_of_training());
							i++;
						}else if(field.equals("trainer"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getTrainer());
							i++;
						}else if(field.equals("training_due_date"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getTraining_due_date());
							i++;
						}else if(field.equals("training_completion_date"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getTraining_completion_date());
							i++;
						}else if(field.equals("training_effectiveness_review_due_date"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getTraining_effectiveness_review_due_date());
							i++;
						}else if(field.equals("training_effectiveness_notes"))	
						{
							excelRow.createCell(i).setCellValue(
									employee.getTraining_effectiveness_notes());
							i++;
						}	
					}					
					
			}
		}


	
	public String getMax_employeeID(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Maxid="EMP1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_select="select max(auto_id) as id from tbl_employee";
			resultSet = statement.executeQuery(cmd_select);
			if(resultSet.next())
			{
				if(!resultSet.getString("id").equals("null"))
				{
					Maxid="EMP"+(Integer.parseInt(resultSet.getString("id"))+1001);
				}
			}
	    }catch(Exception e){
	    	System.out.println("max"+e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return Maxid;
		
	}
	
	
	public boolean delete_employee(String employee_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_delete1="delete from tbl_employee where employee_id='"+employee_id+"'";
			  String cmd_delete2="delete from tbl_employee_desc where employee_id='"+employee_id+"'";
				 
			  status=statement.execute(cmd_delete1);
			  status=statement.execute(cmd_delete2);
				 
			
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return status;
		
	}
	
	public List<Employee> getEmployeess_byid(String employee_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.employee_id='"+employee_id+"'");
			while(resultSet.next())
			{
				System.out.println("count");
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				//				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
		    }
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return employees;
		
	}
	

	public boolean update_employee(Employee employee)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_update1="update tbl_employee set name='"+employee.getName()+"',job_title='"+employee.getJob_title()+"',date_hired='"+employee.getDate_hired()+"',attachments='"+employee.getAttachments()+"',process='"+employee.getProcess()+"',process_name='"+employee.getProcess_name()+"',doc_control='"+employee.getDoc_control()+"',management_rep='"+employee.getManagement_rep()+"' where employee_id='"+employee.getEmployee_id()+"'";
			  System.out.println("query problem");
			  String cmd_update2="update tbl_employee_desc set list_of_functions_needes='"+employee.getList_of_functions_needes()+"',documented_in='"+employee.getDocumented_in()+"',qualified_by='"+employee.getQualified_by()+"',type_of_training='"+employee.getType_of_training()+"',trainer='"+employee.getTrainer()+"',training_due_date='"+employee.getTraining_due_date()+"',training_completion_date='"+employee.getTraining_completion_date()+"',training_effectiveness_review_due_date='"+employee.getTraining_effectiveness_review_due_date()+"',training_effectiveness_notes='"+employee.getTraining_effectiveness_notes()+"' where employee_id='"+employee.getEmployee_id()+"'";
			System.out.println("query problem2");
			  statement.execute(cmd_update1);
			statement.execute(cmd_update2);
		  }catch(Exception e){
	    	System.out.println("update error"+e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return status;
	}
	
	
	public boolean insert_employee(Employee employee)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			 // String cmd_insert1="insert into tbl_employee(employee_id,name,job_title,date_hired,attachments,process,process_name,doc_control,management_rep) values('"+employee.getEmployee_id()+"','"+employee.getName()+"','"+employee.getJob_title()+"','"+employee.getDate_hired()+"','"+employee.getAttachments()+"','"+employee.getProcess()+"','"+employee.getProcess_name()+"','"+employee.getDoc_control()+"','"+employee.getManagement_rep()+"')";
			  String cmd_insert1="insert into tbl_employee(employee_id,name,job_title,date_hired,attachments,process,process_name,doc_control,management_rep) values('"+employee.getEmployee_id()+"','"+employee.getName()+"','"+employee.getJob_title()+"','"+employee.getDate_hired()+"','"+employee.getAttachments()+"','"+employee.getProcess()+"','"+employee.getProcess_name()+"','"+employee.getDoc_control()+"','"+employee.getManagement_rep()+"')";
			  String cmd_insert2="insert into tbl_employee_desc(employee_id,list_of_functions_needes,documented_in,qualified_by,type_of_training,trainer,training_due_date,training_completion_date,training_effectiveness_review_due_date,training_effectiveness_notes) values('"+employee.getEmployee_id()+"','"+employee.getList_of_functions_needes()+"','"+employee.getDocumented_in()+"','"+employee.getQualified_by()+"','"+employee.getType_of_training()+"','"+employee.getTrainer()+"','"+employee.getTraining_due_date()+"','"+employee.getTraining_completion_date()+"','"+employee.getTraining_effectiveness_review_due_date()+"','"+employee.getTraining_effectiveness_notes()+"')";
			  statement.execute(cmd_insert1);
			  statement.execute(cmd_insert2);
			  
			  if(employee.getProcess().equals("yes"))
			  {
				  String cmd_insert_process="insert into tbl_process(process_id,process_name,process_owner) values('"+employee.getProcess()+"','"+employee.getProcess_name()+"','"+employee.getName()+"')";
				  statement.execute(cmd_insert_process);
			  }
			  
		  }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
		    return status;
	}
	
	public List<Employee> filterEmployees(String filter){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
	    	String cmd="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.name like '"+filter+"%'";
			resultSet = statement.executeQuery(cmd);
			System.out.println(cmd);
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
			//	employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return employees;
		
	}
		
	
	public List<Employee> getEmployees(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id;");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
//				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return employees;
		
	}
	
	
	public List<Employee> getEmployees_by_doc_control(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where t1.doc_control='yes';");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("doc_employee");
			//	employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return employees;
		
	}
	public List<Employee> getEmployees_by_management_rep(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where management_rep='yes';");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return employees;
		
	}
	
	
	public List<Employee> getEmployee_bytype(String type){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
	    	String cmd_select="null";
	    	if(type=="trainingneeds")
				cmd_select= "select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where type_of_training='"+type+"'";
			//cmd_select= "select * from tbl_nonconformance where disposition==0 AND disposition_complete_date==NULL" ;
			
/*				else if(type=="training_reports_for_each_employee")
				//	cmd_select="select * from tbl_nonconformance where disposition_complete_date between now() and DATE_ADDNOW(), INTERVAL 30 DAYS";
					cmd_select="select * from tbl_employee_desc ";
					else if(type=="qualification_for_each_employee")
						cmd_select="select * from tbl_employee_desc";
*/					else if(type=="opentraining")
						cmd_select="select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where type_of_training='"+type+"'";
/*					else if(type=="opentrainingeffectiveness")
						cmd_select="select * from tbl_employee_desc";
					else if(type=="past_due_training_by_trainer")
						cmd_select="select * from tbl_employee_desc";
*/				resultSet = statement.executeQuery(cmd_select);
			
				
	    	
	    //	resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where type_of_training='"+type+"'");
			System.out.println("came");
			while(resultSet.next()){
//				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));

			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return employees;		
	}

	
	public List<Employee> findEmployees(String type,String qualifiedby,String trainer){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Employee> employees = new ArrayList<Employee>();
	    try{
	    	String cmd="";
			cmd = "select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where type_of_training='"+type+"' or qualified_by='"+qualifiedby+"' or trainer='"+trainer+"'";
			//cmd = "select * from tbl_employee_desc where type_of_training='"+type+"' or qualified_by='"+qualifiedby+"' or trainer='"+trainer+"'";
			
			resultSet = statement.executeQuery(cmd);
//	    	resultSet = statement.executeQuery("select * from tbl_employee as t1 join tbl_employee_desc as t2 on t1.employee_id=t2.employee_id where employee_id='"+id+"' or type_of_training='"+type+"' or qualified_by='"+qualifiedby+"'");
			//System.out.println("came");
			while(resultSet.next()){
				System.out.println("inside the search operation in database");
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("process"), resultSet.getString("process_name"), resultSet.getString("doc_control"), resultSet.getString("management_rep"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
			System.out.println("searching.....");
			}
	    }catch(Exception e){
	    	System.out.println(e.toString());
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);
	    }finally{
	    	releaseResultSet(resultSet);
	    	releaseStatement(statement);
	    	releaseConnection(con);	    	
	    }
	    return employees;
		
	}
	
	
	
	public void releaseConnection(Connection con){
		try{if(con != null)
			con.close();
		}catch(Exception e){}
	}
	public void releaseResultSet(ResultSet rs){
		try{if(rs != null)
			rs.close();
	}catch(Exception e){}
	}
	public void releaseStatement(Statement stmt){
		try{if(stmt != null)
			stmt.close();
	}catch(Exception e){}
	}

}
