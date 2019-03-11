package com.local;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



import com.local.HibernateUtil;

public class MessageAction extends ActionSupport implements ModelDriven<Message>{
	
	private Message message = new Message();
	private List<Message> message_list = new ArrayList<Message>();
	
	public String execute() throws Exception{
		//顯示表格的內容是否正確在後台程式碼捕捉到
		System.out.println("標題: "+message.getTopic());
		System.out.println("姓名: "+message.getName());
		System.out.println("發布時間: "+message.getReleaseDate());
		System.out.println("截止日期: "+message.getDateline());
		System.out.println("內容: "+message.getContent());
		
		//開啟Session,相當於開啟JDBC的connection 
	    Session session = HibernateUtil.getSessionFactory().openSession();
	    
	    //Transaction 表示對話操作
	    Transaction tx = session.beginTransaction();
	    
	    //將物件儲存至資料庫表中儲存	
	    session.save(message);
	    tx.commit();
	    	    
	    System.out.println("新增資料OK");
	    
	            
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
        
        //建立session
	    HttpServletRequest request = ServletActionContext.getRequest();
	    HttpSession httpSession = request.getSession();
	    httpSession.setAttribute("model", message_list);

        HibernateUtil.shutdown();
	    
		return SUCCESS;
	}
	
	

	public Message getMessage() {
		return message;
	}



	public void setMessage(Message message) {
		this.message = message;
	}



	public List<Message> getMessage_list() {
		return message_list;
	}



	public void setMessage_list(List<Message> message_list) {
		this.message_list = message_list;
	}



	@Override
	public Message getModel() {		
		return message;
	}
	
	
	
	

}
