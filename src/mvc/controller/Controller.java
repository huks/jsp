package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.action.Super;

public class Controller extends HttpServlet {
	Properties pr = null; // import 'Properties' (java.util)
	static HashMap map = new HashMap();
	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("path");
		FileInputStream f = null;
		pr = new Properties();
		try{
			f = new FileInputStream(path);
			pr.load(f);
			Iterator iter = pr.keySet().iterator(); // import (java.util)
			while(iter.hasNext()){
				String key = (String)iter.next();
				String value = pr.getProperty(key);
				Class className = Class.forName(value);
				Object obj = className.newInstance();
				map.put(key, obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		Super s = (Super)map.get(uri);
		String view = s.action(request,response);
		// String view = pr.getProperty(uri);
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}		
}
