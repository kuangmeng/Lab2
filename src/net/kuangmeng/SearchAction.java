package net.kuangmeng;

import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class SearchAction extends ActionSupport{
      private String msg;
      private String msg2;
      private String msg3;
public String execute() throws Exception{
	 if(getMsg().equals("") && getMsg2().equals("") && getMsg3().equals("")) return ERROR;
	 else if(!getMsg().equals("")) return "book";
	 else if(getMsg().equals("") && !getMsg2().equals("")) {
		 return "author"; 
	 }
	 return "publisher";
}
public String getMsg(){
	return msg;
}
public void setMsg(String msg){
	this.msg=msg;
   }
public String getMsg2(){
	return msg2;
}
public void setMsg2(String msg){
	this.msg2=msg;
   }
public String getMsg3(){
	return msg3;
}
public void setMsg3(String msg){
	this.msg3=msg;
   }
}