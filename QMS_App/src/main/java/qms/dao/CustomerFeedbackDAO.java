package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import qms.model.CustomerFeedback;
import qms.model.Customers;
import qms.model.NonConformance;

public class CustomerFeedbackDAO
{
	private DataSource dataSource; 	
	
	
	public boolean insert_customerfeedback(CustomerFeedback customerFeedback) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_insert = "insert into tbl_customerfeedback(date_of_feedback,type_of_feedback,feedback_recorded_by,feedback_details,attachment_name,attachement_type,attachment_referrence) values('"+customerFeedback.getDate_of_feedback()+"','"+customerFeedback.getType_of_feedback()+"','"+customerFeedback.getFeedback_recorded_by()+"','"+customerFeedback.getFeedback_details()+"','"+customerFeedback.getAttachment_name()+"','"+customerFeedback.getAttachment_type()+"','"+customerFeedback.getAttachment_referrence()+"')";
			System.out.println(statement.execute(cmd_insert));
			
			//status = statement.execute(cmd_insert);
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
		return status;

	}
	
	public boolean delete_customerfeedback(String feedback_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_delete = "delete from tbl_customerfeedback where feedback_id='"+feedback_id+"'";
			status = statement.execute(cmd_delete);
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
		return status;

	}
	
	
	
	
	
	
	
	
	public List<CustomerFeedback> getCustomersfeedbacks(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_customerfeedback");
			//System.out.println("came");
			while(resultSet.next()){
		     customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"),resultSet.getString("type_of_feedback"),resultSet.getString("feedback_recorded_by"),resultSet.getString("feedback_details"),resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
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
	    return customerFeedbacks;
		
	}
	
	public List<CustomerFeedback> getParticular_Customersfeedbacks(String feedbackid){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<CustomerFeedback> customerFeedbacks = new ArrayList<CustomerFeedback>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_customerfeedback where feedback_id='"+feedbackid+"'");
			//System.out.println("came");
			while(resultSet.next()){
			customerFeedbacks.add(new CustomerFeedback(resultSet.getString("feedback_id"),resultSet.getString("date_of_feedback"), resultSet.getString("type_of_feedback"), resultSet.getString("feedback_recorded_by"), resultSet.getString("feedback_details"), resultSet.getString("attachment_name"),resultSet.getString("attachement_type"),resultSet.getString("attachment_referrence")));
				
				
			
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
	    return customerFeedbacks;
		
	}
	
	
	public boolean update_customerfeedback(CustomerFeedback customerFeedback) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_update = "update tbl_customerfeedback set date_of_feedback='"+customerFeedback.getDate_of_feedback()+"',type_of_feedback='"+customerFeedback.getType_of_feedback()+"',feedback_recorded_by='"+customerFeedback.getFeedback_recorded_by()+"',feedback_details='"+customerFeedback.getFeedback_details()+"',attachment_name='"+customerFeedback.getAttachments()+"' where feedback_id='"+customerFeedback.getFeedback_id()+"'";
			System.out.println(statement.execute(cmd_update));
			
			statement.execute(cmd_update);
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
		return status;

	}
	
	
	
	
	
	public DataSource getDataSource() {
		return dataSource;
	}
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
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