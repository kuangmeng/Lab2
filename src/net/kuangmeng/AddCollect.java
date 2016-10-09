package net.kuangmeng;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class AddCollect extends ActionSupport{
    static final String tableName = "user"; 
    Const c=new Const();
    final String DB_URL = c.getDB_URL();
    final String USER = c.getUSER();
    final String PASS = c.getPASS();
    private String ISBN;
    private String username;
	public String execute() throws Exception{
		String state=SearchCollect(getUsername().trim());
		int num=GetCollectnum(getUsername().trim());
		if(state.equals(ERROR) || num==-1){
			return ERROR;
		}else if(state.contains("+"+ISBN+"+") || state.endsWith("+"+ISBN)){
			return "back";
		}
		Connection conn = null;
	    Statement stmt = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	   conn = DriverManager.getConnection(DB_URL,USER,PASS);
	   stmt = conn.createStatement();
	   String sql = "update "+tableName+" set collect = \'"+state+"+"+getISBN().trim()+"\' where username = \'" +getUsername().trim()+"\'"; 
	   stmt.executeUpdate(sql); 
	   sql = "update "+tableName+" set collectnum = "+(num+1)+" where username = \'" +getUsername().trim()+"\'"; 
	   stmt.executeUpdate(sql); 
	   return SUCCESS;
	}catch(SQLException s){
		   return ERROR;
	}catch(Exception e){
		   return ERROR;
	}
	}
public String SearchCollect(String username){
		Connection conn = null;
	    Statement stmt = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	   conn = DriverManager.getConnection(DB_URL,USER,PASS);
	   stmt = conn.createStatement();
	   String sql = "SELECT * FROM " + tableName + " WHERE username  = \'"+ username+"\'";  
	   ResultSet rs=stmt.executeQuery(sql);
	   if(rs.next()){
		   return rs.getString("collect");
	   }else{
		   return ERROR;
	   }
	}catch(SQLException s){
		   return ERROR;
	}catch(Exception e){
		   return ERROR;
	}	
	}
public int GetCollectnum(String username){
	Connection conn = null;
    Statement stmt = null;
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn = DriverManager.getConnection(DB_URL,USER,PASS);
   stmt = conn.createStatement();
   String sql = "SELECT * FROM " + tableName + " WHERE username = \'"+ username+"\'";  
   ResultSet rs=stmt.executeQuery(sql); 
   if(rs.next()){
	   return rs.getInt("collectnum");
   }
   return -1;
}catch(SQLException s){
	   return -1;
}catch(Exception e){
	   return -1;
}	
}
	public void setISBN(String ISBN){
		this.ISBN=ISBN;
	}
	public String getISBN(){
		return ISBN;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return username;
	}
}
