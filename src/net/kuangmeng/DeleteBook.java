package net.kuangmeng;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DeleteBook extends ActionSupport{
	Const c=new Const();
    final String DB_URL = c.getDB_URL();
    final String USER = c.getUSER();
    final String PASS = c.getPASS();
     static final String tableName = "book";  
     static final String tbname = "user";
	private String ISBN;
	private String username;
	public String execute() throws Exception{
		int uc=UserCtrl(username);
		if(uc==1) return "back";
		Connection conn = null;
	    Statement stmt = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	   conn = DriverManager.getConnection(DB_URL,USER,PASS);
	   stmt = conn.createStatement();
	   String sql = "DELETE FROM " + tableName + " WHERE ISBN = \'"+ getISBN().trim()+"\'";  
	   stmt.executeUpdate(sql); 
	   return SUCCESS;
	}catch(SQLException s){
		   return ERROR;
	}catch(Exception e){
		   return ERROR;
	}
	}
	public int UserCtrl(String username){
		Connection conn = null;
	    Statement stmt = null;
	try{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
	   conn = DriverManager.getConnection(DB_URL,USER,PASS);
	   stmt = conn.createStatement();
	   String sql = "SELECT NO FROM " + tbname + " WHERE username = "+ "\'"+username+"\'";  
	   ResultSet rs=stmt.executeQuery(sql); 
	   if(rs.next()){
		   return rs.getInt("NO");
	   }else{
		   return 1;
	   }
	}catch(SQLException s){
		   return 1;
	}catch(Exception e){
		   return 1;
	}
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return username;
	}
	public void setISBN(String ISBN){
		this.ISBN=ISBN;
	}
	public String getISBN(){
		return ISBN;
	}
}
