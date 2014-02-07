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

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import qms.model.DocumentMain;
import qms.model.Form;
import qms.model.InternalAudits;

public class FormDAO extends AbstractExcelView{
	private DataSource datasource;

	
	public DataSource getDatasource() {
		return datasource;
	}


	public void setDatasource(DataSource datasource) {
		this.datasource = datasource;
	}


	public String get_formid()
	{
		 Connection con = null;
		 Statement statement = null;
		 ResultSet resultset = null;
		 String Max_id = "F1001";
		 try
		 {
			 con = datasource.getConnection();
			 statement = con.createStatement();
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }
		 try
		 {
			 String cmd_select = "select max(auto_id) as id from tbl_form";
			 resultset = statement.executeQuery(cmd_select);
			 if(resultset.next())
			 {
				 if(!resultset.getString("id").equals("null"))
				 {
					 Max_id = "F" + (Integer.parseInt(resultset.getString("id")) + 1001);
				 }
			 }
			 
		 }
		 catch(Exception e)
		 {
			 System.out.println("max"+e.toString());
			 System.out.println(e.toString());
			 releaseResultSet(resultset);
			 releaseStatement(statement);
			 releaseConnection(con);
		 }
		 finally
		 {
			releaseResultSet(resultset);
			releaseStatement(statement);
			releaseConnection(con);
		 }
		 return Max_id;
	}

	
	public boolean delete_form(String auto_no)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try
		{
			con = datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			String cmd_delete1 = "delete from tbl_form where auto_number ='"+auto_no+"'";
			status = statement.execute(cmd_delete1);
			String cmd_delete2 = "delete from tbl_form_child where auto_no ='"+auto_no+"'";
			status = statement.execute(cmd_delete2);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		finally
		{
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}
	
	public List<Form> getform()
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try
		{
			con = datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		try
		{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no");
			while(resultSet.next())
			{
			form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"),resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
			}
		}
			catch(Exception e)
			{
				System.out.println(e.toString());
				releaseResultSet(resultSet);
				releaseStatement(statement);
				releaseConnection(con);
			}
			finally
			{
				releaseResultSet(resultSet);
				releaseStatement(statement);
				releaseConnection(con);
			}
			return form;
		}
	
	
	public boolean update_form(Form form)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status = false;
		try
		{
			con= datasource.getConnection();
			statement = con.createStatement();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		try
		{
			String cmd_update1 = "update tbl_form set auto_number='"+form.getAuto_number()+"',location='"+form.getLocation()+"',form_or_rec_id='"+form.getForm_or_rec_id()+"',responsibility='"+form.getResponsibility()+"',form_or_rec_title='"+form.getForm_or_rec_title()+"',process='"+form.getProcess()+"',media_type='"+form.getMedia_type()+"',retention_time='"+form.getRetention_time()+"',form='"+form.getForm()+"',attachment_name='"+form.getAttachment_name()+"',attachment_type='"+form.getAttachment_type()+"',attachment_referrence='"+form.getAttachment_referrence()+"' where auto_number='"+form.getAuto_number()+"'";
			statement.execute(cmd_update1);
			String cmd_update2="update tbl_form_child set auto_no='"+form.getAuto_no()+"',effective_date='"+form.getEffective_date()+"',document_id='"+form.getDocument_id()+"',approver1='"+form.getApprover1()+"',issuer='"+form.getIssuer()+"',comments='"+form.getComments()+"' where auto_no='"+form.getAuto_no()+"'";
		    statement.execute(cmd_update2);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		finally
		{
			releaseResultSet(resultSet);
			releaseStatement(statement);
			releaseConnection(con);
		}
		return status;
	}
	
	public boolean insert_form(Form form)
	{
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		boolean status=false;
		
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		  try{
			  System.out.println("inserting");
			  String cmd_insert1="insert into tbl_form(auto_number,location,form_or_rec_id,responsibility,form_or_rec_title,process,media_type,retention_time,form,attachment_name,attachment_type,attachment_referrence) values('"+form.getAuto_number()+"','"+form.getLocation()+"','"+form.getForm_or_rec_id()+"','"+form.getResponsibility()+"','"+form.getForm_or_rec_title()+"','"+form.getProcess()+"','"+form.getMedia_type()+"','"+form.getRetention_time()+"','"+form.getForm()+"','"+form.getAttachment_name()+"','"+form.getAttachment_type()+"','"+form.getAttachment_referrence()+"')"; 
			  statement.execute(cmd_insert1);
			  
			  /*String cmd_insert1="insert into tbl_doccontrol_main(document_id,document_title,document_type,media_type,location,process,external,attachment_name,attachment_type,attachment_referrence) values('"+documentMain.getDocument_id()+"','"+documentMain.getDocument_title()+"','"+documentMain.getDocument_type()+"','"+documentMain.getMedia_type()+"','"+documentMain.getLocation()+"','"+documentMain.getProcess()+"','"+documentMain.getExternal()+"','"+documentMain.getAttachment_name()+"','"+documentMain.getAttachment_type()+"','"+documentMain.getAttachment_referrence()+"')";
			  statement.execute(cmd_insert1);*/
			  
			  String cmd_insert2="";	
				 cmd_insert2="insert into tbl_form_child(auto_no,effective_date,document_id,approver1,issuer,comments) values('"+form.getAuto_no()+"','"+form.getEffective_date()+"','"+form.getDocument_id()+"','"+form.getApprover1()+"','"+form.getIssuer()+"','"+form.getComments()+"')";
				 statement.execute(cmd_insert2);
		
			 status=true;
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
	
	
	
	public List<Form> getform(String auto_no){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
	    	resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no ");
			System.out.println("came");
			while(resultSet.next()){
								form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
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
	    return form;
		
	}
	
	/*public List<Form> getform(String recordtitle,
			String mediatype, String retentiontime) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
		try {
			
			String cmd="";
			
			cmd = "select * from tbl_form as t1 join tbl_form_child as t2 on t1.auto_id=t2.auto_id where t1.form_or_rec_title='"+ recordtitle +"' or t1.form_media_type='"+ mediatype +"' or t1.retention_time='"+ retentiontime +"'";
			
			resultSet = statement.executeQuery(cmd);
		while (resultSet.next()) {
			form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
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
		return form;

	}*/
	
	public List<Form> search_form(String auto_number,String form_or_rec_id,String document_id) {
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		//boolean status = false;
		System.out.println("auto_number");
		List<Form> form = new ArrayList<Form>();

		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where t1.auto_number='"+auto_number+"'or t1.form_or_rec_id='"+form_or_rec_id+"' or t2.document_id='"+document_id+"'");

		//	String cmd_select = "select * from tb1_internalaudits";
			//resultSet = statement.executeQuery(cmd_select);
			while (resultSet.next()) {
							
								
				form.add(new Form(resultSet
						.getString("auto_number"), resultSet
						.getString("location"), resultSet
						.getString("form_or_rec_id"), resultSet
						.getString("responsibility"), resultSet
						.getString("form_or_rec_title"), resultSet
						.getString("process"), resultSet
						.getString("media_type"), resultSet
						.getString("retention_time"), resultSet
						.getString("form"), resultSet
						.getString("attachment_name"),resultSet
						.getString("attachment_type"), resultSet
						.getString("attachment_referrence"), resultSet
						.getString("auto_no"), resultSet
						.getString("effective_date"), resultSet
						.getString("document_id"), resultSet
						.getString("approver1"), resultSet
						.getString("issuer"), resultSet
						.getString("comments")));
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
		return form;
	}
	
	public List<Form> gethuman_resources(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where form_or_rec_id LIKE  'FHR%'");
			System.out.println("fhr");
			while(resultSet.next()){
				form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
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
	    return form;
		
	}
	
	
	public List<Form> getengineering(){
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			con = datasource.getConnection();
			statement = con.createStatement();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		List<Form> form = new ArrayList<Form>();
	    try{
			resultSet = statement.executeQuery("select t1.*,t2.* from tbl_form as t1 join tbl_form_child as t2 on t1.auto_number=t2.auto_no where form_or_rec_id LIKE  'FEN%'");
			System.out.println("fen");
			while(resultSet.next()){
				form.add(new Form(resultSet.getString("auto_number"), resultSet.getString("location"), resultSet.getString("form_or_rec_id"),resultSet.getString("responsibility"),resultSet.getString("form_or_rec_title"), resultSet.getString("process"), resultSet.getString("media_type"),resultSet.getString("retention_time"),resultSet.getString("form"),resultSet.getString("attachment_name"),resultSet.getString("attachment_type"),resultSet.getString("attachment_referrence"), resultSet.getString("auto_no"),resultSet.getString("effective_date"),resultSet.getString("document_id"),resultSet.getString("approver1"),resultSet.getString("issuer"),resultSet.getString("comments")));
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
	    return form;
		
	}
	
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HSSFSheet excelSheet = workbook.createSheet("Form Report");
		excelSheet.setDefaultColumnWidth(20);
		  
		//Style 1
		CellStyle style = workbook.createCellStyle();
	        Font font = workbook.createFont();
	        font.setFontName("Arial");
	        style.setFillForegroundColor(HSSFColor.BROWN.index);
	        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        style.setWrapText(true);
	        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font.setColor(HSSFColor.WHITE.index);
	        style.setFont(font);
		
	    //Style2
	        CellStyle style2 = workbook.createCellStyle();
	        Font font2 = workbook.createFont();
	        font2.setFontName("Arial");
	        style2.setFillForegroundColor(HSSFColor.YELLOW.index);
	        style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        style2.setWrapText(true);
	        font2.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	        font2.setColor(HSSFColor.WHITE.index);
	        style2.setFont(font2); 
		
		@SuppressWarnings("unchecked")
		List<Form> form = (List<Form>) model.get("form");
		String[] fields=(String[])model.get("fields");
		

        setExcelHeader(excelSheet,style,fields);
		
		setExcelRows(excelSheet,form,fields,style2);
		
	}
	
	
	public void setExcelHeader(HSSFSheet excelSheet,CellStyle style,String[] fields) {
		HSSFRow excelHeader = excelSheet.createRow(0);	
	//	String[] fields={"document_id","document_title","document_type","media_type","location","process","external","issuer","revision_level","date","approver1","approver2","approver3","status","comments"};
		int i=0;
		for (String field : fields) {
			
			if(field.equals("auto_number"))
			{
				excelHeader.createCell(i).setCellValue("Auto Number");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("location"))
			{
				excelHeader.createCell(i).setCellValue("Location");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("form_or_rec_id"))
			{
				excelHeader.createCell(i).setCellValue("Form/Rec Id");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			else if(field.equals("responsibility"))	
			{
				excelHeader.createCell(i).setCellValue("Responsibility");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("form_or_rec_title"))	
			{
				excelHeader.createCell(i).setCellValue("Form/Rec Title");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("process"))	
			{
				excelHeader.createCell(i).setCellValue("Process");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("media_type"))
			{
				excelHeader.createCell(i).setCellValue("Media Type");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("retention_time"))	
			{
				excelHeader.createCell(i).setCellValue("Retention Time");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("form"))	
			{
				excelHeader.createCell(i).setCellValue("Form");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("effective_date"))	
			{
				excelHeader.createCell(i).setCellValue("Effective Date");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("document_id"))	
			{
				excelHeader.createCell(i).setCellValue("Document Id");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("approver1"))	
			{
				excelHeader.createCell(i).setCellValue("Approver 1");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("issuer"))	
			{
				excelHeader.createCell(i).setCellValue("Issuer");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}else if(field.equals("comments"))	
			{
				excelHeader.createCell(i).setCellValue("Comments");
				excelHeader.getCell(i).setCellStyle(style);
				i++;
			}
			
		}
	
	}
	
	
	//End
	
	
	public void setExcelRows(HSSFSheet excelSheet, List<Form> form,String[] fields,CellStyle style2){
		int record = 1;
		int i=0;
		for (Form forms:form){	
			HSSFRow excelRow = excelSheet.createRow(record++);
	//		excelRow.setRowStyle((HSSFCellStyle) style2);
		i=0;
				for (String field : fields) {
					
					if(field.equals("auto_number"))
					{
						excelRow.createCell(i).setCellValue(
								forms.getAuto_number());
							i++;
					}
					else if(field.equals("location"))
					{
						excelRow.createCell(i).setCellValue(
								forms.getLocation());

						i++;
					}
					else if(field.equals("form_or_rec_id"))
					{
						excelRow.createCell(i).setCellValue(
								forms.getForm_or_rec_id()
								);	i++;
					}
					else if(field.equals("responsibility"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getResponsibility());
						i++;
					}else if(field.equals("form_or_rec_title"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getForm_or_rec_title());
						i++;
					}else if(field.equals("process"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getProcess());
						i++;
					}else if(field.equals("media_type"))
					{
						excelRow.createCell(i).setCellValue(
								forms.getMedia_type());
						i++;
					}else if(field.equals("retention_time"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getRetention_time());
						i++;
					}else if(field.equals("form"))	
					{
						if(forms.getForm().equals("1"))
							excelRow.createCell(i).setCellValue("Yes");
							else
								excelRow.createCell(i).setCellValue("No");
							i++;
					}else if(field.equals("effective_date"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getEffective_date());
						i++;
					}else if(field.equals("document_id"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getDocument_id());
						i++;
					}else if(field.equals("approver1"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getApprover1());
						i++;
					}else if(field.equals("issuer"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getIssuer());
						i++;
					}else if(field.equals("comments"))	
					{
						excelRow.createCell(i).setCellValue(
								forms.getComments());
						i++;
					}
					
				}
				
				
				
				
				
				
				
				
				
		}
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