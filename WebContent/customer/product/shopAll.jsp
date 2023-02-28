<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../../common/setting.jsp" %>
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

<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/customer/product_list.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>
<script src="${path}/resources/js/customer/main.js" defer></script>

</head>
<body>
<div class="wrap">
	<!-- 헤더 시작 -->
	<%@ include file ="../../common/header.jsp" %>
	<!-- 헤더 끝 -->
	<br><br>
	<!-- 콘텐츠 시작 -->
	<container>
	    <div class = "section1">
			<div class = "title">
				<h2>Product List</h2>
	            <hr>
				<ul id = "title_ul" class = "list-unstyled">
					<li class="list-item list-inline-item" style = "font-weight: bold;">
						All Product
					</li>
	                <li class="list-item list-inline-item">
						New
					</li>
					<li class="list-item list-inline-item">
						Bedding
					</li>
					<li class="list-item list-inline-item">
						Fabric
					</li>
					<li class="list-item list-inline-item">
						Acc
					</li>
					<li class="list-item list-inline-item">
						Sale
					</li>
				</ul>
	            <hr>
			</div>
		</div>
	    <br>
	    <div class = "section2">
	        <ul class = "card_list">
	            <li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = "product_detail.html"><img src = "${path}/resources/images/product/Bedding/jejuLandscapebsddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>Jeju Landscape Bedding Set(SS/Q/K)</h5>
	                        <p class = "card_text"><span class = "badge_new">New</span><span class = "badge_soldout">Sold out</span></p>
	                        <small class = "card_price">￦248,000</small>
	                        <div class = "btn_group">
	                            <button type ="button" class = "btn_content">장바구니</button>
	                            <button type ="button" class = "btn_content">주문하기</button>
	                        </div> 
	
	                    </div>
	                </div> 
	            </li>
	            <li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = #><img src = "${path}/resources/images/product/Bedding/GangwondoNightBeddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>Gangwondo Night 2 Bedding Set(SS/Q/K)</h5>
	                        <p class = "card_text"><span class = "badge_new">New</span></p>
	                        <small class = "card_price">￦248,000</small>
	                        <div class = "btn_body">
	                            <div class = "btn_group">
	                                <button type ="button" class = "btn_content">장바구니</button>
	                                <button type ="button" class = "btn_content">주문하기</button>
	                            </div> 
	                        </div>
	                    </div>
	                </div> 
	            </li>
	            <li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = #><img src = "${path}/resources/images/product/Bedding/jejuMoraeBeddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>Jeju Morae Bedding Set(SS/Q/K)</h5>
							<br>
	                        <p class = "card_text"><span class = "badge_new">New</span></p>
	                        <small class = "card_price">￦248,000</small>
	                        <div class = "btn_body">
	                            <div class = "btn_group">
	                                <button type ="button" class = "btn_content">장바구니</button>
	                                <button type ="button" class = "btn_content">주문하기</button>
	                            </div> 
	                        </div>
	                    </div>
	                </div> 
	            </li>
	            <li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = #><img src = "${path}/resources/images/product/Bedding/jejuOceanBeddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>Jeju Ocean Bedding Set(SS/Q/K)</h5>
	                        <br>
							<p class = "card_text"><span class = "badge_new">New</span></p>
	                        <small class = "card_price">￦248,000</small>
	                        <div class = "btn_body">
	                            <div class = "btn_group">
	                                <button type ="button" class = "btn_content">장바구니</button>
	                                <button type ="button" class = "btn_content">주문하기</button>
	                            </div> 
	                        </div>
	                    </div>
	                </div> 
	            </li>
	            <li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = #><img src = "${path}/resources/images/product/Bedding/jejuOrrumBeddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>Jeju Orrum Bedding Set(SS/Q/K)</h5>
	                        <br>
							<p class = "card_text"><span class = "badge_new">New</span></p>
	                        <small class = "card_price">￦248,000</small>
	                        <div class = "btn_body">
	                            <div class = "btn_group">
	                                <button type ="button" class = "btn_content">장바구니</button>
	                                <button type ="button" class = "btn_content">주문하기</button>
	                            </div> 
	                        </div>
	                    </div>
	                </div> 
	            </li>
	            <li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = #><img src = "${path}/resources/images/product/Bedding/PZGMujiCharcoalBeddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>PZA Muzi Charcoal Bedding Set(SS/Q/K)</h5>
	                        <p class = "card_text"><span class = "badge_new">New</span></p>
	                        <small class = "card_price">￦149,000</small>
	                        <div class = "btn_body">
	                            <div class = "btn_group">
	                                <button type ="button" class = "btn_content">장바구니</button>
	                                <button type ="button" class = "btn_content">주문하기</button>
	                            </div> 
	                        </div>
	                    </div>
	                </div> 
	            </li>
	            <li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = #><img src = "${path}/resources/images/product/Bedding/PZGMujiDeepBlueBeddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>PZA MuziDeep Blue Bedding Set(SS/Q/K)</h5>
	                        <p class = "card_text"><span class = "badge_new">New</span></p>
	                        <small class = "card_price">￦149,000</small>
	                        <div class = "btn_body">
	                            <div class = "btn_group">
	                                <button type ="button" class = "btn_content">장바구니</button>
	                                <button type ="button" class = "btn_content">주문하기</button>
	                            </div> 
	                        </div>
	                    </div>
	                </div> 
	            </li>
	            <li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = #><img src = "${path}/resources/images/product/Bedding/PZGMujiDeepGreenBeddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>PZA Muzi Deep Green Bedding Set(SS/Q/K)</h5>
	                        <p class = "card_text"><span class = "badge_new">New</span></p>
	                        <small class = "card_price">￦149,000</small>
	                        <div class = "btn_body">
	                            <div class = "btn_group">
	                                <button type ="button" class = "btn_content">장바구니</button>
	                                <button type ="button" class = "btn_content">주문하기</button>
	                            </div> 
	                        </div>
	                    </div>
	                </div> 
	            </li><li class = "card_item">
	                <div class = "card">
	                    <div class = card_img>
	                        <a href = #><img src = "${path}/resources/images/product/Bedding/PZGMujiYellowBeddingSet.jpg"></a>
	                    </div>
	                    <div class = "card_contents">
	                        <h5>PZA Muzi Yellow Bedding Set(SS/Q/K)</h5>
	                        <p class = "card_text"><span class = "badge_new">New</span></p>
	                        <small class = "card_price">￦149,000</small>
	                        <div class = "btn_body">
	                            <div class = "btn_group">
	                                <button type ="button" class = "btn_content">장바구니</button>
	                                <button type ="button" class = "btn_content">주문하기</button>
	                            </div> 
	                        </div>
	                    </div>
	                </div> 
	            </li>
	
	        </ul>
	    </div>
	    <nav aria-label="Page navigation example">
	        <ul id="page" class="pagination ">
	          <li class="page-item">
	            <a class="page-link" href="#" aria-label="Previous">
	              <span aria-hidden="true">&laquo;</span>
	            </a>
	          </li>
	          <li class="page-item"><a class="page-link" href="#">1</a></li>
	          <li class="page-item"><a class="page-link" href="#">2</a></li>
	          <li class="page-item"><a class="page-link" href="#">3</a></li>
	          <li class="page-item">
	            <a class="page-link" href="#" aria-label="Next">
	              <span aria-hidden="true">&raquo;</span>
	            </a>
	          </li>
	        </ul>
	    </nav>
	</container>
	<br>
	<!-- 콘텐츠 종료 -->
	<!-- 푸터 시작 -->
	<%@ include file ="../../common/footer.jsp" %>
	<!-- 푸터 끝 -->
</div>
</body>
</html>