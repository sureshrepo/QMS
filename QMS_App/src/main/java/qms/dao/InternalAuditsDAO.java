package qms.dao;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import qms.model.InternalAudits;

public class InternalAuditsDAO{

	private DataSource dataSource;

	

	//Insert into Audit table
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	

	public String get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Max_id = "AI1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(auto_id) as auto_id from tb1_internalaudits";
			
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("auto_id").equals("null"))
					Max_id = "IA"+ (Integer.parseInt(resultSet.getString("auto_id")) + 1001);

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

	public boolean insert_internalAudits(InternalAudits internalAudits){
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
			String cmd_insert = "insert into tb1_internalaudits(id,process,audit_start_date,audit_due_date,auditor,auditor_notes,finding,completion_date,auditors_initials,auditee_name)values ('"+internalAudits.getId()+"','"+internalAudits.getProcess()+"','"+internalAudits.getAudit_start_date()+"','"+internalAudits.getAudit_due_date()+"','"+internalAudits.getAuditor()+"','"+internalAudits.getAuditor_notes()+"','"+internalAudits.getFinding()+"','"+internalAudits.getCompletion_date()+"','"+internalAudits.getAuditors_initials()+"','"+internalAudits.getAuditee_name()+"')";;
			
			//System.out.println(statement.execute(cmd_insert));
			
			status = statement.execute(cmd_insert);
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

	
	public List<InternalAudits> edit_internalaudit(String id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select * from tb1_internalaudits where id='"+id+"'");
			while (resultSet.next()) {
							
								
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;
	}
	
	public boolean update_internalaudits(InternalAudits internalAudits) {
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
			String cmd_update = "update tb1_internalaudits set process='"+internalAudits.getProcess()+"',audit_start_date='"+internalAudits.getAudit_start_date()+"',audit_due_date='"+internalAudits.getAudit_due_date()+"',auditor='"+internalAudits.getAuditor()+"',auditor_notes='"+internalAudits.getAuditor_notes()+"',finding='"+internalAudits.getFinding()+"',completion_date='"+internalAudits.getCompletion_date()+"',auditors_initials='"+internalAudits.getAuditors_initials()+"',auditee_name='"+internalAudits.getAuditee_name()+"' where id='"+internalAudits.getId()+"'"; 
			status = statement.execute(cmd_update);
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
	
	
	//deletion
	


	public boolean delete_internalAudits(String id) {
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
			String cmd_delete = "delete from tb1_internalaudits where id='" + id + "'";
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

	//to view Internal Audits records
	
	public List<InternalAudits> get_internalaudits(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tb1_internalaudits";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {			
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;
	}

	public List<InternalAudits> get_report_internalaudits(String type){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tb1_internalaudits";
			if(type.equals("past_due_audits"))
				cmd_select="select * from tb1_internalaudits where audit_due_date>now()";			
			else if (type.equals("audits_with_nonconformance")) {
				cmd_select="select * from tb1_internalaudits where finding='non conformance'";				
			}
			else if (type.equals("area_of_improvements")) {
				cmd_select="select * from tb1_internalaudits";//doubts
			}
			else if (type.equals("past_due_audits_by_auditor")) {
				cmd_select="select * from tb1_internalaudits where audit_due_date<completion_date";
			}
			else if (type.equals("audit_schedule")) {
				cmd_select="select * from tb1_internalaudits";
			}
			System.out.println(cmd_select);
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {			
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;
	}
	
	public List<InternalAudits> search_internalaudit(String id,String process,String auditee_name) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("id");
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select * from tb1_internalaudits where id='"+id+"'or process='"+process+"' or auditee_name='"+auditee_name+"'");

		//	String cmd_select = "select * from tb1_internalaudits";
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
							
								
				internalAudits.add(new InternalAudits(resultSet
						.getString("id"), resultSet
						.getString("process"), resultSet
						.getString("audit_start_date"), resultSet
						.getString("audit_due_date"), resultSet
						.getString("auditor"), resultSet
						.getString("auditor_notes"), resultSet
						.getString("finding"), resultSet
						.getString("completion_date"), resultSet
						.getString("auditors_initials"), resultSet
						.getString("auditee_name")));
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
		return internalAudits;
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
