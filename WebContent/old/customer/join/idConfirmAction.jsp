<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
#contents{ 
	display: inline-block;
	max-width : 300px;
	margin-top: 3%;
	min-height: 300px;
	margin:20px;
	align:center;
}
/* -------- #타이틀 ----------*/
#title{
	letter-spacing: 3px;
	text-align:justify;
	margin-bottom: 30px;
}
#title h1{
	font-weight: bold;
	color : darkslategrey;
	align: center;
}
#section{
	text-align: center;

}
.input{
	width:500px;
	height:40px;
	border:1px solid rgba(139, 147, 136, 0.622);
	border-radius: 10px;
	box-sizing:border-box;
	padding:0 0 0 10px;
}
.inputButton{
	background-color:#657753b4;
	border:none;
	border-radius:10px;
	font-size:16px;
	color: #ffffff;
	padding:10px 15px 10px 15px;
}

</style>
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>
<script src = "${path}/resources/js/customer/join.js" defer></script>
</head>
<body onload = "idConfirmFocus();">		<!-- 중복확인 페이지 -->
<div class="wrap">
	<!-- 컨텐츠 시작 -->
		<div id = "contents">
			<div id = "title"> <!-- 타이틀 메뉴-->
				<h1 align = "center">중복확인 페이지</h1>
			</div>
			<hr><br>
			<div id = "section">
						<%
							String id = (String)request.getAttribute("id");
							int selectCnt = (Integer)request.getAttribute("selectCnt");
						%>	
						<form name = "confirmform" action="${path}/idConfirmAction.do" method="post" onsubmit = "return idConfirmCheck();">
						<%	//id중복
							if(selectCnt == 1){
						%>	
						<table width = "500px">
							<tr>
								<th colspan ="2" align ="center" >
									<span><%= id %></span>는 사용할 수 없다~
								</th>
							</tr>
							<tr>
								<th>ID</th>
								<td>
									<input type = "text" class ="input" name = "id" size="20" placeholder="공백없이 15자 이내로 작성" autofocus required>
 								</td>
							</tr>	
							<tr>
								<td colspan = "3" style ="border-bottom:none">
									<br>
									<div align="right">
										<input class="inputButton" type = "submit"	value="확인">
										<input class="inputButton" type = "reset"	value="취소" onclick = "self.close();">
									</div>
								</td>
							</tr>
						</table>	
						<% 	
							}
							//중복이 아닐때
							else {
						%>
						<table width = "450px">
							<tr align = "center">
								<th colspan ="2" align ="center">
									<span><%= id %></span>는 사용할 수 있습니다~
								</th>
							</tr>
							<tr>
								<th>
									<input class ="inputButton" type = "button" value ="확인" onclick ="setId('<%= id %>');">
								</th>
							</tr>	
						</table>
						<%	
							}
						%>
					</form>
			</div>
		</div>
	<!-- 컨텐츠 종료 -->
</div>
</body>
</html>