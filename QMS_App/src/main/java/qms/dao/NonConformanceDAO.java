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
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import qms.model.InternalAudits;
import qms.model.NonConformance;
import qms.model.CorrectiveAndPreventiveActions;

public class NonConformanceDAO extends AbstractExcelView {
	private DataSource dataSource;

	/**
	 * Excel Sheet Generation
	 */
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HSSFSheet excelSheet = workbook.createSheet("Animal List");
		setExcelHeader(excelSheet);
		
		List<NonConformance> nonConformances = (List<NonConformance>) model.get("nonConformances");
		setExcelRows(excelSheet,nonConformances);
		
	}
	
	
	public void setExcelHeader(HSSFSheet excelSheet) {
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("Id");
		excelHeader.createCell(1).setCellValue("Name");
		excelHeader.createCell(2).setCellValue("Type");
		excelHeader.createCell(3).setCellValue("Aggressive");
		excelHeader.createCell(4).setCellValue("Weight");
	}
	
	
	//End
	
	
	public void setExcelRows(HSSFSheet excelSheet, List<NonConformance> nonConformances){
		int record = 1;
		for (NonConformance nonConformance:nonConformances) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			excelRow.createCell(0).setCellValue(nonConformance.getExternal_id());
			excelRow.createCell(1).setCellValue(nonConformance.getName_of_disposition_responsibility());
			excelRow.createCell(2).setCellValue(nonConformance.getDisposition());
			excelRow.createCell(3).setCellValue(nonConformance.getNature_of_nonconformance());
			excelRow.createCell(4).setCellValue(nonConformance.getProduct_id());
		}
	}
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public boolean insert_nonconformance(NonConformance nonConformance,CorrectiveAndPreventiveActions correctiveAndPreventiveActions) {
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
			String cmd_insert_nonconformance = "insert into tbl_nonconformance(id,source_of_nonconformance,external_id,type_of_nonconformance,product_id,quantity_suspect,nature_of_nonconformance,date_found,reported_by,temporary_action,corrective_action_required,disposition_required,disposition,disposition_complete_date,name_of_disposition_responsibility,cost_of_nonconformance) values('"
					+ nonConformance.getId()
					+ "','"
					+ nonConformance.getSource_of_nonconformance()
					+ "','"
					+ nonConformance.getExternal_id()
					+ "','"
					+ nonConformance.getType_of_nonconformance()
					+ "','"
					+ nonConformance.getProduct_id()
					+ "','"
					+ nonConformance.getQuantity_suspect()
					+ "','"
					+ nonConformance.getNature_of_nonconformance()
					+ "','"
					+ nonConformance.getDate_found()
					+ "','"
					+ nonConformance.getReported_by()
					+ "','"
					+ nonConformance.getTemporary_action()
					+ "','"
					+ nonConformance.getCorrective_action_required()
					+ "','"
					+ nonConformance.getDisposition_required()
					+ "','"
					+ nonConformance.getDisposition()
					+ "','"
					+ nonConformance.getDisposition_complete_date()
					+ "','"
					+ nonConformance.getNature_of_nonconformance()
					+ "','"
					+ nonConformance.getCost_of_nonconformance() + "')";
			status = statement.execute(cmd_insert_nonconformance);
			String cmd_insert_corrective="INSERT INTO tbl_corrective_and_preventive_actions(nc_id,capa_requestor,request_date,capa_due_date,assigned_team_leader,team_members,root_cause_analysis_file,use_5_why_in_system,why,root_cause_statement,upload_external_analysis,action,responsibility,due_date,completion_date,verified_by,verification_date) values('"+nonConformance.getId()+"','"+correctiveAndPreventiveActions.getCapa_requestor()+"','"+correctiveAndPreventiveActions.getRequest_date()+"','"+correctiveAndPreventiveActions.getCapa_due_date()+"','"+correctiveAndPreventiveActions.getAssigned_team_leader()+"','"+correctiveAndPreventiveActions.getTeam_members()+"','"+correctiveAndPreventiveActions.getRoot_cause_analysis_file()+"','"+correctiveAndPreventiveActions.getUse_5_why_in_system()+"','"+correctiveAndPreventiveActions.getWhy()+"','"+correctiveAndPreventiveActions.getRoot_cause_statement()+"','"+correctiveAndPreventiveActions.getUpload_external_analysis()+"','"+correctiveAndPreventiveActions.getAction()+"','"+correctiveAndPreventiveActions.getResponsibility()+"','"+correctiveAndPreventiveActions.getDue_date()+"','"+correctiveAndPreventiveActions.getCompletion_date()+"','"+correctiveAndPreventiveActions.getVerified_by()+"','"+correctiveAndPreventiveActions.getVerification_date()+"')";
			status=statement.execute(cmd_insert_corrective);
			
				
		
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

	
	public boolean update_nonconformance(NonConformance nonConformance) {
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
			System.out.println("check");
			String cmd_update = "update tbl_nonconformance set source_of_nonconformance='"+nonConformance.getSource_of_nonconformance()+"',external_id='"+nonConformance.getExternal_id()+"',type_of_nonconformance='"+nonConformance.getType_of_nonconformance()+"',product_id='"+nonConformance.getProduct_id()+"',quantity_suspect='"+nonConformance.getQuantity_suspect()+"',nature_of_nonconformance='"+nonConformance.getNature_of_nonconformance()+"',date_found='"+nonConformance.getDate_found()+"',reported_by='"+nonConformance.getReported_by()+"',temporary_action='"+nonConformance.getTemporary_action()+"',corrective_action_required='"+nonConformance.getCorrective_action_required()+"',disposition_required='"+nonConformance.getDisposition_required()+"',disposition='"+nonConformance.getDisposition()+"',disposition_complete_date='"+nonConformance.getDisposition_complete_date()+"',name_of_disposition_responsibility='"+nonConformance.getName_of_disposition_responsibility()+"',cost_of_nonconformance='"+nonConformance.getCost_of_nonconformance()+"' where id='"+nonConformance.getId()+"'";
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
	
	
	
	public boolean delete_nonconformance(String nonConformance_id) {
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
			String cmd_delete = "delete from tbl_nonconformance where id='"
					+ nonConformance_id + "'";
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
	public List<NonConformance> edit_nonconformance(String nonConformanceid) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_nonconformance where id='"+nonConformanceid+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"), resultSet
						.getString("disposition"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;
	}

	public String get_maxid() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String Max_id = "NC1001";
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {

			String cmd_select = "select max(auto_id) as auto_id from tbl_nonconformance";
			resultSet = statement.executeQuery(cmd_select);
			if (resultSet.next()) {
				if (!resultSet.getString("auto_id").equals("null"))
					Max_id = "NC"
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

	
	public List<NonConformance> find_nonconformance(String nc_id,String type_of_nonconformance,String product_id ) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_nonconformance where id='"+nc_id+"' or type_of_nonconformance='"+type_of_nonconformance+"' or product_id='"+product_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"), resultSet
						.getString("disposition"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;
	}
	
	
	
	
	
	
	
	
	public List<NonConformance> get_nonconformance() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<NonConformance> nonConformances = new ArrayList<NonConformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_nonconformance";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println("came");
				nonConformances.add(new NonConformance(resultSet
						.getString("id"), resultSet
						.getString("source_of_nonconformance"), resultSet
						.getString("external_id"), resultSet
						.getString("type_of_nonconformance"), resultSet
						.getString("product_id"), resultSet
						.getString("quantity_suspect"), resultSet
						.getString("nature_of_nonconformance"), resultSet
						.getString("date_found"), resultSet
						.getString("reported_by"), resultSet
						.getString("temporary_action"), resultSet
						.getString("corrective_action_required"), resultSet
						.getString("disposition_required"), resultSet
						.getString("disposition"), resultSet
						.getString("disposition_complete_date"), resultSet
						.getString("name_of_disposition_responsibility"),
						resultSet.getString("cost_of_nonconformance")));

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
		return nonConformances;
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
				/*correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions (resultSet
						.getString("capa_id"),resultSet
						.getString("nc_id"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"), resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"), resultSet
						.getString("upload_external_analysis"), resultSet
						.getString("action"), resultSet
						.getString("responsibility"), resultSet
						.getString("due_date"),resultSet
						.getString("completion_date"),resultSet
						.getString("verified_by"),
						resultSet.getString("verification_date")));*/

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
				/*correctiveAndPreventiveActions.add(new CorrectiveAndPreventiveActions (resultSet
						.getString("capa_id"),resultSet
						.getString("nc_id"), resultSet
						.getString("capa_requestor"), resultSet
						.getString("request_date"), resultSet
						.getString("capa_due_date"), resultSet
						.getString("assigned_team_leader"), resultSet
						.getString("team_members"), resultSet
						.getString("root_cause_analysis_file"), resultSet
						.getString("use_5_why_in_system"), resultSet
						.getString("why"), resultSet
						.getString("root_cause_statement"), resultSet
						.getString("upload_external_analysis"), resultSet
						.getString("action"), resultSet
						.getString("responsibility"), resultSet
						.getString("due_date"),resultSet
						.getString("completion_date"),resultSet
						.getString("verified_by"),
						resultSet.getString("verification_date")));*/

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
	


	public void releaseConnection(Connection con) {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
		}
	}

	public void releaseResultSet(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
	}

	public void releaseStatement(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
	}

}
