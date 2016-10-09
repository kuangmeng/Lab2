package net.kuangmeng;
import java.sql.*;

public class SQLSearch{
	Const c=new Const();
    final String DB_URL = c.getDB_URL();
    final String USER = c.getUSER();
    final String PASS = c.getPASS();
    static final String tableName = "book";  
    static final String tbname = "author";
    static final String tablename = "user";
    static final String tabname = "comment";
  public ResultSet getResult(){
      Connection conn = null;
      Statement stmt = null;
   try{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
       conn = DriverManager.getConnection(DB_URL,USER,PASS);
       stmt = conn.createStatement();
       String sql = "SELECT * FROM " + tableName;  
       ResultSet rs = stmt.executeQuery(sql); 
       return rs;
   }catch(SQLException s){
	   return null;
   }catch(Exception e){
	   return null;
   }
    }
    public ResultSet getAuthor(){
        Connection conn = null;
        Statement stmt = null;
     try{
  	   Class.forName("com.mysql.jdbc.Driver").newInstance();
         conn = DriverManager.getConnection(DB_URL,USER,PASS);
         stmt = conn.createStatement();
         String sql = "SELECT * FROM " + tbname;  
         ResultSet rs = stmt.executeQuery(sql); 
         return rs;
     }catch(SQLException s){
  	   return null;
     }catch(Exception e){
  	   return null;
     }
   }
    public int getUserCtrl(String username){
        Connection conn = null;
        Statement stmt = null;
     try{
  	   Class.forName("com.mysql.jdbc.Driver").newInstance();
         conn = DriverManager.getConnection(DB_URL,USER,PASS);
         stmt = conn.createStatement();
         String sql = "SELECT * FROM " + tablename+" where username = "+"\'"+username+"\'";  
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
   public ResultSet getPublisher(String name){
	   Connection conn = null;
       Statement stmt = null;
    try{
 	   Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        stmt = conn.createStatement();
        String sql = "SELECT * FROM " + tableName +" WHERE Publisher = " +"\'"+name+"\'";  
        ResultSet rs = stmt.executeQuery(sql); 
        return rs;
    }catch(SQLException s){
 	   return null;
    }catch(Exception e){
 	   return null;
    }
   }
   public ResultSet getMessage(String isbn){
	   Connection conn = null;
       Statement stmt = null;
    try{
 	   Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        stmt = conn.createStatement();
        String sql = "SELECT * FROM " + tableName +" WHERE ISBN = \'" + isbn+"\'";  
        ResultSet rs = stmt.executeQuery(sql); 
        return rs;
    }catch(SQLException s){
 	   return null;
    }catch(Exception e){
 	   return null;
    }
   }
   public ResultSet getComment(){
	   Connection conn = null;
       Statement stmt = null;
    try{
 	   Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        stmt = conn.createStatement();
        String sql = "SELECT * FROM " + tabname;  
        ResultSet rs = stmt.executeQuery(sql); 
        return rs;
    }catch(SQLException s){
 	   return null;
    }catch(Exception e){
 	   return null;
    }
   }
}
