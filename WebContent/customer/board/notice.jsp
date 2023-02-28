<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title>shopAll</title>

<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="../../resources/css/common/header.css">
<link rel="stylesheet" href="../../resources/css/common/footer.css">
<link rel="stylesheet" href="../../resources/css/customer/boardList.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>

</head>
<body>
<div class="wrap">
	<!-- 헤더 시작 -->
	<%@ include file ="../../common/header.jsp" %>
	<!-- 헤더 끝 -->
<br><br>
	<!-- 콘텐츠 시작 -->
	<container>
		<div id = "contents">
			<div id = "title"> <!-- 타이틀 메뉴-->
				<h1>NOTICE</h1>
			</div>
			<hr><br>
			<div id = "section1">
				<div class= "board_menu">
					<span>COMMUNITY</span>
					<a href = "notice.html">NOTICE</a>
					<a href = "question.html">Q & A</a>
					<a href = "review.html">REVIEW</a>
				</div>
			</div>
			<hr>
			<div id = "section2">
				<table class="table table-hover">
					  <thead class ="table-light">
						<tr>
							<th scope="col">공지번호</th>
							<th scope="col">공지제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					  </thead>
					  <tbody>
						<tr>
							<th scope="row">1</th>
							<td id = "ntitle">배송공지</td>
							<td>관리자</td>
							<td>2023.01.01</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td id = "ntitle">쿠폰 관련 안내</td>
							<td>관리자</td>
							<td>2023.01.10</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td id = "ntitle">해외배송 안내</td>
							<td>관리자</td>
							<td>2023.01.11</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td id = "ntitle">회원가입 혜택 안내</td>
							<td>관리자</td>
							<td>2023.01.21</td>
					  	</tr>
					  	<tr>
							<th scope="row">5</th>
							<td id = "ntitle">환불, 교환 안내</td>
							<td>관리자</td>
							<td>2023.01.21</td>
				  	  	</tr>
					  </tbody>
				</table>
			</div>
		</div>
	</container>
	<!-- 콘텐츠 종료 -->

	<!-- 푸터 시작 -->
	<%@ include file ="../../common/footer.jsp" %>
	<!-- 푸터 끝 -->
</div>
</body>
</html>>