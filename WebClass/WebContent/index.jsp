<!-- index.jsp : Welcome File(Page) -->
<!-- 1. Directive tag -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>First JSP</title>
	</head>
	<body>
		<%-- 2. Comment tag --%>
		<%-- 3. Declaration tag --%>
		<%! private static final String DEFAULT_NAME = "Guest"; %>
		
		<%-- 4. Scriptlet tag (The most-used tag in JSP) --%>
		<%
			// You can make code same as in Java
			String name = request.getParameter("name");
			if(name == null) name = DEFAULT_NAME;	
		%>
		
		<%-- 5. Expression tag --%>
		<h1>Hello, <%=name.toUpperCase()%>!</h1>
	</body>
</html>