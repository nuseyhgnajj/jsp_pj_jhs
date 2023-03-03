<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 좌측메뉴</title>
</head>
<body>
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
			<a href = "${path}/board_list.bo">게시판&nbsp;</a>
			<a href = "total_income.html">결산&nbsp;&nbsp;</a>
			<a href = "logout.html">로그아웃</a>
		</div>
	</div>
	<hr><br>
</body>
</html>