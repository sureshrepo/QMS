//http://www.compuware.com/content/dam/compuware/application-development/whitepapers/wp_dataconversion.pdf
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


import qms.model.InternalAudits;
import qms.model.Maintenance;





public class MaintenanceDAO extends AbstractExcelView
{
	private DataSource dataSource;
	 
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	
	//Excel view format creation
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook ,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		response.setHeader("Content-Disposition","attachment;filename='"+(String)model.get("title")+"'");
		
		HSSFSheet excelSheet = workbook.createSheet((String)model.get("title"));
		@SuppressWarnings("unchecked")
		List<Maintenance> maintenance=(List<Maintenance>) model.get("maintenance");
		
		String[] fields=(String[])model.get("fields");
		System.out.println(fields[0]);
		setExcelHeader(excelSheet,maintenance,fields);
		setExcelRows(excelSheet,maintenance,fields);
		
	}
	
	//creating header records
	public void setExcelHeader(HSSFSheet excelSheet,List<Maintenance> maintenance,String[] fields)
	{
		HSSFRow excelHeader = excelSheet.createRow(0);
		int record = 0;
		
			for(String field:fields)
			{
				if (field.equals("equipment_id")) 
				{
					
					excelHeader.createCell(record++).setCellValue(
							"EQUIPMENT ID");
					
				}
				else if (field.equals("equipment_name")) {
					excelHeader.createCell(record++).setCellValue(
							"EQUIPMENT NAME");
					}
				else if (field.equals("equipment_model")) {
					excelHeader.createCell(record++).setCellValue(
							"EQUIPMENT MODEL");
					} 
				else if (field.equals("serial_number")) {
					excelHeader.createCell(record++).setCellValue(
							"SERIAL NUMBER");
					}
				else if (field.equals("date_acquired")) {
					excelHeader.createCell(record++).setCellValue(
							"DATE ACQUIRED");
					}
				
				else if (field.equals("equipment_status")) {
					excelHeader.createCell(record++).setCellValue(
							"EQUIPMENT STATUS");
					}
				else if (field.equals("frequency_maintenance")) {
					excelHeader.createCell(record++).setCellValue(
							"FREQUENCY MAINTENANCE");}
				else if (field.equals("calibration")) {
					excelHeader.createCell(record++).setCellValue(
							"CALIBRATION");
					}
				else if (field.equals("type_of_maintenance")) {
					excelHeader.createCell(record++).setCellValue(
							"TYPE OF MAINTENANCE");
					}
				else if (field.equals("maintenance_frequency")) {
					excelHeader.createCell(record++).setCellValue(
							"MAINTENANCE FREQUENCY");
					}
				else if (field.equals("reference")) {
					excelHeader.createCell(record++).setCellValue(
							"REFERENCE");
					}
				else if (field.equals("instructions")) {
					excelHeader.createCell(record++).setCellValue(
							"INSTRUCTIONS");
					}
				else if (field.equals("due_date")) {
					excelHeader.createCell(record++).setCellValue(
							"DUE DATE");
					}
				else if (field.equals("completion_date")) {
					excelHeader.createCell(record++).setCellValue(
							"COMPLETION DATE");
					}
				else if (field.equals("completed_by")) {
					excelHeader.createCell(record++).setCellValue(
							"COMPLETED BY");
					}
				else if (field.equals("notes")) {
					excelHeader.createCell(record++).setCellValue(
							"NOTES");
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
		
	public void setExcelRows(HSSFSheet excelSheet, List<Maintenance> maintenance,String[] fields){
		int record = 1,column=0;
		
		for (Maintenance maintenances:maintenance ){	
			
			HSSFRow excelRow = excelSheet.createRow(record++);
			
			for(String field:fields)
			{
				if (field.equals("equipment_id")) 
				{
					
					excelRow.createCell(column++).setCellValue(
							maintenances.getEquipment_id());
					
				}
				else if (field.equals("equipment_name")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getEquipment_name());
					}
				else if (field.equals("equipment_model")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getEquipment_model());
					} 
				else if (field.equals("serial_number")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getSerial_number());
					}
				else if (field.equals("date_acquired")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getDate_acquired());
					}
				
				else if (field.equals("equipment_status")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getEquipment_status());
					}
				else if (field.equals("frequency_maintenance")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getFrequency_maintenance());}
				else if (field.equals("calibration")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getCalibration());
					}
				else if (field.equals("type_of_maintenance")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getType_of_maintenance());
					}
				else if (field.equals("maintenance_frequency")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getMaintenance_frequency());
					}
				else if (field.equals("reference")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getReference());
					}
				else if (field.equals("instructions")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getInstructions());
					}
				else if (field.equals("due_date")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getDue_date());
					}
				else if (field.equals("completion_date")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getCompletion_date());
					}
				else if (field.equals("completed_by")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getCompleted_by());
					}
				else if (field.equals("notes")) {
					excelRow.createCell(column++).setCellValue(
							maintenances.getNotes());
					}
				
			}
			column=0;
			}
			
	}
	
	//Insert operation
	public boolean insert_maintenance(Maintenance maintenance) {
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
			String cmd_insert = "insert into tbl_maintenance(equipment_id,equipment_name,equipment_model,serial_number,date_acquired,equipment_status,frequency_maintenance,calibration)values('"+maintenance.getEquipment_id()+"','"+maintenance.getEquipment_name()+"','"+maintenance.getEquipment_model()+"','"+maintenance.getSerial_number()+"','"+maintenance.getDate_acquired()+"','"+maintenance.getEquipment_status()+"','"+maintenance.getFrequency_maintenance()+"','"+maintenance.getCalibration()+"')";
			String cmd_insert1 = "insert into tbl_maintenancechild(equipmentid,type_of_maintenance,maintenance_frequency,reference,instructions,due_date,completion_date,completed_by,notes)values('"+maintenance.getEquipmentid()+"','"+maintenance.getType_of_maintenance()+"','"+maintenance.getMaintenance_frequency()+"','"+maintenance.getReference()+"','"+maintenance.getInstructions()+"','"+maintenance.getDue_date()+"','"+maintenance.getCompletion_date()+"','"+maintenance.getCompleted_by()+"','"+maintenance.getNotes()+"')";
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
	
	//Search operation for find a particular record
	public List<Maintenance>  search_maintenance(String equipment_id,String equipment_name,String date_acquired) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("equipment_id");
		
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			

			String cmd_select = "select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where equipment_id='"+equipment_id+"'or equipment_name='"+equipment_name+"' or date_acquired='"+date_acquired+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("maintenance_frequency"), resultSet
						.getString("reference"), resultSet
						.getString("instructions"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));

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
		return maintenance;
	}
		
		
	//Request method
	public List<Maintenance> getmaintenance() {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select t1.*,t2.* from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid ";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("maintenance_frequency"), resultSet
						.getString("reference"), resultSet
						.getString("instructions"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));

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
		return maintenance;
	}

	//Get request method
	public List<Maintenance> getmaintenance(String equipment_id){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
	    try{
	    	String cmd_select = "select * from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("maintenance_frequency"), resultSet
						.getString("reference"), resultSet
						.getString("instructions"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));


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
	    return maintenance;
		
	}
	
	//Edit operation
	public List<Maintenance> edit_maintenance(String equipment_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<Maintenance> maintenance = new ArrayList<Maintenance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = "select * from tbl_maintenance as t1 join tbl_maintenancechild as t2 on t1.equipment_id=t2.equipmentid where t1.equipment_id='"+equipment_id+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("maintenance_frequency"), resultSet
						.getString("reference"), resultSet
						.getString("instructions"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));

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
		return maintenance;
	}

	//Update Operation
	public boolean update_maintenance(Maintenance maintenance) {
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
			
			String cmd_update = "update tbl_maintenance set equipment_id='"+maintenance.getEquipment_id()+"',equipment_name='"+maintenance.getEquipment_name()+"',equipment_model='"+maintenance.getEquipment_model()+"',serial_number='"+maintenance.getSerial_number()+"',date_acquired='"+maintenance.getDate_acquired()+"',equipment_status='"+maintenance.getEquipment_status()+"',frequency_maintenance='"+maintenance.getFrequency_maintenance()+"',calibration='"+maintenance.getCalibration()+"' where equipment_id='"+maintenance.getEquipment_id()+"'";
			String cmd_update1 = "update tbl_maintenancechild set equipmentid='"+maintenance.getEquipmentid()+"',type_of_maintenance='"+maintenance.getType_of_maintenance()+"',maintenance_frequency='"+maintenance.getMaintenance_frequency()+"',reference='"+maintenance.getReference()+"',instructions='"+maintenance.getInstructions()+"',due_date='"+maintenance.getDue_date()+"',completion_date='"+maintenance.getCompletion_date()+"',completed_by='"+maintenance.getCompleted_by()+"',notes='"+maintenance.getNotes()+"' where equipmentid='"+maintenance.getEquipmentid()+"'";
			
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
	
	
	//Delete Operation
	public boolean delete_maintenance(String equipment_id) {
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
			String cmd_delete = "delete from tbl_maintenance where equipment_id='"+ equipment_id + "'";
			String cmd_delete1 = "delete from tbl_maintenancechild where equipmentid='"+ equipment_id + "'";
			
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
	
	//report request passing
	public List<Maintenance> getMaintenance_bytype(String type,int no_of_days)
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
		
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
	    try{
	    	
	   if(type.equals("maintain_for_30"))
		//resultSet = statement.executeQuery("select * from tbl_maintenance where due_date between now() and DATE_ADD(NOW(), INTERVAL 30 DAY)" );
			resultSet = statement.executeQuery("select * from tbl_maintenance" );

		   else if(type.equals("maintain_for_ndays"))
			resultSet = statement.executeQuery("select * from tbl_maintenancechild as t1 join tbl_maintenance as t2 on t1.equipmentid=t2.equipment_id where due_date between now() and DATE_ADD(NOW(),INTERVAL no_of_days DAY)" );
	   else if(type.equals("past_due_maintenance"))
			resultSet = statement.executeQuery("select * from tbl_maintenance where due_date<now()");
	   else if(type.equals("past_due_calibration"))
			resultSet = statement.executeQuery("select * from tbl_maintenance where due_date<now() and calibration='yes'" );
	   else
			resultSet = statement.executeQuery("select * from tbl_maintenance where due_date between now() and DATE_ADD(NOW())" );
		 
		   
	   while(resultSet.next()){
		   
			System.out.println(maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("maintenance_frequency"), resultSet
						.getString("reference"), resultSet
						.getString("instructions"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes"))));

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
	    return maintenance;
		
	}

public  List<Maintenance> getlimitedmaintenancereport(int page) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
		  try {

			String cmd;
			int offset = 5 * (page - 1);
			int limit = 5;
					cmd="select * from tbl_maintenance limit " + offset + ","+ limit+"" ;
				
				//	cmd = "select * from tbl_narrativereport order by pname asc limit " + offset + ","+ limit+"" ;

			resultSet = statement.executeQuery(cmd);
			while(resultSet.next()){
				maintenance.add(new Maintenance(resultSet
						.getString("equipment_id"), resultSet
						.getString("equipment_name"), resultSet
						.getString("equipment_model"), resultSet
						.getString("serial_number"), resultSet
						.getString("date_acquired"), resultSet
						.getString("equipment_status"), resultSet
						.getString("frequency_maintenance"), resultSet
						.getString("calibration"), resultSet
						.getString("equipmentid"), resultSet
						.getString("type_of_maintenance"), resultSet
						.getString("maintenance_frequency"), resultSet
						.getString("reference"), resultSet
						.getString("instructions"), resultSet
						.getString("due_date"), resultSet
						.getString("completion_date"),resultSet
						.getString("completed_by"),
						resultSet.getString("notes")));
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
		return maintenance;

	}
	public int getnoofmaintenancereport() {
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
		List<Maintenance> maintenance = new ArrayList<Maintenance>();
		try {

			String cmd;
				cmd = "select count(*) as noofrecords from tbl_maintenance ";
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
		