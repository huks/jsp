package test.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginProAction implements Super {
	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// DAO dao = DAO.getInstance();
		int check = 1;
		// int check = dao.userCheck(id,pw);
		HttpSession session = request.getSession();
				
		if(check == 1){
			session.setAttribute("memId",id);
		}
		
		request.setAttribute("memId", "korea");
		request.setAttribute("check", new Integer(1));
		
		return "/test/loginPro.jsp";
	}

}
