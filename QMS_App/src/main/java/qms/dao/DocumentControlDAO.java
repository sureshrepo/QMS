package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.DocumentMain;
import qms.model.Employee;
import qms.model.ExternalDocument;

public class DocumentControlDAO
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
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
	
	
	public boolean insert_document(DocumentMain documentMain,ExternalDocument externalDocument)
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
			  String cmd_insert1="insert into tbl_doccontrol_main(document_id,document_title,media_type,location,external) values('"+documentMain.getDocument_id()+"','"+documentMain.getDocument_title()+"','"+documentMain.getMedia_type()+"','"+documentMain.getLocation()+"','"+documentMain.getExternal()+"')";
			  String cmd_insert2="insert into tbl_doccontrol_external(document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status) values('"+externalDocument.getEdocument_id()+"','"+externalDocument.getIssuer()+"','"+externalDocument.getRevision_level()+"','"+externalDocument.getDate()+"','"+externalDocument.getApprover1()+"','"+externalDocument.getApprover2()+"','"+externalDocument.getApprover3()+"','"+externalDocument.getComments()+"','"+externalDocument.getStatus()+"')";
			  statement.execute(cmd_insert1);
			  statement.execute(cmd_insert2);
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
	
	/*public boolean insert_external_document(DocumentMain documentMain,ExternalDocument externalDocument)
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
			  String cmd_insert1="insert into tbl_doccontrol_main(document_id,document_title,media_type,location,external) values('"+documentMain.getDocument_id()+"','"+documentMain.getDocument_title()+"','"+documentMain.getMedia_type()+"','"+documentMain.getLocation()+"','"+documentMain.getExternal()+"')";
			  String cmd_insert2="insert into tbl_doccontrol_external(document_id,issuer,revision_level,date,approver1,approver2,approver3,comments,status) values('"+externalDocument.getEdocument_id()+"','"+externalDocument.getIssuer()+"','"+externalDocument.getRevision_level()+"','"+externalDocument.getDate()+"','"+externalDocument.getApprover1()+"','"+externalDocument.getApprover2()+"','"+externalDocument.getApprover3()+"','"+externalDocument.getComments()+"','"+externalDocument.getStatus()+"')";
			  statement.execute(cmd_insert1);
			  statement.execute(cmd_insert2);
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
	
	*/
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
			System.out.println("came");
			while(resultSet.next()){
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