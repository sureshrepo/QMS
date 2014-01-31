package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import qms.model.DocumentMain;
import qms.model.Employee;
import qms.model.ExternalDocument;
import qms.model.NonConformance;

public class DocumentControlDAO extends AbstractExcelView
{
	private DataSource dataSource;
	 
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

		HSSFSheet excelSheet = workbook.createSheet("Animal List");
		setExcelHeader(excelSheet);
		
		@SuppressWarnings("unchecked")
		List<DocumentMain> documentMains = (List<DocumentMain>) model.get("documentMains");
		String[] fields=(String[])model.get("fields");
		setExcelRows(excelSheet,documentMains,fields);
		
	}
	
	
	public void setExcelHeader(HSSFSheet excelSheet) {
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("ID");
		excelHeader.createCell(1).setCellValue("Name");
		excelHeader.createCell(2).setCellValue("Type");
		excelHeader.createCell(3).setCellValue("Aggressive");
		excelHeader.createCell(4).setCellValue("Weight");
	}
	
	
	//End
	
	
	public void setExcelRows(HSSFSheet excelSheet, List<DocumentMain> documentMains,String[] fields){
		int record = 1;
		for (DocumentMain documentMain:documentMains){	
			HSSFRow excelRow = excelSheet.createRow(record++);
			for(String field:fields)
			{
				if (field.equals("document_id")) 
				{
					excelRow.createCell(0).setCellValue(
							documentMain.getDocument_id());
				}
				else if (field.equals("document_title")) {
					excelRow.createCell(1).setCellValue(
							documentMain.getDocument_title());
				} else if (field.equals("document_type")) {
					excelRow.createCell(2).setCellValue(
							documentMain.getDocument_type());
				} else if (field.equals("media_type")) {
					excelRow.createCell(3).setCellValue(
							documentMain.getMedia_type());
				} else if (field.equals("process")) {
					excelRow.createCell(4).setCellValue(
							documentMain.getProcess());
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
				employees.add(new Employee(resultSet.getString("employee_id"),resultSet.getString("name"), resultSet.getString("job_title"), resultSet.getString("date_hired"), resultSet.getString("attachments"), resultSet.getString("list_of_functions_needes"),resultSet.getString("documented_in"), resultSet.getString("qualified_by"),resultSet.getString("type_of_training"),resultSet.getString("trainer"), resultSet.getString("training_due_date"),resultSet.getString("training_completion_date"),resultSet.getString("training_effectiveness_review_due_date"),resultSet.getString("training_effectiveness_notes")));
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
			  String cmd_update1="update tbl_employee set name='"+employee.getName()+"',job_title='"+employee.getJob_title()+"',date_hired='"+employee.getDate_hired()+"',attachments='"+employee.getAttachments()+"' where employee_id='"+employee.getId()+"'";
			  String cmd_update2="update tbl_employee_desc set list_of_functions_needes='"+employee.getList_of_functions_needes()+"',documented_in='"+employee.getDocumented_in()+"',qualified_by='"+employee.getQualified_by()+"',type_of_training='"+employee.getType_of_training()+"',trainer='"+employee.getTrainer()+"',training_due_date='"+employee.getTraining_due_date()+"',training_completion_date='"+employee.getTraining_completion_date()+"',training_effectiveness_review_due_date='"+employee.getTraining_effectiveness_review_due_date()+"',training_effectiveness_notes='"+employee.getTraining_effectiveness_notes()+"' where employee_id='"+employee.getId()+"'";
			statement.execute(cmd_update1);
			statement.execute(cmd_update2);
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
	
	
	public boolean insert_document(DocumentMain documentMain)
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
			  String cmd_insert1="insert into tbl_doccontrol_main(document_id,document_title,document_type,media_type,location,process,external,attachment_name,attachment_type,attachment_referrence) values('"+documentMain.getDocument_id()+"','"+documentMain.getDocument_title()+"','"+documentMain.getDocument_type()+"','"+documentMain.getMedia_type()+"','"+documentMain.getLocation()+"','"+documentMain.getProcess()+"','"+documentMain.getExternal()+"','"+documentMain.getAttachment_name()+"','"+documentMain.getAttachment_type()+"','"+documentMain.getAttachment_referrence()+"')";
			  statement.execute(cmd_insert1);
			  
			  String cmd_insert2="";	
				 cmd_insert2="insert into tbl_doccontrol_external(document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status) values('"+documentMain.getDocument_id()+"','"+documentMain.getIssuer()+"','"+documentMain.getRevision_level()+"','"+documentMain.getDate()+"','"+documentMain.getApprover1()+"','"+documentMain.getApprover2()+"','"+documentMain.getApprover3()+"','"+documentMain.getComments()+"','"+documentMain.getStatus()+"')";
				 statement.execute(cmd_insert2);
		
			 status=true;
			 
		  }catch(Exception e){
	    	System.out.println(e.toString());
	    	status=false;
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
	
	
	public List<DocumentMain> getDocuments(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	public List<DocumentMain> getDocuments(String id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_id='"+id+"'");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	public List<DocumentMain> getDocuments_bytype(String type){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_doccontrol_main as t1 join tbl_doccontrol_external as t2 on t1.document_id=t2.document_id where document_type='"+type+"'");
			System.out.println("came");
			while(resultSet.next()){
								documentMains.add(new DocumentMain(resultSet.getString("document_id"), resultSet.getString("document_title"), resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"), resultSet.getString("process"), resultSet.getString("issuer"),resultSet.getString("revision_level"),resultSet.getString("date"), resultSet.getString("approver1"),resultSet.getString("approver2"),resultSet.getString("approver3"),resultSet.getString("comments"),resultSet.getString("status"),resultSet.getString("external"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> getDocuments_byExternal(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_doccontrol_main as t1 join tbl_doccontrol_external as t2 on t1.document_id=t2.document_id where external=1");
			System.out.println("came");
			while(resultSet.next()){
								documentMains.add(new DocumentMain(resultSet.getString("document_id"), resultSet.getString("document_title"), resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"), resultSet.getString("process"), resultSet.getString("issuer"),resultSet.getString("revision_level"),resultSet.getString("date"), resultSet.getString("approver1"),resultSet.getString("approver2"),resultSet.getString("approver3"),resultSet.getString("comments"),resultSet.getString("status"),resultSet.getString("external"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
	}
	
	public List<DocumentMain> findDocuments(String search_document_id,String search_document_title,String search_process){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<DocumentMain> documentMains = new ArrayList<DocumentMain>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_doccontrol_main where document_id='"+search_document_id+"' or document_title='"+search_document_title+"' or process='"+search_process+"'");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				documentMains.add(new DocumentMain(resultSet.getString("document_id"),resultSet.getString("document_title"),resultSet.getString("document_type"),resultSet.getString("media_type"),resultSet.getString("location"),resultSet.getString("process"),resultSet.getString("external"), resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence")));
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
	    return documentMains;
		
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