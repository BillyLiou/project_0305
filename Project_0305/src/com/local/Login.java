package com.local;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport {
	
	private String name ;
	private String pass ;
	private List<Message> message_list = new ArrayList<Message>();
	//開啟Session,相當於開啟JDBC的connection 
    Session session = HibernateUtil.getSessionFactory().openSession();
    
    //建立httpSession
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpSession httpSession = request.getSession();
    
	public String execute() throws Exception{
		if(this.name.equals("Billy") && this.pass.equals("0000")) {		
			
			//start a transaction
		    session.beginTransaction();

			// 使用HQL建立查詢
	        Query query = session.createQuery("from Message");
	        Iterator messages = query.list().iterator();
	        System.out.println("id \t topic/name/發布日期/截止日期/內容");
	        while(messages.hasNext()) {
	            Message message = (Message) messages.next();
	            //將讀出的每一條table加入到列表裡面
	            message_list.add(message);
	            System.out.println(
	            		message.getId() +
	                    "\t" + message.getTopic() +
	                    "/" + message.getName()+
	                    "/" + message.getReleaseDate()+
	                    "/" + message.getDateline() +
	                    "/" + message.getContent()); 
	        }	    
//		    session.close();
//	        HibernateUtil.shutdown(); 
		    httpSession.setAttribute("model", message_list);
		    httpSession.setAttribute("user", "Billy");

			return SUCCESS;
		}else {
			return ERROR;
		}
	}
	
	public String logout() throws Exception{
		session.close();
//		HibernateUtil.shutdown();
		httpSession.invalidate();
		System.out.println("成功關閉這些東東");
		return SUCCESS;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
	

}
