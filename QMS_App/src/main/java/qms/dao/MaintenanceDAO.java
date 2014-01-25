package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import qms.model.Maintenance;
import qms.model.NonConformance;




public class MaintenanceDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
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
			String cmd_insert = "insert into tbl_maintenance(equipment_id,equipment_name,equipment_model,serial_number,date_acquired,equipment_status,frequency_maintenance,calibration,equipmentid,type_of_maintenance,maintenance_frequency,reference,instructions,due_date,completion_date,completed_by,notes)values('"+maintenance.getEquipment_id()+"','"+maintenance.getEquipment_name()+"','"+maintenance.getEquipment_model()+"','"+maintenance.getSerial_number()+"','"+maintenance.getDate_acquired()+"','"+maintenance.getEquipment_status()+"','"+maintenance.getFrequency_maintenance()+"','"+maintenance.getCalibration()+"','"+maintenance.getEquipmentid()+"','"+maintenance.getType_of_maintenance()+"','"+maintenance.getMaintenance_frequency()+"','"+maintenance.getReference()+"','"+maintenance.getInstructions()+"','"+maintenance.getDue_date()+"','"+maintenance.getCompletion_date()+"','"+maintenance.getCompleted_by()+"','"+maintenance.getNotes()+"')";
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
			String cmd_select = "select * from tbl_maintenance";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("auto_equip"),resultSet
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

	public List<Maintenance> getmaintenance(String auto_equip){
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
			resultSet = statement.executeQuery("select * from tbl_maintenance where auto_equip='"+auto_equip+"'" );
			while(resultSet.next()){
				maintenance.add(new Maintenance(resultSet
						.getString("auto_equip"),resultSet
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
	
	public List<Maintenance> edit_maintenance(String auto_equip) {
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
			String cmd_select = "select * from tbl_maintenance where auto_equip='"+auto_equip+"'";
			resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				
				maintenance.add(new Maintenance(resultSet
						.getString("auto_equip"),resultSet
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
			
			String cmd_update = "update tbl_maintenance set equipment_id='"+maintenance.getEquipment_id()+"',equipment_name='"+maintenance.getEquipment_name()+"',equipment_model='"+maintenance.getEquipment_model()+"',serial_number='"+maintenance.getSerial_number()+"',date_acquired='"+maintenance.getDate_acquired()+"',equipment_status='"+maintenance.getEquipment_status()+"',frequency_maintenance='"+maintenance.getFrequency_maintenance()+"',calibration='"+maintenance.getCalibration()+"',type_of_maintenance='"+maintenance.getType_of_maintenance()+"',maintenance_frequency='"+maintenance.getMaintenance_frequency()+"',reference='"+maintenance.getReference()+"',instructions='"+maintenance.getInstructions()+"',due_date='"+maintenance.getDue_date()+"',completion_date='"+maintenance.getCompletion_date()+"',completed_by='"+maintenance.getCompleted_by()+"',notes='"+maintenance.getNotes()+"' where auto_equip='"+maintenance.getAuto_equip()+"'";
			
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
	
	
	
	public boolean delete_maintenance(String auto_equip) {
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
			String cmd_delete = "delete from tbl_maintenance where auto_equip='"+ auto_equip + "'";
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
	
	public List<Maintenance> generate_report(String type,String no_of_days){
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
			resultSet = statement.executeQuery("select * from tbl_maintenance where due_date between now() and DATE_ADD(NOW(), INTERVAL 30 DAY)" );
	   else if(type.equals("maintain_for_ndays"))
			resultSet = statement.executeQuery("select * from tbl_maintenance where due_date between now() and DATE_ADD(NOW(), INTERVAL '"+Integer.parseInt(no_of_days)+"' DAY)" );
	   else if(type.equals("past_due_maintenance"))
			resultSet = statement.executeQuery("select * from tbl_maintenance where due_date<now()");
	   else if(type.equals("past_due_calibration"))
			resultSet = statement.executeQuery("select * from tbl_maintenance where due_date<now() and calibration='yes'" );
	   else
			resultSet = statement.executeQuery("select * from tbl_maintenance where due_date between now() and DATE_ADD(NOW(), INTERVAL '"+Integer.parseInt(no_of_days)+"' DAY)" );
		 
		   
	   while(resultSet.next()){
				maintenance.add(new Maintenance(resultSet
						.getString("auto_equip"),resultSet
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
		