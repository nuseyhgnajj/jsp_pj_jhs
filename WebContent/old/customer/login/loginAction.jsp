<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file ="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customer/login.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>
<script src="../resources/js/customer/main.js" defer></script>

</head>
<body>
<div class="wrap">
	<!-- 헤더 시작 -->
	<%@ include file ="/common/header.jsp" %>
	<!-- 헤더 끝 -->

	<!-- 컨텐츠 시작 -->
<!-- 	
	<script type ="text/javascript">
			alert("관리자 로그인");
			window.location = "${path}/admin/product/admin_productList.jsp";
	</script> 
-->
	<container>
		<div id = "contents">
			<div id = "title"> <!-- 타이틀 메뉴-->
				<h1 align = "center">LOGIN ACTION</h1>
			</div>
			<hr><br>
			<div id = "section">
				<div class = "login"> 
					<form name = "loginform" action="${path}/loginAction.do" method="post">
						<!-- 세션이 없는 경우 : 로그인 실패 (아이디 비번 다시 입력) -->
						<%
						String sessionID = (String)request.getSession().getAttribute("sessionID"); 
						if(sessionID == null){
						%>	
						
						<table>
							<tr>
								<td colspan = "2" align = "center">
									<h4>
										<% out.print("아이디 혹은 패스워드가 일치하지 않습니다. 다시 로그인하세요."); %>
									</h4>
								</td>
							</tr>
							<tr>
								<th>ID</th>
								<td>
									<input type = "text" class ="input" name = "id" size="15" placeholder="공백없이 15자 이내로 작성" autofocus required>
								</td>
							</tr>	
							<tr>
								<th>PASSWORD</th>
								<td colspan = "2">
									<input type = "password" class ="input" name = "password" size="15" placeholder="공백없이 15자 이내로 작성" required>
								</td>
							</tr>
							<tr>
								<td colspan = "3" style ="border-bottom:none">
									<br>
									<div align="right">
										<input class="inputButton" type = "submit"	value="로그인">
										<input class="inputButton" type = "reset"	value="초기화">
										<input class="inputButton" type = "button"	class="button" value="회원가입" onclick="window.location='${path}/join.do'">
									</div>
								</td>
							</tr>
						</table>
							
						<% 	
						}
						else{	
						%>
						<!-- 세션이 있는 경우 : 로그인 성공 -->
						<table>
							<tr>
								<td colspan = "2" align = "center">
									<h4>
										<span style ="color : #ff92aa;"><b><%= sessionID %></b></span>님 로그인 성공 ! 
									</h4>
								</td>
							</tr>
							<tr>
								<td colspan = "3" style ="border-bottom:none">
									<br>
									<div align="right">
										<input class="inputButton" type = "button"	value="회원수정" onclick="window.location='http://localhost/jsp_pj_126/modifyCustomer.do' ">
										<input class="inputButton" type = "button"	value="회원탈퇴" onclick="window.location='http://localhost/jsp_pj_126/deleteCustomer.do'">
										<input class="inputButton" type = "button"	value="로그아웃" onclick="window.location='http://localhost/jsp_pj_126/logout.do'">
									</div>
								</td>
							</tr>
						</table>	
						<%
						}
						%>

						
					</form>
				</div>
			</div>
		</div>
	</container>
	<!-- 컨텐츠 종료 -->

	<!-- 푸터 시작 -->
	<%@ include file ="/common/footer.jsp" %>
	<!-- 푸터 끝 -->
</div>
</body>
</html>