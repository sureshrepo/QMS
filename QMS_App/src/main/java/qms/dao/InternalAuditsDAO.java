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
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import qms.model.InternalAudits;



	

	public class InternalAuditsDAO extends AbstractExcelView
	{
		private DataSource dataSource;
		
		
		public DataSource getDataSource() {
			return dataSource;
		}

		public void setDataSource(DataSource dataSource) {
			this.dataSource = dataSource;
		}

		
		/*
		 * Excel Sheet Generation
		 */
		@Override
		protected void buildExcelDocument(Map model, HSSFWorkbook workbook ,
				HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
			response.setHeader("Content-Disposition","attachment;filename='"+(String)model.get("title")+"'");
			
			HSSFSheet excelSheet = workbook.createSheet((String)model.get("title"));
			
			@SuppressWarnings("unchecked")
			
			List<InternalAudits> internalAudit=(List<InternalAudits>) model.get("internalAudits");
			String[] fields=(String[])model.get("fields");
			
			setExcelHeader(excelSheet,internalAudit,fields);
			setExcelRows(excelSheet,internalAudit,fields);
			
		}
		
		//creating header records
		public void setExcelHeader(HSSFSheet excelSheet,List<InternalAudits> internalAudit,String[] fields)
		{
			HSSFRow excelHeader = excelSheet.createRow(0);
			int record = 0;
			
			
				for(String field:fields)
				{
					if (field.equals("report_id")) 
					{
						
						excelHeader.createCell(record++).setCellValue(
								"ID");
						
					}
					else if (field.equals("process")) {
						excelHeader.createCell(record++).setCellValue(
								"PROCESS");
						}
					else if (field.equals("auditee_name")) {
						excelHeader.createCell(record++).setCellValue(
								"AUDITEE NAME");
						} 
					else if (field.equals("audit_start_date")) {
						excelHeader.createCell(record++).setCellValue(
								"AUDIT START DATE");
						}
					else if (field.equals("audit_due_date")) {
						excelHeader.createCell(record++).setCellValue(
								"AUDIT DUE DATE");
						}
					
					else if (field.equals("auditor")) {
						excelHeader.createCell(record++).setCellValue(
								"AUDITOR");
						}
					else if (field.equals("audit_notes")) {
						excelHeader.createCell(record++).setCellValue(
								"AUDITOR NOTES");}
					else if (field.equals("finding")) {
						excelHeader.createCell(record++).setCellValue(
								"FINDING");
						}
					else if (field.equals("completion_date")) {
						excelHeader.createCell(record++).setCellValue(
								"COMPLETION DATES");
						}
					else if (field.equals("auditors_initial")) {
						excelHeader.createCell(record++).setCellValue(
								"AUDITOR INITIALS");
						}
				
				}
			}
	
		
		//creating cell records
			
		public void setExcelRows(HSSFSheet excelSheet, List<InternalAudits> internalAudits,String[] fields){
			int record = 1,c=0;
			
			for (InternalAudits internalAudit:internalAudits ){	
				
				HSSFRow excelRow = excelSheet.createRow(record++);
				c=0;
				for(String field:fields)
				{
					if (field.equals("report_id")) 
					{						
						excelRow.createCell(c++).setCellValue(
								internalAudit.getId());
					}
					else if (field.equals("process")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getProcess());
						}
					else if (field.equals("auditee_name")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getAuditee_name());
						} 
					else if (field.equals("audit_start_date")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getAudit_start_date());
						}
					else if (field.equals("audit_due_date")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getAudit_due_date());}
					else if (field.equals("auditor")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getAuditor());}
					else if (field.equals("audit_notes")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getAuditor_notes());}
					else if (field.equals("finding")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getFinding());}
					else if (field.equals("completion_date")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getCompletion_date());}
					else if (field.equals("auditors_initial")) {
						excelRow.createCell(c++).setCellValue(
								internalAudit.getAuditors_initials());}
								}
			}
		}
		
	//getting maximum+1 id for inserting
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
//inserting
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
			String cmd_insert = "insert into tb1_internalaudits(process,id,audit_start_date,audit_due_date,auditor,auditor_notes,finding,completion_date,auditors_initials,auditee_name)values ('"+internalAudits.getProcess()+"','"+internalAudits.getId()+"','"+internalAudits.getAudit_start_date()+"','"+internalAudits.getAudit_due_date()+"','"+internalAudits.getAuditor()+"','"+internalAudits.getAuditor_notes()+"','"+internalAudits.getFinding()+"','"+internalAudits.getCompletion_date()+"','"+internalAudits.getAuditors_initials()+"','"+internalAudits.getAuditee_name()+"')";;
			
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

	//Edit operation
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
	
	//Update Operation
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

	//To view Internal Audits records
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
	//REPORT GENERATION
	
	public  List<InternalAudits> getAudit_bytype(String type){
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
				cmd_select="select * from tb1_internalaudits where finding='nonconformance'";				
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
	
	//Search operation for find a particular record
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
	public  List<InternalAudits> getlimitedinternalreport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();
		try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tb1_internalaudits limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
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
			/*logger.info(e.toString());*/
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
	public int getnoofinternalreport() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int noofRecords = 0;
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<InternalAudits> internalAudits = new ArrayList<InternalAudits>();
		try {

			String cmd;
			
					cmd = "select count(*) as noofrecords from tb1_internalaudits ";
					System.out.println("command"+cmd);			
			resultSet = statement.executeQuery(cmd);
			if (resultSet.next())
				noofRecords = resultSet.getInt("noofrecords");

		} catch (Exception e) {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		} finally {
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return noofRecords;

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
