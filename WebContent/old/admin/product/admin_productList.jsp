<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title>관리자 상품 목록</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous">
</script>
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="../../resources/css/common/header.css">
<link rel="stylesheet" href="../../resources/css/common/footer.css">
<link rel="stylesheet" href="../../resources/css/admin/ad_productList.css">

<script src="../resources/js/customer/main.js" defer></script>

</head>
<body>
<div class="wrap">
<!-- header 시작 -->
<header id = "header" class ="container-fluid">	<!-- 헤더 아이디 : header -->
	<div class = "col-md-12">
		<div class = "row">
			<div id = "mainLogo" class = "col-md-2"> <!-- 메인 로고  -->
				<a href = "main.html"><img src = "../../resources/images/main/photoZeniaPng.png" style ="width:200px;" ></a>
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

<!-- 컨텐츠 시작 -->
<container>
	<div id ="contents">
		<div id = "title"> <!-- 타이틀 메뉴-->
			<h1>Prdouct List</h1>
		</div>
		<hr><br>
		<div id = "section1">
			<div class= "product_menu">
				<span>상품관리</span>
				<a href = "admin_productList.html">상품목록</a>
				<a href = "admin_productAdd.html">상품등록</a>
				<a href = "admin_productCategory.html">카테고리</a>
			</div>
			<div class = "order_menu">
				<span>주문관리</span>
				<a href = "../order/orderList.html">주문목록</a>
				<a href = ".. /order/orderConfirm.html">주문승인</a>
				<a href = "../order/refundReqest.html">환불요청</a>
				<a href = "../order/refundComplete.html">환불완료</a>
				<a href = "../order/refundCancel.html">환불취소</a>
			</div>
			<div class = "other">
				<span>기타관리</span>
				<a href = "customerInfo.html">회원정보</a>
				<a href = "board.html">게시판&nbsp;</a>
				<a href = "total_income.html">결산&nbsp;&nbsp;</a>
				<a href = "logout.html">로그아웃</a>
			</div>
		</div>
		<hr><br>
		<div id = "section2">
			<div class = "table_div">
				<table item-align = "center">
					<thead class = "thead">
						<tr>
							<th>&nbsp;</th>
						    <th style = "width :5%">번호</th>
							<th style = "width :15%">상품명</th>
							<th style = "width :25%">이미지</th>
							<th style = "width :10%">카테고리</th>
							<th style = "width :10%">상품가격</th>
							<th style = "width :10%">등록수량</th>
							<th style = "width :10%">상태</th>
							<th style = "width :5%">등록일</th>
						</tr>
					</thead>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox" checked><span class="checkmark"></span>
							</label>
						</td>
						<td>1</td>
						<td>Gangwondo Night 2 Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/GangwondoNightBeddingSet.jpg">
							</div>
						</td>
						</td>
						<td>Bedding</td>
						<td>￦248,000</td>
						<td>0</td>
						<td>일시품절</td>
						<td>2023.01.06</td>	
					</tr>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox"><span class="checkmark"></span>
							</label>
						</td>
						<td>2</td>
						<td>Jeju Landscape Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/jejuLandscapebsddingSet.jpg">
							</div>
						</td>
						<td>Bedding</td>
						<td>￦248,000</td>
						<td>200</td>
						<td>판매중</td>
						<td>2023.02.06</td>	
					</tr>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox"><span class="checkmark"></span>
							</label>
						</td>
						<td>3</td>
						<td>Jeju Morae Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/jejuMoraeBeddingSet.jpg">
							</div>
						</td>
						<td>Bedding</td>
						<td>￦248,000</td>
						<td>100</td>
						<td>판매중</td>
						<td>2023.02.06</td>	
					</tr>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox"><span class="checkmark"></span>
							</label>
						</td>
						<td>4</td>
						<td>Jeju Ocean Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/jejuOceanBeddingSet.jpg">
							</div>
						</td>
						<td>Bedding</td>
						<td>￦248,000</td>
						<td>300</td>
						<td>판매중</td>
						<td>2023.02.06</td>	
					</tr>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox"><span class="checkmark"></span>
							</label>
						</td>
						<td>5</td>
						<td>Jeju Orrum Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/jejuOrrumBeddingSet.jpg">
							</div>
						</td>
						<td>Bedding</td>
						<td>￦248,000</td>
						<td>200</td>
						<td>판매중</td>
						<td>2023.02.06</td>	
					</tr>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox"><span class="checkmark"></span>
							</label>
						</td>
						<td>6</td>
						<td>PZA Muzi Charcoal Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/PZGMujiCharcoalBeddingSet.jpg">
							</div>
						</td>
						<td>Bedding</td>
						<td>￦149,000</td>
						<td>0</td>
						<td>품절</td>
						<td>2022.01.01</td>	
					</tr>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox"><span class="checkmark"></span>
							</label>
						</td>
						<td>7</td>
						<td>PZA Muzi Deep Blue Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/PZGMujiDeepBlueBeddingSet.jpg">
							</div>
						</td>
						<td>Bedding</td>
						<td>￦149,000</td>
						<td>200</td>
						<td>판매중</td>
						<td>2023.01.01</td>	
					</tr>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox"><span class="checkmark"></span>
							</label>
						</td>
						<td>8</td>
						<td>PZA Muzi Deep Green Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/PZGMujiDeepGreenBeddingSet.jpg">
							</div>
						</td>
						<td>Bedding</td>
						<td>￦149,000</td>
						<td>200</td>
						<td>판매중</td>
						<td>2023.01.01</td>	
					</tr>
					<tr> <!-- 상품이 있으면  -->
						<td>
							<label class="checkbox-wrap checkbox-primary">
								<input type="checkbox"><span class="checkmark"></span>
							</label>
						</td>
						<td>9</td>
						<td>PZA Muzi Yellow Bedding Set(SS/Q/K)</td>
						<td>
							<div class="img">
								<img src = "../../resources/images/product/Bedding/PZGMujiYellowBeddingSet.jpg">
							</div>
						</td>
						<td>Bedding</td>
						<td>￦149,000</td>
						<td>200</td>
						<td>판매중</td>
						<td>2023.01.01</td>	
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
<!-- footer 시작 -->
	<footer>	
		<div class ="footer_info">
			<div class="footer_link">
				<ul>
					<li><a href = "#">회사소개</a></li>
					<li><a href = "#">이용약관</a></li>
					<li><a href = "#">개인정보 처리방침</a></li>
				</ul>
			</div>
			<div class= "footer_info_customer">
				<h3>고객센터 &nbsp; 02) 0000-0000 &nbsp;</h3>
				<span>평일 및 주말 &nbsp; 10:00 ~ 17:00&nbsp;(공휴일 휴무) &nbsp; &nbsp; </span>
				<span>점심시간 &nbsp; 12:00 ~ 13:00 &nbsp; &nbsp;</span>
			</div>
			<div class= "footer_info_company">
				<span><strong>법인명 </strong> JHSCorp</span>
				<span><strong>대표 </strong> JHSCorp</span>
				<span><strong>사업자번호 </strong> JHSCorp</span>
				<span><strong>사업자 소재지 </strong> JHSCorp&nbsp;&nbsp;&nbsp;&nbsp;</span>
			</div>
		</div>
	</footer>	
<!-- footer 종료  -->
</div>
</body>
</html>