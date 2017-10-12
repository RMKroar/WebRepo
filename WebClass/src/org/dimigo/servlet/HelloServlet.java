/* <Reference>
 * 		java.~~~ import : Java SE(Standard Edition)
 * 		javax.~~~ import : Java EE(Enterprise Edition)
 * </Reference>
 */

package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet(description = "First Servlet", urlPatterns = { "/hello" })
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public HelloServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// dealt with request data (parameters)\
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		System.out.printf("[Params] id : %s, name : %s\n", id, name);
		
		// assign Content-Type of output data
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();		// before initializing PrintWriter, encoding is required.	
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet test</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Hello, Servlet!</h1>");
		out.println("<h2>한글은 출력할 수 있니?</h2>");
		out.println("<h3>id : " + id + ", name : " + name + "</h3>");
		out.println("</body>");
		out.println("</html>");
		
		out.close(); // 'cause 'out' is a resource, it'd better closing it for blocking memory waste.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("DoPost Accessed");
		doGet(request, response);
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("Init");
	}
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		System.out.println("Service");
		super.service(arg0, arg1);
	}
	
	@Override
	public void destroy() {
		System.out.println("Destroy()");
	}

}
