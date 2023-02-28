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
<link rel="stylesheet" href="../../resources/css/admin/ad_productList.css">
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
		<div id = "title"> <!-- 타이틀 메뉴-->
			<h1>Prdouct List</h1>
		</div>
<!-- 메뉴 -->
		<%@ include file ="/admin/common/leftMenu.jsp" %>
<!-- 메뉴 -->
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
	<!-- 푸터 시작 -->
	<%@ include file ="/admin/common/footer.jsp" %>
	<!-- 푸터 끝 -->
</div>
</body>
</html>