package qms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import qms.model.SupplierPerformance;


public class SupplierPerformanceDAO extends AbstractExcelView {
	private DataSource dataSource;
	
	/* 
	 * Excel Sheet Generation
	 */
	 
	protected void buildExcelDocument(Map model,HSSFWorkbook workbook,
			HttpServletRequest request,HttpServletResponse response)
			throws Exception
							{
								System.out.println("excelsheet documents......");
		
								HSSFSheet excelSheet = workbook.createSheet("SupplierPerformance Report");
								excelSheet.setDefaultColumnWidth(20);
								
								//style1
								CellStyle style = workbook.createCellStyle();
								Font font = workbook.createFont();
								font.setFontName("Arial");
								style.setFillForegroundColor(HSSFColor.BROWN.index);
								style.setFillPattern(CellStyle.SOLID_FOREGROUND);
								style.setWrapText(true);
								font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
								font.setColor(HSSFColor.WHITE.index);
								style.setFont(font);
								
								//style2
								CellStyle style2 = workbook.createCellStyle();
								Font font2= workbook.createFont();
								font2.setFontName("Arial");
								style2.setFillForegroundColor(HSSFColor.YELLOW.index);
								style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
								style2.setWrapText(true);
								font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
								font2.setColor(HSSFColor.WHITE.index);
								style2.setFont(font2);
								
								@SuppressWarnings("unchecked")
								List<SupplierPerformance> supplierPerformances = (List<SupplierPerformance>) model.get("supplierPerformances");
								String[] fields = (String[])model.get("fields");
								setExcelHeader(excelSheet,style,fields);
								setExcelRows(excelSheet,supplierPerformances,fields,style2);
								
								System.out.println("came.");
							}
	
