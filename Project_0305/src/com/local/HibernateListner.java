package com.local;

import java.net.URL;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateListner implements ServletContextListener {
	private Configuration config;
	private SessionFactory factory;
	private String path = "/hibernate.cfg.xml";
	private static Class clazz = HibernateListner.class;
	
	public static final String keyName = clazz.getName();
	
	public void contextDestroyed(ServletContextEvent event) {}
	
	public void contextInitialized(ServletContextEvent event) {
		try {
			URL url = HibernateListner.class.getResource(path);
			config = new Configuration().configure(url);
			factory = config.buildSessionFactory();
			
			//save the Hibernate session factory into servlet context 
			event.getServletContext().setAttribute(keyName, factory);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
