<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title> 관리자) 게시판 수정 및 삭제 페이지</title>

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
	
		//게시글 수정버튼 클릭 시 컨트롤러의 수정으로 이동
		$("#btnEdit").click(function(){
			const password = $("#password").val();
			const title = $("#title").val();
			const content = $("#content").val();
			
			if(password == ""){
				alert("비밀번호 입력하세용");
				$("#password").focus();
				return false;
			}
/*  			if(title == null){
				alert("제목을 입력하세용");
				$("#title").focus();
				return false;
			}
			if(content == null){
				alert("내용을 입력하세용");
				$("#content").focus();
				return false;
			}  */
			document.editForm.action = "${path}/board_UpdateAction.bo";
			document.editForm.submit();
		});
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.editForm.action = "${path}/board_DeleteAction.bo";
				document.editForm.submit();
				alert("삭제처리했습니다");
			}else {
				return;
			}

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
<!-- 메뉴 -->
	<%@ include file ="/admin/common/leftMenu.jsp" %>
<!-- 메뉴 -->
	<div id ="contents">
		<div id = "section2">
			<div class = "table_div">
				<form method = "post" name = "editForm">
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
								<input 	style = "width :200px" type = "password" class ="input" name = "password" id ="password" 
										size = "30" value = "${dto.password}">
							</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td colspan = "3" style = "text-align: center">
								<input type = "text" class ="input" name = "title" id = "title" size = "50" value = "${dto.title}">
							</td>
						</tr>
						<tr style = "height:300px">
							<th>글내용</th>
							<td colspan = "3" style = "text-align: center">
								<textarea  rows = "15" cols = "93" name = "content" id = "content">${dto.content}</textarea>
							</td>
						</tr>
						<tr>
							<th></th>
							<td colspan = "3" style = "text-align: right" >
								<input type = "hidden" name = "num" value = "${dto.num}">
								<input type = "button" class ="btn" value = "수정" id="btnEdit" name ="btnEdit">
								<input type = "button" class ="btn" value = "삭제" id="btnDelete" name = "btnDelete">
								<input type = "button" class ="btn" value = "목록" id="btnList">
							</td>
						</tr>
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