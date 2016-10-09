package net.kuangmeng;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class Comment extends ActionSupport {
	Const c=new Const();
    final String DB_URL = c.getDB_URL();
    final String USER = c.getUSER();
    final String PASS = c.getPASS();
     static final String tableName = "comment";  
	private String topic;
	private String username;
	private String comment;
	private String name;
	private String email;
	int id=c.getId();
	public String execute() throws Exception{
		if(getComment().equals("")) return "back";
		Connection conn = null;
	    Statement stmt = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
	   conn = DriverManager.getConnection(DB_URL,USER,PASS);
	   stmt = conn.createStatement();
	   String sql = "insert " + tableName + " values(\'"+getUsername()+"\',"+"\'"+getComment()+"\',"+id+",\'"+getTopic()+"\',\'"+getName()+"\')";  
	   c.setId(id);
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
	public void setUsername(String username){
		this.username=username;
	}
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getEmail(){
		return email;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public String getTopic(){
		return topic;
	}
	public void setTopic(String topic){
		this.topic=topic;
	}
	public String getComment(){
		return comment;
	}
	public void setComment(String comment){
		this.comment=comment;
	}
	
}
