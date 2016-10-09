package net.kuangmeng;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class AddAction extends ActionSupport{
      private String ISBN;
      private String Title;
      private String Publisher;
      private String PublisherDate;
      private String Price;
      private String Author;
      private int index;
      private int Age;
      private String Country;
      private String Name;
      Const c=new Const();
      final String DB_URL = c.getDB_URL();
      final String USER = c.getUSER();
      final String PASS = c.getPASS();
      static final String tableName = "book";  
      static final String tbname = "author";
public String execute() throws Exception {
	String state=ISBNSearch(getISBN().trim());
	if(state.equals(ERROR) || getISBN().trim().equals("")) return "back";
	boolean time=isdate(PublisherDate);
	if(!time){
		return "dateback";
	}
     ResultSet rs=Author();
     int index = 1;
     int no=0;
     while(rs.next()){
    	 if(rs.getString("Name").equals(getAuthor())){
    		 no=rs.getInt("AuthorID");
    	 }else{
    		 index++;
    	 }
     }
     if(no==0){
    	 setindex(index);
    	 int back = BookInsert(index);
    	 if(back == 0) return "error";
    	 return "needAdd";
     }else{
    	int back = BookInsert(no);
    	 if(back == 0) return "error";
    	 else return "success";
     }
}
public String addAuthor() throws Exception { 
	ResultSet rs=Author();
    int index = 1;
    while(rs.next()){
   	 if(!rs.getString("Name").equals(getAuthor())){
   		index++;
   		setindex(index);
   	 }
    }
	Connection conn = null;
    Statement stmt = null;
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn = DriverManager.getConnection(DB_URL,USER,PASS);
   stmt = conn.createStatement();
   String sql = "INSERT " + tbname + " VALUES("+getindex()+",\'"+getName()+"\',"+getAge()+",\'"+getCountry()+"\')";  
   stmt.executeUpdate(sql); 
   return SUCCESS;
}catch(SQLException s){
	   return ERROR;
}catch(Exception e){
	   return ERROR;
}
}
public int getAge(){
	return Age;
}
public void setAge(int Age){ 
	this.Age=Age;
}
public String getCountry(){
	return Country;
}
public void setCountry(String Country){
	this.Country=Country;
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
public int getindex(){ 
	return index;
}
public void setindex(int index){
	this.index=index;
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
public int BookInsert(int no){
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

public String ISBNSearch(String no){
	  Connection conn = null;
      Statement stmt = null;
 try{
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
     conn = DriverManager.getConnection(DB_URL,USER,PASS);
     stmt = conn.createStatement();
     String sql = "SELECT * FROM " + tableName + " WHERE ISBN = \'"+no+"\'";  
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
//日期格式：yyyy-mm-dd
public boolean isdate(String strdate) {
    String strseparator = "-"; // 日期分隔符
    String[] strdateArray;
    int yy;
    int mm;
    int dd;
    boolean boolleapyear;
    strdateArray = strdate.split(strseparator);
    if (strdateArray.length != 3) return false;
    try {
        yy = Integer.parseInt(strdateArray[0], 10);
        mm = Integer.parseInt(strdateArray[1], 10);
        dd = Integer.parseInt(strdateArray[2], 10);
    } catch (Exception e) {
        return false;
    }
    if (mm > 12 || mm < 1) return false;
    if ((mm == 1 || mm == 3 || mm == 5 || mm == 7 || mm == 8 || mm == 10 || mm == 12)
            && (dd > 31 || dd < 1)) return false;
    if ((mm == 4 || mm == 6 || mm == 9 || mm == 11) && (dd > 30 || dd < 1))
        return false;
    if (mm == 2) {
        if (dd < 1)   return false;
        boolleapyear = false;
        if ((yy % 100) == 0) {
            if ((yy % 400) == 0) boolleapyear = true;
        } else {
            if ((yy % 4) == 0) boolleapyear = true;
        }
        if (boolleapyear) {
            if (dd > 29) return false;
        } else {
            if (dd > 28) return false;
        }
    }
    return true;
}
}