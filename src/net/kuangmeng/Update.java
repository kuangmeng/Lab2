package net.kuangmeng;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class Update extends ActionSupport{
      private String ISBN;
      private String username;
      Const c=new Const();
      final String DB_URL = c.getDB_URL();
      final String USER = c.getUSER();
      final String PASS = c.getPASS();
      static final String tableName = "book";  
public String execute() throws Exception {
	int userctrl=getUserCtrl(username);
	if(userctrl==1) return "back";
	if(!getISBN().equals("")) return SUCCESS;
	else return ERROR;
}
public String getISBN(){
	return ISBN;
}
public void setISBN(String ISBN){
	this.ISBN=ISBN;
}

public void setUsername(String username){
	this.username=username;
}
public String getUsername(){
	return username;
}
public int getUserCtrl(String username){
    Connection conn = null;
    Statement stmt = null;
 try{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
     conn = DriverManager.getConnection(DB_URL,USER,PASS);
     stmt = conn.createStatement();
     String sql = "SELECT * FROM user "+" where username = "+"\'"+username+"\'";  
     ResultSet rs = stmt.executeQuery(sql); 
     if(rs.next()){
    	 return rs.getInt("NO");
     }
     else return 1;
 }catch(SQLException s){
	   return 1;
 }catch(Exception e){
	   return 1;
 }
}
}