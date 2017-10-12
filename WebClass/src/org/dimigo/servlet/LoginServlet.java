package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.vo.UserVO;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Forwarding to login.jsp
		RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s, pwd : %s\n", id, pwd);
		
		// Check if ID & Password is validated (Identification)
		boolean result = true;
		
		if(result) {
			// Creating and storing user's information in session
			HttpSession session = request.getSession();
			UserVO user = new UserVO();
			user.setId(id);
			user.setName("QBE");
			user.setNickname("Cutty");
			
			session.setAttribute("user", user);
			
			// Forwarding to home.jsp
			RequestDispatcher rd = request.getRequestDispatcher("jsp/home.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("err", "error");
			RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
			rd.forward(request, response);
		}
	}
	
	protected void doPost2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		System.out.printf("id : %s, pwd : %s\n", id, pwd);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		/*
		 * {
		 * 		"id": testid
		 * }
		 */
		
//		out.println("{");
//		out.println("\"id\": " + "\"" + id + "\"");
//		out.println("}");
		
		// JSON Simple Library
//		JSONObject json = new JSONObject();
//		json.put("id", id);
		
//		System.out.println(json.toJSONString());
//		out.write(json.toJSONString());
		
		
		// Gson Library
		Gson gson = new Gson();
		JsonObject json = new JsonObject();
		json.addProperty("id", id);
		
		System.out.println(json.toString());
		out.write(json.toString());
			
		out.close();
	}
}
