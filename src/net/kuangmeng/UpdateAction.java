package net.kuangmeng;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class UpdateAction extends ActionSupport{
      private String ISBN;
      private String Title;
      private String Publisher;
      private String PublisherDate;
      private String Price;
      private String Author;
      private String Name;
      Const c=new Const();
      final String DB_URL = c.getDB_URL();
      final String USER = c.getUSER();
      final String PASS = c.getPASS();
      static final String tableName = "book";  
      static final String tbname = "author";
public String execute() throws Exception {
	ResultSet bk=BookSearch(getISBN().trim());
	ResultSet rs=Author();
	int no=0;
	while(bk.next()){
		if(getTitle().equals("")) setTitle(bk.getString("Title"));
		if(getPublisher().equals("")) setPublisher(bk.getString("Publisher"));
		if(getPublisherDate().equals("")) setPublisherDate(bk.getString("PublisherDate"));
		if(getPrice().equals("")) setPrice(bk.getString("Price"));
		if(getAuthor().equals("")) no = bk.getInt("AuthorID");
	}
	String state=DeleteBook(getISBN().trim());
	if(state.equals("error")) return ERROR;
    int index = 1;
    while(rs.next()){
    	if(rs.getString("Name").equals(getAuthor())) no=rs.getInt("AuthorID");
    	else index++;
     }
     if(no==0){
    	 int back = InsertBook(index);
    	 if(back == 0) return "error";
    	 return "needAdd";
     }else{
    	int back = InsertBook(no);
    	 if(back == 0) return "error";
    	 else return "success";
     }
}


public String getISBN(){
	return ISBN;
}
public  String getName(){ 
	return Name;
}
public void setName(String Name){
	this.Name=Name;
}
public void setISBN(String ISBN){
	this.ISBN=ISBN;
}
public String getTitle(){
	return Title;
}
public void setTitle(String Title){
	this.Title=Title;
}
public String getPublisher(){
	return Publisher;
}
public void setPublisher(String Publisher){
	this.Publisher=Publisher;
}
public String getPublisherDate(){
	return PublisherDate;
}
public void setPublisherDate(String PublisherDate){
	this.PublisherDate=PublisherDate;
}
public String getPrice(){
	return Price;
}
public void setPrice(String Price){
	this.Price=Price;
}
public String getAuthor(){
	return Author;
}
public void setAuthor(String Author){
	this.Author=Author;
}
public int InsertBook(int no){
	  Connection conn = null;
      Statement stmt = null;
 try{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
     conn = DriverManager.getConnection(DB_URL,USER,PASS);
     stmt = conn.createStatement();
     String sql = "INSERT " + tableName + " VALUES(\'"+ISBN+"\',\'"+Title+
    		 "\',\'"+Publisher+"\',\'"+PublisherDate+"\',"+Price+","+no+")";  
     int rs = stmt.executeUpdate(sql); 
     return rs;
 }catch(SQLException s){
	   return 0;
 }catch(Exception e){
	   return 0;
 }
}
public String DeleteBook(String ISBN){
	 Connection conn = null;
     Statement stmt = null;
try{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection(DB_URL,USER,PASS);
    stmt = conn.createStatement();
    String sql = "DELETE FROM " + tableName + " where ISBN= \'"+ISBN+"\'";  
    stmt.executeUpdate(sql); 
    return "success";
}catch(SQLException s){
	   return "error";
}catch(Exception e){
	   return "error";
}
}
public ResultSet Author(){
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
public ResultSet BookSearch(String ISBN){
    Connection conn = null;
    Statement stmt = null;
try{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn = DriverManager.getConnection(DB_URL,USER,PASS);
   stmt = conn.createStatement();
   String sql = "SELECT * FROM " + tableName + " WHERE ISBN = \'"+ISBN+"\'";  
   ResultSet rs = stmt.executeQuery(sql); 
   return rs;
}catch(SQLException s){
	   return null;
}catch(Exception e){
	   return null;
}
}
public String SearchAuthor(ResultSet rs) throws SQLException{
	int ai=rs.getInt("AuthorID");
    Connection conn = null;
    Statement stmt = null;
 try{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
     conn = DriverManager.getConnection(DB_URL,USER,PASS);
     stmt = conn.createStatement();
     String sql = "SELECT * FROM " + tbname+" where AuthorID = "+ai;  
     ResultSet re = stmt.executeQuery(sql); 
     return re.getString("Name");
 }catch(SQLException s){
	   return "不详";
 }catch(Exception e){
	   return "不详";
 }
}
}