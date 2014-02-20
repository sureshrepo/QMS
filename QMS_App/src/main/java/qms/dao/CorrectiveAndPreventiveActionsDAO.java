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

import qms.model.CorrectiveAndPreventiveActions;
import qms.model.InternalAudits;


public class CorrectiveAndPreventiveActionsDAO extends AbstractExcelView
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook ,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		response.setHeader("Content-Disposition","attachment;filename='"+(String)model.get("title")+"'");
		
		HSSFSheet excelSheet = workbook.createSheet((String)model.get("title"));
		@SuppressWarnings("unchecked")
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions=(List<CorrectiveAndPreventiveActions>)model.get("correctiveAndPreventiveActions");
		
		
		String[] fields=(String[])model.get("fields");
		System.out.println(fields[0]);
		setExcelHeader(excelSheet,correctiveAndPreventiveActions,fields);
		setExcelRows(excelSheet,correctiveAndPreventiveActions,fields);
		
	}
	
	//creating header records
	public void setExcelHeader(HSSFSheet excelSheet,List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions,String[] fields)
	{
		HSSFRow excelHeader = excelSheet.createRow(0);
		int record = 0;
		/*(String capa_id, String nc_id,
			String source_of_nonconformance, String external_id,
			String type_of_nonconformance, String date_found,
			String temporary_action, String nature_of_nc,
			String capa_requestor, String request_date, String capa_due_date,
			String assigned_team_leader, String team_members,
			String root_cause_analysis_file,
			
			 
			 
			 String use_5_why_in_system,
			String why, String root_cause_statement,
			String upload_external_analysis,
			
			 
			 String action,
			String responsibility, String due_date, String completion_date,
			String verified_by, String verification_date)*/
		
			for(String field:fields)
			{
				if (field.equals("capa_id")) 
				{
					
					excelHeader.createCell(record++).setCellValue(
							"CORRECTIVE AND PREVENTIVE ACTIONS ID");
					
				}
				else if (field.equals("nc_id")) {
					excelHeader.createCell(record++).setCellValue(
							"NON CONFORMANCE ID");
					}
				else if (field.equals("source_of_nonconformance")) {
					excelHeader.createCell(record++).setCellValue(
							"SOURCE OF NON CONFORMANCE");
					} 
				else if (field.equals("external_id")) {
					excelHeader.createCell(record++).setCellValue(
							"EXTERNAL ID");
					}
				else if (field.equals("temporary_action")) {
					excelHeader.createCell(record++).setCellValue(
							"TEMPORARY ACTION");
					}
				
				else if (field.equals("nature_of_nc")) {
					excelHeader.createCell(record++).setCellValue(
							"NATURE OF NC");
					}
				else if (field.equals("capa_requestor")) {
					excelHeader.createCell(record++).setCellValue(
							"CAPA REQUESTOR");}
				else if (field.equals("request_date")) {
					excelHeader.createCell(record++).setCellValue(
							"REQUEST DATE");
					}
				else if (field.equals("capa_due_date")) {
					excelHeader.createCell(record++).setCellValue(
							"CAPA DUE DATE");
					}
				else if (field.equals("assigned_team_leader")) {
					excelHeader.createCell(record++).setCellValue(
							"ASSIGNED TEAM LEADER");
					}
				else if (field.equals("team_members")) {
					excelHeader.createCell(record++).setCellValue(
							"TEAM MEMBERS");
					}
				else if (field.equals("root_cause_analysis_file")) {
					excelHeader.createCell(record++).setCellValue(
							"ROOT CAUSE ANALYSIS FILE");
					}
				else if (field.equals("use_5_why_in_system")) {
					excelHeader.createCell(record++).setCellValue(
							"USE 5 WHY IN SYSTEM");
					}
				else if (field.equals("why")) {
					excelHeader.createCell(record++).setCellValue(
							"WHY");
					}
				else if (field.equals("root_cause_statement")) {
					excelHeader.createCell(record++).setCellValue(
							"ROOT CAUSE STATEMENT");
					}
				else if (field.equals("upload_external_analysis")) {
					excelHeader.createCell(record++).setCellValue(
							"UPLOAD EXTERNAL ANALYSIS");
					}
				else if (field.equals("upload")) {
					excelHeader.createCell(record++).setCellValue(
							"UPLOAD");
					}
				
				else if (field.equals("action")) {
					excelHeader.createCell(record++).setCellValue(
							"ACTION");
					}
				else if (field.equals("responsibility")) {
					excelHeader.createCell(record++).setCellValue(
							"RESPONSIBILITY");
					}
				else if (field.equals("due_date")) {
					excelHeader.createCell(record++).setCellValue(
							"DUE DATE");
					}
				else if (field.equals("completion_date")) {
					excelHeader.createCell(record++).setCellValue(
							"COMPLETION DATE");
					}
				else if (field.equals("verified_by")) {
					excelHeader.createCell(record++).setCellValue(
							"VERIFIED BY");
					}
				else if (field.equals("verification_date")) {
					excelHeader.createCell(record++).setCellValue(
							"VERIFICATION DATE");
					}
			}
			
		}
	
	/*
	public void sugges()
	{
		 if(!sr.equals("")) 
		 { 
		 sr=sr+"%"; 
		 rs=s.executeQuery("select keyword from dictionary where keyword LIKE '"+sr+"'"); 
		 while(rs.next()) 
		 {
		 name=rs.getString(1); %>
		<%=name%>
		<%}} else{%>
		<%}%>
	}
*/
	
	//creating cell records
		
	public void setExcelRows(HSSFSheet excelSheet,List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions,String[] fields){
		int record = 1,column=0;
		
		for (CorrectiveAndPreventiveActions correctiveandpreventiveactions:correctiveAndPreventiveActions){	
			
			HSSFRow excelRow = excelSheet.createRow(record++);
			
			for(String field:fields)
			{
				if (field.equals("capa_id")) 
				{
					

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getCapa_id());
					
				}
				else if (field.equals("nc_id")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getNc_id());
					}
				else if (field.equals("source_of_nonconformance")) {
					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getSource_of_nonconformance());
					} 
				else if (field.equals("external_id")) {
					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getExternal_id());}
				else if (field.equals("temporary_action")) {
					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getTemporary_action());
					}
				
				else if (field.equals("nature_of_nc")) {
					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getNature_of_nc());
					}
				else if (field.equals("capa_requestor")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getCapa_requestor());
					}
				else if (field.equals("request_date")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getRequest_date());
					}
				else if (field.equals("capa_due_date")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getCapa_due_date());
					}
				else if (field.equals("assigned_team_leader")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getAssigned_team_leader());
					}
				else if (field.equals("team_members")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getTeam_members());
					}
				else if (field.equals("root_cause_analysis_file")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getRoot_cause_analysis_file());
					}
				else if (field.equals("use_5_why_in_system")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getUse_5_why_in_system());
					}
				else if (field.equals("why")) {
					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getWhy());
					}
				else if (field.equals("root_cause_statement")) {
					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getRoot_cause_statement());}
				else if (field.equals("upload_external_analysis")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getUpload_external_analysis());}
				else if (field.equals("upload")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getUpload());}
				else if (field.equals("action")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getAction());}
				else if (field.equals("responsibility")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getResponsibility());}
				else if (field.equals("due_date")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getDue_date());}
				else if (field.equals("completion_date")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getCompletion_date());}
				else if (field.equals("verified_by")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getVerified_by());}
				else if (field.equals("verification_date")) {

					excelRow.createCell(column++).setCellValue(
							correctiveandpreventiveactions.getVerification_date());
					}
			}

			column=0;
			}
			
	}
	
	public boolean insert_correctiveAndPreventiveActions(CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {
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
			String cmd_insert = "insert into tbl_corrective_and_preventive_main(capa_id,nc_id,source_of_nonconformance,external_id,type_of_nonconformance,date_found,temporary_action,nature_of_nc,capa_requestor,request_date,capa_due_date,assigned_team_leader,team_members,root_cause_analysis_file,use_5_why_in_system,why,root_cause_statement,upload_external_analysis,upload)values('"+correctiveAndPreventiveActions.getCapa_id()+"','"+correctiveAndPreventiveActions.getNc_id()+"','"+correctiveAndPreventiveActions.getSource_of_nonconformance()+"','"+correctiveAndPreventiveActions.getExternal_id()+"','"+correctiveAndPreventiveActions.getType_of_nonconformance()+"','"+correctiveAndPreventiveActions.getDate_found()+"','"+correctiveAndPreventiveActions.getTemporary_action()+"','"+correctiveAndPreventiveActions.getNature_of_nc()+"','"+correctiveAndPreventiveActions.getCapa_requestor()+"','"+correctiveAndPreventiveActions.getRequest_date()+"','"+correctiveAndPreventiveActions.getCapa_due_date()+"','"+correctiveAndPreventiveActions.getAssigned_team_leader()+"','"+correctiveAndPreventiveActions.getTeam_members()+"','"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"','"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"','"+correctiveAndPreventiveActions.getWhy()+"','"+correctiveAndPreventiveActions.getRoot_cause_statement()+"','"+correctiveAndPreventiveActions.getUpload_external_analysis()+"','"+correctiveAndPreventiveActions.getUpload()+"')";
			String cmd_insert1 = "insert into tbl_corrective_and_preventive_child(capa_id,action,responsibility,due_date,completion_date,verified_by,verification_date)values('"+correctiveAndPreventiveActions.getCapa_id()+"','"+correctiveAndPreventiveActions.getAction()+"','"+correctiveAndPreventiveActions.getResponsibility()+"','"+correctiveAndPreventiveActions.getDue_date()+"','"+correctiveAndPreventiveActions.getCompletion_date()+"','"+correctiveAndPreventiveActions.getVerified_by()+"','"+correctiveAndPreventiveActions.getVerification_date()+"')";
			statement.execute(cmd_insert);
			statement.execute(cmd_insert1);
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
	
	public List<CorrectiveAndPreventiveActions> getCorrectiveAndPreventiveActions() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select t1.*,t2.* from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id ";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("temporary_action"), resultSet
						.getString("nature_of_nc"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"),resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"),resultSet
						.getString("upload_external_analysis"),
						resultSet.getString("upload"),resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date")));

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
		return correctiveAndPreventiveActions;
	}

	public List<CorrectiveAndPreventiveActions> getCorrectiveAndPreventiveActions(String capa_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
	    try{
	    	String cmd_select = "select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("temporary_action"), resultSet
						.getString("nature_of_nc"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"),resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"),resultSet
						.getString("upload_external_analysis"),
						resultSet.getString("upload"),resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date")));
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
	    return correctiveAndPreventiveActions;
		
	}
	
	public List<CorrectiveAndPreventiveActions> edit_CorrectiveAndPreventiveActions(String capa_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		

		//List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
	    try{
	    	String cmd_select = "select t1.*,t2.* from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_id='"+capa_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println(resultSet.getString("capa_id"));
				correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("temporary_action"), resultSet
						.getString("nature_of_nc"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"),resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"),resultSet
						.getString("upload_external_analysis"),
						resultSet.getString("upload"),resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date")));
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
		return correctiveAndPreventiveActions;
	}

	
	public boolean update_correctiveAndPreventiveActions(CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {
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
			
			String cmd_update = "update tbl_corrective_and_preventive_main set capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"',nc_id='"+correctiveAndPreventiveActions.getNc_id()+"',source_of_nonconformance='"+correctiveAndPreventiveActions.getSource_of_nonconformance()+"',external_id='"+correctiveAndPreventiveActions.getExternal_id()+"',type_of_nonconformance='"+correctiveAndPreventiveActions.getType_of_nonconformance()+"',date_found='"+correctiveAndPreventiveActions.getDate_found()+"',temporary_action='"+correctiveAndPreventiveActions.getTemporary_action()+"',nature_of_nc='"+correctiveAndPreventiveActions.getNature_of_nc()+"',capa_requestor='"+correctiveAndPreventiveActions.getCapa_requestor()+"',request_date='"+correctiveAndPreventiveActions.getRequest_date()+"',capa_due_date='"+correctiveAndPreventiveActions.getCapa_due_date()+"',assigned_team_leader='"+correctiveAndPreventiveActions.getAssigned_team_leader()+"',team_members='"+correctiveAndPreventiveActions.getTeam_members()+"',root_cause_analysis_file='"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"',use_5_why_in_system='"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"',why='"+correctiveAndPreventiveActions.getWhy()+"',root_cause_statement='"+correctiveAndPreventiveActions.getRoot_cause_statement()+"',upload_external_analysis='"+correctiveAndPreventiveActions.getUpload_external_analysis()+"',upload='"+correctiveAndPreventiveActions.getUpload()+"' where capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"'";
			String cmd_update1 = "update tbl_corrective_and_preventive_child set capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"',action='"+correctiveAndPreventiveActions.getAction()+"',responsibility='"+correctiveAndPreventiveActions.getResponsibility()+"',due_date='"+correctiveAndPreventiveActions.getDue_date()+"',completion_date='"+correctiveAndPreventiveActions.getCompletion_date()+"',verified_by='"+correctiveAndPreventiveActions.getVerified_by()+"',verification_date='"+correctiveAndPreventiveActions.getVerification_date()+"' where capa_id='"+correctiveAndPreventiveActions.getCapa_id()+"'";
		
			 statement.execute(cmd_update);
			 statement.execute(cmd_update1);
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
	
	public int get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		int Max_id = 1001;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(capa_id) as capa_id from tbl_corrective_and_preventive_main";
			
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				//if (!resultSet.getString("capa_id").equals("null"))
					Max_id = resultSet.getInt("capa_id") + 1;

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

	public List<CorrectiveAndPreventiveActions> search_correctiveactions(String capa_requestor,String request_date,String action) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
	    try{
	    	
	   
	    	String cmd_select = "select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id where t1.capa_requestor='"+capa_requestor+"'or t2.action='"+action+"'or t1.request_date='"+request_date+"' ";
			
	    	resultSet = statement.executeQuery(cmd_select);
	   while(resultSet.next()){
		   
		   correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
					.getString("source_of_nonconformance"), resultSet
					.getString("external_id"), resultSet
					.getString("type_of_nonconformance"), resultSet
					.getString("date_found"), resultSet
					.getString("temporary_action"), resultSet
					.getString("nature_of_nc"), resultSet
					.getString("capa_requestor"), resultSet
					.getString("request_date"),resultSet
					.getString("capa_due_date"), resultSet
					.getString("assigned_team_leader"), resultSet
					.getString("team_members"), resultSet
					.getString("root_cause_analysis_file"), resultSet
					.getString("use_5_why_in_system"), resultSet
					.getString("why"), resultSet
					.getString("root_cause_statement"),resultSet
					.getString("upload_external_analysis"),
					resultSet.getString("upload"),resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date")));
	
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
	    return correctiveAndPreventiveActions;
		
	}
		
		
		
	
	public boolean delete_correctiveAndPreventiveActions(String capa_id) {
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
			String cmd_delete = "delete from tbl_corrective_and_preventive_main where capa_id='"+ capa_id + "'";
			String cmd_delete1 = "delete from tbl_corrective_and_preventive_child where capa_id='"+ capa_id + "'";
			
			statement.execute(cmd_delete);
			statement.execute(cmd_delete1);
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
	
	public List<CorrectiveAndPreventiveActions> getCorrectiveAndPreventiveActions_bytype(String type)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();
	    try{
	    	
	   if(type.equals("Open_Corrective_Actions"))
		//resultSet = statement.executeQuery("select * from tbl_maintenance where due_date between now() and DATE_ADD(NOW(), INTERVAL 30 DAY)" );
			resultSet = statement.executeQuery("select * from tbl_corrective_and_preventive_main as t1 join tbl_corrective_and_preventive_child as t2 on t1.capa_id=t2.capa_id" );
	   
		   else if(type.equals("Open_Corrective_Actions_for_Over_30_Days"))
		   {}	//resultSet = statement.executeQuery("select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW(),INTERVAL no_of_days DAY)" );
	   else if(type.equals("Corrective_Actions_for_A_Certain_Period"))
	   {}//resultSet = statement.executeQuery("select * from tbl_maintenance where due_date<now()");
	   else
		   System.out.println("choose any one of the above");
		 
		   
	   while(resultSet.next()){
		   
		   correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
					.getString("source_of_nonconformance"), resultSet
					.getString("external_id"), resultSet
					.getString("type_of_nonconformance"), resultSet
					.getString("date_found"), resultSet
					.getString("temporary_action"), resultSet
					.getString("nature_of_nc"), resultSet
					.getString("capa_requestor"), resultSet
					.getString("request_date"),resultSet
					.getString("capa_due_date"), resultSet
					.getString("assigned_team_leader"), resultSet
					.getString("team_members"), resultSet
					.getString("root_cause_analysis_file"), resultSet
					.getString("use_5_why_in_system"), resultSet
					.getString("why"), resultSet
					.getString("root_cause_statement"),resultSet
					.getString("upload_external_analysis"),
					resultSet.getString("upload"),resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date")));
	
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
	    return correctiveAndPreventiveActions;
		
	}

	public List<CorrectiveAndPreventiveActions> get_corrective() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_corrective_and_preventive_actions";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("correct");
				 correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
							.getString("source_of_nonconformance"), resultSet
							.getString("external_id"), resultSet
							.getString("type_of_nonconformance"), resultSet
							.getString("date_found"), resultSet
							.getString("temporary_action"), resultSet
							.getString("nature_of_nc"), resultSet
							.getString("capa_requestor"), resultSet
							.getString("request_date"),resultSet
							.getString("capa_due_date"), resultSet
							.getString("assigned_team_leader"), resultSet
							.getString("team_members"), resultSet
							.getString("root_cause_analysis_file"), resultSet
							.getString("use_5_why_in_system"), resultSet
							.getString("why"), resultSet
							.getString("root_cause_statement"),resultSet
							.getString("upload_external_analysis"),
							resultSet.getString("upload"),resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date")));
			
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
		return correctiveAndPreventiveActions;
	}
	
	public List<CorrectiveAndPreventiveActions> edit_corrective(String nc_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<CorrectiveAndPreventiveActions> correctiveAndPreventiveActions = new ArrayList<CorrectiveAndPreventiveActions>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_corrective_and_preventive_actions where nc_id='"+nc_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				 correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions(resultSet.getString("capa_id"),resultSet.getString("nc_id"), resultSet
							.getString("source_of_nonconformance"), resultSet
							.getString("external_id"), resultSet
							.getString("type_of_nonconformance"), resultSet
							.getString("date_found"), resultSet
							.getString("temporary_action"), resultSet
							.getString("nature_of_nc"), resultSet
							.getString("capa_requestor"), resultSet
							.getString("request_date"),resultSet
							.getString("capa_due_date"), resultSet
							.getString("assigned_team_leader"), resultSet
							.getString("team_members"), resultSet
							.getString("root_cause_analysis_file"), resultSet
							.getString("use_5_why_in_system"), resultSet
							.getString("why"), resultSet
							.getString("root_cause_statement"),resultSet
							.getString("upload_external_analysis"),
							resultSet.getString("upload"),resultSet.getString("action"),resultSet.getString("responsibility"),resultSet.getString("due_date"),resultSet.getString("completion_date"),resultSet.getString("verified_by"),resultSet.getString("verification_date")));
			
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
		return correctiveAndPreventiveActions;
	}
	
	
	public boolean update_corrective(CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status1 = false;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			System.out.println("update");
			String cmd_update = "update tbl_corrective_and_preventive_actions set capa_requestor='"+correctiveAndPreventiveActions.getCapa_requestor()+"',request_date='"+correctiveAndPreventiveActions.getRequest_date()+"',capa_due_date='"+correctiveAndPreventiveActions.getCapa_due_date()+"',assigned_team_leader='"+correctiveAndPreventiveActions.getAssigned_team_leader()+"',team_members='"+correctiveAndPreventiveActions.getTeam_members()+"',root_cause_analysis_file='"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"',use_5_why_in_system='"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"',why='"+correctiveAndPreventiveActions.getWhy()+"',root_cause_statement='"+correctiveAndPreventiveActions.getRoot_cause_statement()+"',upload_external_analysis='"+correctiveAndPreventiveActions.getUpload_external_analysis()+"',action='"+correctiveAndPreventiveActions.getAction()+"',responsibility='"+correctiveAndPreventiveActions.getResponsibility()+"',due_date='"+correctiveAndPreventiveActions.getDue_date()+"',completion_date='"+correctiveAndPreventiveActions.getCompletion_date()+"',verified_by='"+correctiveAndPreventiveActions.getVerified_by()+"',verification_date='"+correctiveAndPreventiveActions.getVerification_date()+"' where nc_id='"+correctiveAndPreventiveActions.getNc_id()+"'";
			System.out.println(cmd_update);
			status1 = statement.execute(cmd_update);
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
		return status1;

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