package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;


import qms.model.SupplierPerformance;


public class SupplierPerformanceDAO {
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public String get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Max_id = "SP1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(auto_id) as auto_id from tbl_supplierperformance";
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("auto_id").equals("null"))
					Max_id = "IA"
							+ (Integer.parseInt(resultSet.getString("auto_id")) + 1000 + 1);

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
		return Max_id;
	}

	
	
	public boolean delete_supplierperformance(String supplier_id){
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
			  String cmd_delete="delete from tbl_supplierperformance where supplier_id ='"+supplier_id+"'";
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
	
	public List<SupplierPerformance> getsupplierperformance_byid(String supplier_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_id ='"+supplier_id+"'");
			while(resultSet.next()){
				supplierPerformances.add(new SupplierPerformance(resultSet.getString("supplier_id"), resultSet.getString("supplier_name"), resultSet.getString("category"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("postalcode"), resultSet.getString("country"), resultSet.getString("website"), resultSet.getString("certified_to"), resultSet.getString("contact_name"), resultSet.getString("contact_title"), resultSet.getString("phone"), resultSet.getString("fax"), resultSet.getString("email_address")));
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
	    return supplierPerformances;
		
	}
	

	public boolean update_supplierperformance(SupplierPerformance supplierPerformance)
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
			  String cmd_insert="update tbl_supplierperformance set supplier_name ='"+supplierPerformance.getSupplier_name()+"',category='"+supplierPerformance.getCategory()+"',address='"+supplierPerformance.getAddress()+"',city ='"+supplierPerformance.getCity()+"',state='"+supplierPerformance.getState()+"',postalcode='"+supplierPerformance.getPostalcode()+"',country='"+supplierPerformance.getCountry()+"',website='"+supplierPerformance.getWebsite()+"',certified_to='"+supplierPerformance.getCertified_to()+"',contact_name='"+supplierPerformance.getContact_name()+"',contact_title='"+supplierPerformance.getContact_title()+"',phone='"+supplierPerformance.getPhone()+"',fax='"+supplierPerformance.getFax()+"',email_address='"+supplierPerformance.getEmail_address()+"' where supplier_id ='"+supplierPerformance.getSupplier_id()+"'";
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
	
	
	public boolean insert_supplierperformance(SupplierPerformance supplierPerformance)
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
			  //DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		    	// Date date = new Date();
			  
			  String cmd_insert="insert into tbl_supplierperformance(supplier_id,supplier_name,category,address,city,state,postalcode,country,website,certified_to,contact_name,contact_title,phone,fax,email_address) values('"+supplierPerformance.getSupplier_id()+"','"+supplierPerformance.getSupplier_name()+"','"+supplierPerformance.getCategory()+"','"+supplierPerformance.getAddress()+"','"+supplierPerformance.getCity()+"','"+supplierPerformance.getState()+"','"+supplierPerformance.getPostalcode()+"','"+supplierPerformance.getCountry()+"','"+supplierPerformance.getWebsite()+"','"+supplierPerformance.getCertified_to()+"','"+supplierPerformance.getContact_name()+"','"+supplierPerformance.getContact_title()+"','"+supplierPerformance.getPhone()+"','"+supplierPerformance.getFax()+"','"+supplierPerformance.getEmail_address()+"')"; 
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
	
	
	
	public List<SupplierPerformance> getsupplierperformance(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_supplierperformance");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				supplierPerformances.add(new SupplierPerformance(resultSet.getString("supplier_id"), resultSet.getString("supplier_name"), resultSet.getString("category"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("postalcode"), resultSet.getString("country"), resultSet.getString("website"), resultSet.getString("certified_to"), resultSet.getString("contact_name"), resultSet.getString("contact_title"), resultSet.getString("phone"), resultSet.getString("fax"), resultSet.getString("email_address")));
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
	    return supplierPerformances;
		
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
	
	
	/*public List<InternalAudits> getinternalaudits(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<InternalAudits> internalaudits = new ArrayList<InternalAudits>();
	    try{
			resultSet = statement.executeQuery("select * from tbl_supplierperformance");
			System.out.println("came");
			while(resultSet.next()){
				System.out.println("count");
				internalaudits.add(new InternalAudits(resultSet.getString("audit_id"), resultSet.getString("audit_process"), resultSet.getString("audit_Start_date"), resultSet.getString("audit_due_date"), resultSet.getString("auditor"), resultSet.getString("audit_notes"), resultSet.getString("audit_finding"), resultSet.getString("audit_completion_date"), resultSet.getString("auditors_initials"), resultSet.getString("auditee_name")));
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
	    return internalaudits;
		
	}
	*/
	
	
	
	
	
	public List<SupplierPerformance> getSupplierPerformances(String suppliername,
			String phone, String email) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();
		try {
			
			String cmd="";
			
			cmd = "select * from tbl_supplierperformance where supplier_name='"+ suppliername +"' or phone='"+ phone +"' or email_address='"+ email +"'";
			
			resultSet = statement.executeQuery(cmd);
		while (resultSet.next()) {
				supplierPerformances.add(new SupplierPerformance(resultSet
						.getString("supplier_id"), resultSet
						.getString("supplier_name"),resultSet.getString("category"),
						resultSet.getString("address"), resultSet
								.getString("city"), resultSet
								.getString("state"), resultSet
								.getString("postalcode"),resultSet
								.getString("country"),resultSet
								.getString("website"),resultSet.getString("certified_to"), resultSet.getString("contact_name"), resultSet.getString("contact_title"), resultSet.getString("phone"), resultSet.getString("fax"), resultSet.getString("email_address")));
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
		return supplierPerformances;

	}



}
