<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 헤더</title>
</head>
<body>
<!-- header 시작 -->
	<header id = "header" class ="container-fluid">	<!-- 헤더 아이디 : header -->
		<div class = "col-md-12">
			<div class = "row">
				<div id = "mainLogo" class = "col-md-2"> <!-- 메인 로고  -->
					<a href = "main.html"><img src = "${path}/resources/images/main/photoZeniaPng.png" style ="width:200px;" ></a>
				</div>
					<nav id ="mainNav" class ="col-md-6">	<!-- 메인 메뉴 --> 
						<ul class ="nav_li">				
							<li><a class="text-decoration-none" style = "font-style: italic;" href="../../common/main.html">Home</a></li>
							<li><a class="text-decoration-none" style = "font-style: italic;" href ="../../customer/product/shopAll.html">Product</a></li>
							<li><a class="text-decoration-none" style = "font-style: italic;" href ="../../customer/board/boardList.html">Community</a></li>
						</ul>
					</nav>
				<div id = "mainSide" class = "col-md-4 "> <!-- 메인 사이드 바-->
					<nav class="navbar">
						<div>
							<ul class="nav nav-tabs" style ="font-size:10px;color:bisque;" >
								<li id = "my"><a class = "nav-link link-secondary" href ="../../customer/login/login.html">Login</a></li>
								<li id = "my"><a class = "nav-link link-secondary" href = "../../customer/join/join.html">Join</a></li>
								<li id = "my"><a class = "nav-link link-secondary" href = "../../customer/mypage/cart/cart.html"><i class="bi bi-cart4"></i></a></li>
								<li id = "my"><a class = "nav-link link-secondary" href = "../../customer/mypage/mypage.html"><i class="bi bi-person-circle"></i></a></li>		
								<!-- 리스트 바 -->
								<li><button id ="my" type ="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarContent" 
										aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation"><i class ="bi bi-list"></i>
									</button>
									<div class="collapse navbar-collapse" id="navbarContent">
										<div class ="navbar-nav">
											<a class ="nav-link" href="#">category1</a>
											<a class ="nav-link" href="#">category2</a>
											<a class ="nav-link" href="#">category3</a>
											<hr>
											<a class ="nav-link" href="#">category3</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</nav>				
				</div>
			</div>
		</div>
	</header>
<!-- header 끝 -->
</body>
</html>