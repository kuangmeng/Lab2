package net.kuangmeng;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class UploadAction extends ActionSupport{
     private String says;
public String execute() throws Exception {
	if(says.equals("欢迎提交")) return ERROR;
	else if(getSays() != null) return SUCCESS;
	else return ERROR;
}
public void setSays(String says){
	this.says=says;
}
public String getSays(){
	return says;
  }
}