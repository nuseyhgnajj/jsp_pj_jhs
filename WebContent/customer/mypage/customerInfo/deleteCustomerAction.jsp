<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../..//common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title>회원탈퇴액션)()..()</title>
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


</head>
<body>
<div class="wrap">
	<!-- 헤더 시작 -->
	<%@ include file ="../../..//common/header.jsp" %>
	<!-- 헤더 끝 -->
<br>
<!-- 콘텐츠 시작 -->
<container>
	<div id = "contents">
		<div id = "title"> <!-- 타이틀 메뉴-->
			<h1 align = "center">회원탈퇴 인증화면</h1>
		</div>
		<hr><br>
		<div id = "section">
			<div class = "login"> 
				<form name = "passwordform">
					<c:if test = "${deleteCnt == 1}">	<!-- 1이면 탈퇴성공 -->
						<% request.getSession().invalidate(); 	// 세션 지움 %>		
						<script type="text/javascript">
							setTimeout(function(){
								alert("회원탈퇴처리 완료했습니다");
								window.location="${path}/main.do";
							},1000);
						</script>	
					</c:if>
					<c:if test = "${deleteCnt != 1 }">
						<script type="text/javascript">
							setTimeout(function(){
								alert("회원탈퇴 실패했습니다 ..");
								window.location="${path}/deleteCustomer.do";
							},1000);
						</script>
					</c:if>
				</form>
			</div>
		</div>
	</div>
</container>

<!-- 콘텐츠 종료 -->
<!-- 푸터 시작 -->
<%@ include file ="../../..//common/footer.jsp" %>
<!-- 푸터 끝 -->
</div>


</body>
</html>