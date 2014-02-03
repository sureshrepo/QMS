package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import qms.model.Form;

public class FormDAO {
	private DataSource datasource;

	
	public DataSource getDatasource() {
		return datasource;
	}


	public void setDatasource(DataSource datasource) {
		this.datasource = datasource;
	}


	public String get_maxid()
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
			 String cmd_select = "select max(auto_id) as auto_id from tbl_form";
			 resultset = statement.executeQuery(cmd_select);
			 if(resultset.next())
			 {
				 if(!resultset.getString("auto_id").equals("null"))
				 {
					 Max_id = "F" + (Integer.parseInt(resultset.getString("auto_id")) + 1000 + 1);
				 }
			 }
			 
		 }
		 catch(Exception e)
		 {
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

	
	public boolean delete_form(String form_or_record_id)
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
			String cmd_delete = "delete from tbl_form where form_or_record_id ='"+form_or_record_id+"'";
			status = statement.execute(cmd_delete);
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
	
	public List<Form> getform_byid(String form_or_record_id)
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
			resultSet = statement.executeQuery("select * from tbl_form where form_or_record_id = '"+form_or_record_id+"'");
			while(resultSet.next())
			{
			form.add(new Form(resultSet.getString("form_or_record_id"),resultSet.getString("form_or_record_title"),resultSet.getString("form_yes_or_no"),resultSet.getString("form_media_type"),resultSet.getString("responsibility"),resultSet.getString("process"),resultSet.getString("retention_time"),resultSet.getString("issuer"),resultSet.getString("effective_date"),resultSet.getString("approver1"),resultSet.getString("comments")));
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
			String cmd_insert = "update tbl_form set form_or_record_id='"+form.getForm_or_record_id()+"',form_or_record_title='"+form.getForm_or_record_title()+"',form_yes_or_no='"+form.getForm_yes_or_no()+"',form_media_type='"+form.getForm_media_type()+"',responsibility='"+form.getResponsibility()+"',process='"+form.getProcess()+"',retention_time='"+form.getRetention_time()+"'";
			statement.executeQuery(cmd_insert);
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
			  
			  String cmd_insert="insert into tbl_form(form_or_record_id,form_or_record_title,form_yes_or_no,form_media_type,responsibility,process,retention_time) values('"+form.getForm_or_record_id()+"','"+form.getForm_or_record_title()+"','"+form.getForm_yes_or_no()+"','"+form.getForm_media_type()+"','"+form.getResponsibility()+"','"+form.getProcess()+"','"+form.getRetention_time()+"')"; 
			  statement.execute(cmd_insert);
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
	
	
	
	public List<Form> getform(){
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
			resultSet = statement.executeQuery("select * from tbl_form");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				form.add(new Form(resultSet.getString("form_or_record_id"),resultSet.getString("form_or_record_title"),resultSet.getString("form_yes_or_no"),resultSet.getString("form_media_type"),resultSet.getString("responsibility"),resultSet.getString("process"),resultSet.getString("retention_time"),resultSet.getString("issuer"),resultSet.getString("effective_date"),resultSet.getString("approver1"),resultSet.getString("comments")));
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
		
	public List<Form> getform(String recordtitle,
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
			
			cmd = "select * from tbl_form where form_or_record_title='"+ recordtitle +"' or form_media_type='"+ mediatype +"' or retention_time='"+ retentiontime +"'";
			
			resultSet = statement.executeQuery(cmd);
		while (resultSet.next()) {
			form.add(new Form(resultSet.getString("form_or_record_id"),resultSet.getString("form_or_record_title"),resultSet.getString("form_yes_or_no"),resultSet.getString("form_media_type"),resultSet.getString("responsibility"),resultSet.getString("process"),resultSet.getString("retention_time"),resultSet.getString("issuer"),resultSet.getString("effective_date"),resultSet.getString("approver1"),resultSet.getString("comments")));
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

	}


}