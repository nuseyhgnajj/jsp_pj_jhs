<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title>관리자) 게시판 상세페이지</title>

<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/admin/ad_boardDetail.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>
<script>
	$(function(){	//페이지가 로딩 되면
		//게시글 목록 버튼 클릭시 컨트롤러 목록으로 이동하라
		$("#btnList").click(function(){
			location.href = "${path}/board_list.bo";
		});
	
		//게시글 수정삭제화면으로 이동
		$("#btnEdit").click(function(){
			document.detailForm.action = "${path}/password_chkAction.bo";
			document.detailForm.submit();
		});
	});
	
</script>
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
				<form method = "post" name = "detailForm">
					<table item-align = "center">
						<tr>
							<th style = "width :200px">작성일</th>
							<td style = "width :200px" text-align :center>
								${dto.regDate}
							</td>
							
							<th style = "width :200px">조회수</th>
							<td style = "width :200px" text-align :center>
								${dto.readCnt}
							</td>
						</tr>
						<tr>
							<th style = "width :200px">작성자</th>
							<td style = "width :200px" text-align :center>
								${dto.writer}
							</td>
							
							<th style = "width :200px">비밀번호</th>
							<td text-align :center>
								<input style = "width :200px" type = "password" class ="input" name = "password" id ="password" size = "30"
									placeholder = "비밀번호 입력" required autofocus>
								<!-- 컨트롤러에서 비밀번호 인증 실패 시 전달받은 error message -->
								<c:if test ="${param.message == 'error'}">
									<br><span style ="color:red">비밀번호 불일치</span>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td colspan = "3" style = "text-align: center">
								${dto.title}
							</td>
						</tr>
						<tr style = "height:300px">
							<th>글내용</th>
							<td colspan = "3" style = "text-align: center">
								${dto.content}
							</td>
						</tr>
						<tr>
							<th></th>
							<td colspan = "3" style = "text-align: right" >
								<input type = "hidden" name = "num" value = "${dto.num}">
								<input type = "button" class ="btn" value = "수정/삭제" id="btnEdit">
								<input type = "button" class ="btn" value = "목록" id="btnList">
							</td>
					</table>
				</form>
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