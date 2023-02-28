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
<script src="${path}/resources/js/customer/join.js" defer></script>

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
			<h1 align = "center">회원정보 수정 처리 화면</h1>
		</div>
		<hr><br>
		<div id = "section">
			<div class = "login"> 
				<form name = "updateform">
					<c:if test = "${updateCnt == 0}">
						<script type="text/javascript">
							setTimeout(function(){
								alert("회원수정 실패");
								window.location = "${path}/modifyDetailAction.do";
							},1000);
						</script>
					</c:if>
					<c:if test = "${updateCnt != 0}">
					<% 	//모든 세션 삭제 -> 비밀번호가 변경되었으므로 다시 로그인하도록 함(세션이 남아있으면 로그인시 변경전 비밀번호로 무조건 인증되므로)
						request.getSession().invalidate();	%>	
						<script type="text/javascript">
							setTimeout(function(){
								alert("회원수정 완료");
								window.location = "${path}/login.do";
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
<%@ include file ="/common/footer.jsp" %>
<!-- 푸터 끝 -->
</div>
</body>
</html>