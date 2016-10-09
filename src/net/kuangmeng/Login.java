package net.kuangmeng;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class Login extends ActionSupport{
	private String username;
	private String password;
	private String QQ;
	Const c=new Const();
    final String DB_URL = c.getDB_URL();
    final String USER = c.getUSER();
    final String PASS = c.getPASS();
    static final String tableName = "user";  
   public String login() throws Exception{
	   String state=SearchUsername(username);
	   if(state.equals(ERROR)){
		   return "back";
	   }
	   String qqstate=SearchQQ(QQ);
	   if(qqstate.equals(ERROR)){
		   return "qqback";
	   }
	   Connection conn = null;
	    Statement stmt = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	   conn = DriverManager.getConnection(DB_URL,USER,PASS);
	   stmt = conn.createStatement();
	String sql = "INSERT " + tableName + " VALUES(\'"+username+"\',\'"+password+"\',"+QQ+","+0+",\'"+"\',"+1+")";  
	   stmt.executeUpdate(sql); 
	   return SUCCESS;
	}catch(SQLException s){
		   return ERROR;
	}catch(Exception e){
		   return ERROR;
	}
   }
   public String getUsername(){
	   return username;
   }
   public String getPassword(){
	   return password;
   }
   public String getQQ(){
	   return QQ;
   }
   public void setUsername(String username){
	   this.username=username;
   }
   public void setPassword(String password){
	   this.password=password;
   }
   public void setQQ(String QQ){
	   this.QQ=QQ;
   }
   public String SearchUsername(String username){
	   Connection conn = null;
	   Statement stmt = null;
	 try{
		   Class.forName("com.mysql.jdbc.Driver").newInstance();
	     conn = DriverManager.getConnection(DB_URL,USER,PASS);
	     stmt = conn.createStatement();
	     String sql = "SELECT * FROM " + tableName + " WHERE username = "+ "\'"+username+"\'";  
	     ResultSet rs = stmt.executeQuery(sql); 
	     if(rs.next()){
	    	 return ERROR;
	     }else{
	    	 return SUCCESS;
	     }
	 }catch(SQLException s){
		   return ERROR;
	 }catch(Exception e){
		   return ERROR;
	 }
   }
   public String SearchQQ(String QQ){
	   Connection conn = null;
	   Statement stmt = null;
	 try{
		   Class.forName("com.mysql.jdbc.Driver").newInstance();
	     conn = DriverManager.getConnection(DB_URL,USER,PASS);
	     stmt = conn.createStatement();
	     String sql = "SELECT * FROM " + tableName + " WHERE QQ = "+ QQ;  
	     ResultSet rs = stmt.executeQuery(sql); 
	     if(rs.next()){
	    	 return ERROR;
	     }else{
	    	 return SUCCESS;
	     }
	 }catch(SQLException s){
		   return ERROR;
	 }catch(Exception e){
		   return ERROR;
	 }
   }
}
