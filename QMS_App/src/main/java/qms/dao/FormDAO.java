package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import qms.model.DocumentMain;
import qms.model.Form;
import qms.model.InternalAudits;

public class FormDAO {
	private DataSource datasource;

	
	public DataSource getDatasource() {
		return datasource;
	}


	public void setDatasource(DataSource datasource) {
		this.datasource = datasource;
	}


	public String get_formid()
	{
		 Connection con = null;
		 Statement statement = null;
		 ResultSet resultset = null;
		 String Max_id = "F1001";
		 try
		 {
			 con = datasource.getConnection();
			 statement = con.createStatement();
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 try
		 {
			 String cmd_select = "select max(auto_id) as id from tbl_form";
			 resultset = statement.executeQuery(cmd_select);
			 if(resultset.next())
			 {
				 if(!resultset.getString("id").equals("null"))
				 {
					 Max_id = "F" + (Integer.parseInt(resultset.getString("id")) + 1001);
				 }
			 }
			 
		 }
		 catch(Exception e)
		 {
			 System.out.println("max"+e.toString());
			 System.out.println(e.toString());
			 releaseResultSet(resultset);
			 releaseStatement(statement);
			 releaseConnection(con);
		 }
		 finally
		 {
			releaseResultSet(resultset);
			releaseStatement(statement);
			releaseConnection(con);
		 }
		 return Max_id;
	}

	
	public boolean delete_form(String auto_no)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try
		{
			con = datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			String cmd_delete1 = "delete from tbl_form where auto_number ='"+auto_no+"'";
			status = statement.execute(cmd_delete1);
			String cmd_delete2 = "delete from tbl_form_child where auto_no ='"+auto_no+"'";
			status = statement.execute(cmd_delete2);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		finally
		{
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}
	
	public List<Form> getform()
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try
		{
			con = datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		try
		{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no");
			while(resultSet.next())
			{
			form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
			}
		}
			catch(Exception e)
			{
				System.out.println(e.toString());
				releaseResultSet(resultSet);
				releaseStatement(statement);
				releaseConnection(con);
			}
			finally
			{
				releaseResultSet(resultSet);
				releaseStatement(statement);
				releaseConnection(con);
			}
			return form;
		}
	
	
	public boolean update_form(Form form)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try
		{
			con= datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			String cmd_update1 = "update tbl_form set auto_number='"+form.getAuto_number()+"',location='"+form.getLocation()+"',form_or_rec_id='"+form.getForm_or_rec_id()+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+form.getAttachment_name()+"',attachment_type='"+form.getAttachment_type()+"',attachment_referrence='"+form.getAttachment_referrence()+"'";
			statement.execute(cmd_update1);
			String cmd_update2="update tbl_form_child set auto_no='"+form.getAuto_no()+"',effective_date='"+form.getEffective_date()+"',document_id='"+form.getDocument_id()+"',approver1='"+form.getApprover1()+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"'";
		    statement.execute(cmd_update2);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		finally
		{
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}
	
	public boolean insert_form(Form form)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting");
			  String cmd_insert1="insert into tbl_form(auto_number,location,form_or_rec_id,responsibility,form_or_rec_title,process,media_type,retention_time,form,attachment_name,attachment_type,attachment_referrence) values('"+form.getAuto_number()+"','"+form.getLocation()+"','"+form.getForm_or_rec_id()+"','"+form.getResponsibility()+"','"+form.getForm_or_rec_title()+"','"+form.getProcess()+"','"+form.getMedia_type()+"','"+form.getRetention_time()+"','"+form.getForm()+"','"+form.getAttachment_name()+"','"+form.getAttachment_type()+"','"+form.getAttachment_referrence()+"')"; 
			  statement.execute(cmd_insert1);
			  
			  /*String cmd_insert1="insert into tbl_doccontrol_main(document_id,document_title,document_type,media_type,location,process,external,attachment_name,attachment_type,attachment_referrence) values('"+documentMain.getDocument_id()+"','"+documentMain.getDocument_title()+"','"+documentMain.getDocument_type()+"','"+documentMain.getMedia_type()+"','"+documentMain.getLocation()+"','"+documentMain.getProcess()+"','"+documentMain.getExternal()+"','"+documentMain.getAttachment_name()+"','"+documentMain.getAttachment_type()+"','"+documentMain.getAttachment_referrence()+"')";
			  statement.execute(cmd_insert1);*/
			  
			  String cmd_insert2="";	
				 cmd_insert2="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getDocument_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"')";
				 statement.execute(cmd_insert2);
		
			 status=true;
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
	
	
	
	public List<Form> getform(String auto_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
	    	resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no ");
			System.out.println("came");
			while(resultSet.next()){
								form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
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
	    return form;
		
	}
	
	/*public List<Form> getform(String recordtitle,
			String mediatype, String retentiontime) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		try {
			
			String cmd="";
			
			cmd = "select * from tbl_form as t1 join tbl_form_child as t2 on t1.auto_id=t2.auto_id where t1.form_or_rec_title='"+ recordtitle +"' or t1.form_media_type='"+ mediatype +"' or t1.retention_time='"+ retentiontime +"'";
			
			resultSet = statement.executeQuery(cmd);
		while (resultSet.next()) {
			form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
				}
		} catch (Exception e) {
			//logger.info(e.toString());
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return form;

	}*/
	
	public List<Form> search_form(String auto_number,String form_or_rec_id,String document_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("auto_number");
		List<Form> form = new ArrayList<Form>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where t1.auto_number='"+auto_number+"'or t1.form_or_rec_id='"+form_or_rec_id+"' or t2.document_id='"+document_id+"'");

		//	String cmd_select = "select * from tb1_internalaudits";
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
							
								
				form.add(new Form(resultSet
						.getString("auto_number"), resultSet
						.getString("location"), resultSet
						.getString("form_or_rec_id"), resultSet
						.getString("responsibility"), resultSet
						.getString("form_or_rec_title"), resultSet
						.getString("process"), resultSet
						.getString("media_type"), resultSet
						.getString("retention_time"), resultSet
						.getString("form"), resultSet
						.getString("attachment_name"),resultSet
						.getString("attachment_type"), resultSet
						.getString("attachment_referrence"), resultSet
						.getString("auto_no"), resultSet
						.getString("effective_date"), resultSet
						.getString("document_id"), resultSet
						.getString("approver1"), resultSet
						.getString("issuer"), resultSet
						.getString("comments")));
			}

		} catch (Exception e) {
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return form;
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