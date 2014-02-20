package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import qms.model.Customers;



public class CustomersDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public String getMax_customerID(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Maxid="C1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  String cmd_select="select max(auto_id) as id from tbl_customer";
			resultSet = statement.executeQuery(cmd_select);
			if(resultSet.next())
			{
				if(!resultSet.getString("id").equals("null"))
				{
					Maxid="C"+(Integer.parseInt(resultSet.getString("id"))+1001);
				}
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
		    return Maxid;
		
	}
	
	
	public boolean delete_customer(String customer_id){
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
			  String cmd_delete="delete from tbl_customer where customer_id='"+customer_id+"'";
			  status=statement.execute(cmd_delete);
			
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
	
	public List<Customers> getCustomers_byid(String customer_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Customers> customers = new ArrayList<Customers>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_customer where customer_id='"+customer_id+"'");
			while(resultSet.next()){
							customers.add(new Customers(resultSet.getString("customer_id"), resultSet.getString("customer_name"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("country"), resultSet.getString("zipcode"), resultSet.getString("website"), resultSet.getString("contact_name"), resultSet.getString("title_of_contact"), resultSet.getString("telephone"), resultSet.getString("fax"), resultSet.getString("email_address")));
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
	    return customers;
		
	}
	

	public boolean update_customer(Customers customers)
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
			  String cmd_insert="update tbl_customer set customer_name='"+customers.getCustomer_name()+"',address='"+customers.getAddress()+"',city='"+customers.getCity()+"',state='"+customers.getState()+"',country='"+customers.getCountry()+"',zipcode='"+customers.getZipcode()+"',website='"+customers.getWebsite()+"',contact_name='"+customers.getContact_name()+"',title_of_contact='"+customers.getTitle_of_contact()+"',telephone='"+customers.getTelephone()+"',fax='"+customers.getFax()+"',email_address='"+customers.getEmail_address()+"' where customer_id='"+customers.getCustomer_id()+"'";
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
	
	
	public boolean insert_customer(Customers customers)
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
			  String cmd_insert="insert into tbl_customer(customer_id,customer_name,address,city,state,country,zipcode,website,contact_name,title_of_contact,telephone,fax,email_address) values('"+customers.getCustomer_id()+"','"+customers.getCustomer_name()+"','"+customers.getAddress()+"','"+customers.getCity()+"','"+customers.getState()+"','"+customers.getCountry()+"','"+customers.getZipcode()+"','"+customers.getWebsite()+"','"+customers.getContact_name()+"','"+customers.getTitle_of_contact()+"','"+customers.getTelephone()+"','"+customers.getFax()+"','"+customers.getEmail_address()+"')";
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
	
	
	
	public List<Customers> getCustomers(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Customers> customers = new ArrayList<Customers>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_customer");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				customers.add(new Customers(resultSet.getString("customer_id"), resultSet.getString("customer_name"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("country"), resultSet.getString("zipcode"), resultSet.getString("website"), resultSet.getString("contact_name"), resultSet.getString("title_of_contact"), resultSet.getString("telephone"), resultSet.getString("fax"), resultSet.getString("email_address")));
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
	    return customers;
		
	}
	
	public List<Customers> getfindcustomer(String id,String name, String address) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Customers> customers = new ArrayList<Customers>();
		try {
			
			String cmd="";
			
			cmd = "select * from tbl_customer where customer_id='"+ id +"' or customer_name='"+ name +"' or address='"+ address +"'";
			
			resultSet = statement.executeQuery(cmd);
		while (resultSet.next()) {
			customers.add(new Customers(resultSet.getString("customer_id"), resultSet.getString("customer_name"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("country"), resultSet.getString("zipcode"), resultSet.getString("website"), resultSet.getString("contact_name"), resultSet.getString("title_of_contact"), resultSet.getString("telephone"), resultSet.getString("fax"), resultSet.getString("email_address")));
			
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
		return customers;

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
