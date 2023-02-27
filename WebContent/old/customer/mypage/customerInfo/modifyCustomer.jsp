<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title>회원정보 수정화면</title>
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
<script src="${path}/resources/js/customer/main.js" defer></script>

</head>
<body>
<div class="wrap">
	<!-- 헤더 시작 -->
	<%@ include file ="/common/header.jsp" %>
	<!-- 헤더 끝 -->
<br>
<!-- 콘텐츠 시작 -->
<container>
	<div id = "contents">
		<div id = "title"> <!-- 타이틀 메뉴-->
			<h1 align = "center">회원정보 수정화면</h1>
		</div>
		<hr><br>
		<div id = "section">
			<div class = "login"> 
				<form name = "passwordform" action="${path}/modifyDetailAction.do" method="post">
					<%
					String sessionID = (String)request.getSession().getAttribute("sessionID");
					%>
					<table>
						<tr>
							<th colspan = "2">
								<h4>
									<span style ="color : #ff92aa;"><b><%= sessionID %></b></span>님의 비밀번호를 입력하세요 
								</h4>
							</th>
						</tr>					
						<tr>
							<th>PASSWORD</th>
							<td colspan = "2">
								<input type = "password" class ="input" name = "password" size="20" placeholder="공백없이 20자 이내로 작성" required autofocus>
							</td>
						</tr>
						<tr>
							<td colspan = "3" style ="border-bottom:none">
								<br>
								<div align="right">
									<input class="inputButton" type = "submit"	value="수정" onclick = "window.location='${path}/modifyDetailAction.do'">
									<input class="inputButton" type = "reset"	value="취소" onclick = "window.location='${path}/main.do'">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</container>

<!-- 콘텐츠 종료 -->
<!-- 푸터 시작 -->
<%@ include file ="/common/footer.jsp" %>
<!-- 푸터 끝 -->
</div>


</body>
</html>