	public DataSource getDataSource() {
		return dataSource;
	}



	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	//creating header records
	public void setExcelHeader(HSSFSheet excelSheet,CellStyle style,String[] fields) {
		HSSFRow excelHeader = excelSheet.createRow(0);	
	int i=0;
		for (String field : fields) {
			
			if(field.equals("supplier_id"))
			{
				excelHeader.createCell(i).setCellValue("ID");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("supplier_name"))
			{
				excelHeader.createCell(i).setCellValue("Supplier Name");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("category"))
			{
				excelHeader.createCell(i).setCellValue("Category");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("address"))
			{
				excelHeader.createCell(i).setCellValue("Address");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("city"))
			{
				excelHeader.createCell(i).setCellValue("City");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("state"))
			{
				excelHeader.createCell(i).setCellValue("State");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("postalcode"))	
			{
				excelHeader.createCell(i).setCellValue("Postal Code");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("country"))	
			{
				excelHeader.createCell(i).setCellValue("Country");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("website"))	
			{
				excelHeader.createCell(i).setCellValue("Website");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("certified_to"))
			{
				excelHeader.createCell(i).setCellValue("Certified To");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("contact_name"))	
			{
				excelHeader.createCell(i).setCellValue("Contact Name");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("contact_title"))	
			{
				excelHeader.createCell(i).setCellValue("Contact Title");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("phone"))	
			{
				excelHeader.createCell(i).setCellValue("Phone");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("fax"))	
			{
				excelHeader.createCell(i).setCellValue("Fax");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("email_address"))	
			{
				excelHeader.createCell(i).setCellValue("Email Address");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
		}
	
	}
	
	
	//End
	
	
	//creating cell records
	public void setExcelRows(HSSFSheet excelSheet, List<SupplierPerformance> supplierPerformances,String[] fields,CellStyle style2){
		int record = 1;
		int i=0;
		for (SupplierPerformance supplierPerformance:supplierPerformances){	
			HSSFRow excelRow = excelSheet.createRow(record++);
	//		excelRow.setRowStyle((HSSFCellStyle) style2);
		i=0;
				for (String field : fields) {
					
					if(field.equals("supplier_id"))
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getSupplier_id());
							i++;
					}
					else if(field.equals("supplier_name"))
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getSupplier_name());

						i++;
					}
					else if(field.equals("category"))
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getCategory());
								i++;
					}
					else if(field.equals("address"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getAddress());
						i++;
					}else if(field.equals("city"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getCity());
						i++;
					}else if(field.equals("state"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getState());
						i++;
					}else if(field.equals("postalcode"))
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getPostalcode());
						i++;
					}else if(field.equals("country"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getCountry());
						i++;
					}else if(field.equals("website"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getWebsite());
						i++;
					}else if(field.equals("certified_to"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getCertified_to());
						i++;
					}else if(field.equals("contact_name"))	
					{
						excelRow.createCell(i).setCellValue(supplierPerformance.getContact_name());
							i++;
					
					}else if(field.equals("contact_title"))	
					{
						excelRow.createCell(i).setCellValue(supplierPerformance.getContact_title());
						i++;
					}else if(field.equals("phone"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getPhone());
						i++;
					}else if(field.equals("fax"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getFax());
						i++;
					}else if(field.equals("email_address"))	
					{
						excelRow.createCell(i).setCellValue(
								supplierPerformance.getEmail_address());
						i++;
					}
					
				}
				
		}
	}
	
	//Getting unique id
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
					Max_id = "SP"
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

	
	//Delete operation
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
	
	//request method
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
	
	//Update operation
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
	
	//Insert operation
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
	
	//getting the supplierperformance list details
	public List<SupplierPerformance> list_supplierperformance(String supplier_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select * from tbl_supplierperformance where supplier_id='"+supplier_id+"'");
			while (resultSet.next()) {
							
				supplierPerformances.add(new SupplierPerformance(resultSet.getString("supplier_id"), resultSet.getString("supplier_name"), resultSet.getString("category"), resultSet.getString("address"), resultSet.getString("city"), resultSet.getString("state"), resultSet.getString("postalcode"), resultSet.getString("country"), resultSet.getString("website"), resultSet.getString("certified_to"), resultSet.getString("contact_name"), resultSet.getString("contact_title"), resultSet.getString("phone"), resultSet.getString("fax"), resultSet.getString("email_address")));
			System.out.println("Dao list result....");
			}
		} catch (Exception e) {
			System.out.println("error occured in dao...");
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
	
	
	
	
	//Search operation for find a particular records
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
			supplierPerformances.add(new SupplierPerformance(
					resultSet.getString("supplier_id"), 
					resultSet.getString("supplier_name"), 
					resultSet.getString("category"), 
					resultSet.getString("address"), 
					resultSet.getString("city"), 
					resultSet.getString("state"), 
					resultSet.getString("postalcode"), 
					resultSet.getString("country"), 
					resultSet.getString("website"), 
					resultSet.getString("certified_to"), 
					resultSet.getString("contact_name"), 
					resultSet.getString("contact_title"), 
					resultSet.getString("phone"), 
					resultSet.getString("fax"), 
					resultSet.getString("email_address")));
			

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
	
	//REPORT GENERATION
	public List<SupplierPerformance> get_supplierperformance_type(String type)
	 {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		List<SupplierPerformance> supplierPerformances = new ArrayList<SupplierPerformance>();

		try {
			con = dataSource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			String cmd_select = null;
			
			if(type=="opensupplierperformance")
				cmd_select= "select * from tbl_supplierperformance" ;
			//cmd_select= "select * from tbl_supplierperformance where disposition==0 AND disposition_complete_date==NULL" ;
			
		/*		else if(type=="nodispositionover30days")
				//	cmd_select="select * from tbl_supplierperformance where disposition_complete_date between now() and DATE_ADDNOW(), INTERVAL 30 DAYS";
					cmd_select="select * from tbl_supplierperformance  WHERE   disposition_complete_date BETWEEN NOW() + INTERVAL 30 DAY AND NOW()";
					else if(type=="defined")
						cmd_select="select * from tbl_supplierperformance where disposition_complete_date between start AND end";
		*/	resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
				System.out.println(" type result");
				supplierPerformances.add(new SupplierPerformance(
						resultSet.getString("supplier_id"), 
						resultSet.getString("supplier_name"), 
						resultSet.getString("category"), 
						resultSet.getString("address"), 
						resultSet.getString("city"), 
						resultSet.getString("state"), 
						resultSet.getString("postalcode"), 
						resultSet.getString("country"), 
						resultSet.getString("website"), 
						resultSet.getString("certified_to"), 
						resultSet.getString("contact_name"), 
						resultSet.getString("contact_title"), 
						resultSet.getString("phone"), 
						resultSet.getString("fax"), 
						resultSet.getString("email_address")));
				

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
		return supplierPerformances;
	}




}
