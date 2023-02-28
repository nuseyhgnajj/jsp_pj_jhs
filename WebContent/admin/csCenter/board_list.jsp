<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title>main page</title>

<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/admin/ad_productList.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>
</head>
<body>
<div class="wrap">
<!-- 헤더 시작 -->
	<%@ include file ="/admin/common/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 컨텐츠 시작 -->
<container>
	<div id ="contents">
	<!-- 메뉴 -->
		<%@ include file ="/admin/common/leftMenu.jsp" %>
	<!-- 메뉴 -->
		<div id = "section2">
			<div class = "table_div">
				<table item-align = "center">
					<thead class = "thead">
						<tr>
							<th>&nbsp;</th>
						    <th style = "width :10%">번호</th>
							<th style = "width :20%">작성자</th>
							<th style = "width :30%">글제목</th>
							<th style = "width :20%">작성일</th>
							<th style = "width :10%">조회수</th>
						</tr>
					</thead>
					<tr> <!-- 게시글이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox" checked><span class="checkmark"></span>
							</label>
						</td>
						<td>1</td>
						<td>Gangwondo Night 2 Bedding Set(SS/Q/K)</td>
						<td>Bedding</td>
						<td>￦248,000</td>
						<td>0</td>
					</tr>
				</table>
				<br>
				
			</div>
			<div class = "btnsection">
				<input class = "btn" type = "button" value = "삭제">
				<input class = "btn" type = "button" value = "수정">
			</div>
		</div>
	</div>
</container> 	
<!-- 컨텐츠 종료 -->
	<!-- 푸터 시작 -->
	<%@ include file ="/admin/common/footer.jsp" %>
	<!-- 푸터 끝 -->
</div>
</body>
</html>