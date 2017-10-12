<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>RMKroar의 블로그</title>
    <link rel="stylesheet" href="../css/myblog.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

  	<script src="../js/menuControl.js"></script>
  </head>
  <body>

	  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  	<a class="navbar-brand" href="#">Main</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		   <span class="navbar-toggler-icon"></span>
		</button>

		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
		        <a class="nav-link" href="introduction.html">Introduction<span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
		        <a class="nav-link" href="makinggames.html">Making Games</a>
		      </li>
		      <li class="nav-item" onmouseover="menu_over(this);" onmouseout="menu_out(this);">
		        <a class="nav-link" href="composing.html">Composing</a>
		      </li>
		    </ul>
		    <%
		    	String id = request.getParameter("id") == null ? "" : request.getParameter("id");
		    	String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd"); 

	    		UserVO user = (UserVO)session.getAttribute("user");
	    		if(user == null) {
	    	%>
		    <form class="form-inline my-2 my-lg-0" id="loginForm" action="/WebClass/bloglogin" method="post">
		      <input class="form-control mr-sm-2" type="text" placeholder="ID" aria-label="ID" id="id" name="id" value="<%=id%>" required >
		      <input class="form-control mr-sm-2" type="password" placeholder="Password" aria-label="Password" id="pw" name="pwd" value="<%=pwd%>" required >
		      <button class="btn btn-outline-success md-2 md-sm-0" type="submit">Login</button>
		    </form>
		    <% } else { %>
		    
		    <div style="color:white; margin-right: 2%"><%=user.getId()%>님, 환영합니다!</div>    
		    <form class="form-inline my-2 my-lg-0" action="/WebClass/bloglogout" method="post">
		      <button class="btn btn-outline-success md-2 md-sm-0" type="submit">Logout</button>
		    </form>
		    <% } %>
		  </div>
		</nav>

    <div class="container">
    	<div class="jumbotron" style="text-align: center;">
        <h1>RMKroar의 블로그</h1>
        <br>20333 한창희 응용 프로그래밍 - 블로그 제작 수행평가<br>
        <button type="button" class="btn btn-outline-info btn-lg" style="margin-top:5%"
        data-toggle="modal" data-target="#signinModal">Sign in</button>
      </div>
    </div>

	<!-- Modal -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">로그인 결과</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>

  <div class="modal fade" id="signinModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form id="regForm" name="regForm">
      <div class="modal-header">
        <h5 class="modal-title" id="signinLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">
          <div class="form-group">
            <label class="form-control-label">학년:</label>
            <br>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>1학년
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">2학년
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">3학년
              </label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-inline">
              <label class="mr-sm-2" for="inlineFormCustomSelectPref">반 선택:</label>
                <select class="custom-select" id="inlineFormCustomSelectPref">
                  <option selected value="1">1반</option>
                  <option value="2">2반</option>
                  <option value="3">3반</option>
                  <option value="3">4반</option>
                  <option value="3">5반</option>
                  <option value="3">6반</option>
                </select>
            </div>
          </div>
          <div class="form-group">
            <div class="form-inline">
              <label for="student-number" class="form-control-label">번호: </label>
              <input type="text" style="margin-left: 2%" class="form-control" id="student-number" required>
            </div>

            <div class="form-inline" style="margin-top: 3%">
              <label class="form-control-label">이름: </label>
              <input type="text" style="margin-left: 2%" id="name" class="form-control" required>
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" type="submit">Submit</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="successModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">회원가입 결과</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<hr>

<footer class="text-muted">
  <div class="container">
    <p class="float-right">
      <a href="#">Back to Top</a>
    </p>
    <p>Email: rmkroar97@gmail.com</p>
    <p>KDMHS 2017</p>
  </div>
</footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    
    <%@ include file="modal.jsp" %>

	<script>
		<%
			if("error".equals(request.getAttribute("err"))) {
		%>
			
			var myModal = $('#myModal');
			myModal.find('.modal-title').text('로그인 오류');
			myModal.find('.modal-body').text('가입된 아이디가 아니거나 비밀번호가 틀립니다.');
			myModal.modal();
		<% } %>
	</script>
</body>
</html>
