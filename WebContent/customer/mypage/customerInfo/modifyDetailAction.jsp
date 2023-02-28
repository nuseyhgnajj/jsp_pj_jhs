<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="pj.mvc.jsp.dto.CustomerDTO"%>
    
<%@ include file ="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, initial-scale=1">
<title> 회원가입 </title>
<link 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
		crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/customer/join.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
		crossorigin="anonymous"></script>

<!-- join.js -->
<script src = "${path}/resources/js/customer/join.js" defer></script>

</head>
<body>
<div class="wrap">
	<!-- 헤더 시작 -->
	<%@ include file ="../../../common/header.jsp" %>
	<!-- 헤더 끝 -->

	<!-- 컨텐츠 시작 -->
	<container>
		<div id = "contents">
			<div id = "title"> <!-- 타이틀 메뉴-->
				<h1 align = "center">회원수정</h1>
			</div>
			<hr><br>
			<div id = "section">
				<div class = "join"> 
					<form name = "modifyform" action="${path}/modifyCustomerAction.do" method="post">
						<!-- 인증이 성공할때만 테이블에 작성합니다 -->
						<c:if test="${selectCnt == 1}">
							<table>
								<tr>
									<th>ID</th>
									<td colspan = "2">${dto.id}</td>
								</tr>	
								<tr>
									<th>비밀번호</th>
									<td colspan = "2">
										<input 	type = "password" class ="input" name = "password" size="20" 
												placeholder="공백없이 15자 이내로 작성" required value ="${dto.getPassword()}">
									</td>
								</tr>
								<tr>
									<th>비밀번호확인</th>
									<td colspan = "2">
										<input 	type = "password" class ="input" name = "repassword" size="20" 
												placeholder="비밀번호 확인" required value= "${dto.getPassword()}">
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td colspan = "2">
										<input 	type = "text" class ="input" name = "name" size="20" 
												placeholder="20자 이내로 작성" required value= "${dto.getName()}">
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td colspan = "2">
										<input	type = "date" class ="input" name = "birthday" size="8" 
												placeholder="생년월일 8자리" required value= "${dto.getBirthday()}">
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan = "2">
										<input 	type = "text" class ="input" name = "address" size="50" 
												placeholder="주소 작성" required value= "${dto.getAddress()}">
									</td>
								</tr>
								<tr>
									<th>전화번호</th>		
									<td>
										<!-- dto.getHp()값을 분배해줍니다 -->
										<c:if test = "${dto.getHp() == null}">
											<input type = "text" class ="input" name = "phone1" size="3" style="width:50px" required>
											-
											<input type = "text" class ="input" name = "phone2" size="4" style="width:50px" required>
											-
											<input type = "text" class ="input" name = "phone3" size="4" style="width:50px" required>		
										</c:if>
										
										<!-- hp가 null이 아니면 "-"을 기준으로 삼등분해서 배열에 담아 뿌려줍니다 -->
										<c:if test = "${dto.getHp() != null}">
											<c:set var = "hpArr" value ="${fn:split(dto.getHp(),'-')}" />		
												<input type = "text" class ="input" name = "phone1" size="3" style="width:50px" required value = "${hpArr[0]}">
												-
												<input type = "text" class ="input" name = "phone2" size="4" style="width:50px" required value = "${hpArr[1]}">
												-
												<input type = "text" class ="input" name = "phone3" size="4" style="width:50px" required value = "${hpArr[2]}">	
										</c:if>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<c:set var = "emailArr" value ="${fn:split(dto.getEmail(),'@')}" />		
											<input type = "text" class ="input" name = "email1" maxlength="20" style="width:120px" required value = "${emailArr[0]}">
											@
											<input type = "text" class ="input" name = "email2" maxlength="20" style="width:120px" required value = "${emailArr[1]}">
											<select class = "input" name = "email3" style="width:150px" onchange ="selectEmailChk();">			
												<option value="0">직접입력</option>
												<option value="naver.com">네이버</option>
												<option value="google.com">구글</option>
												<option value="daum.net">다음</option>
												<option value="nate.com">네이트</option>
											</select>
									</td>
								</tr>
								<tr>
									<td colspan = "3" style ="border-bottom:none">
										<br>
										<div align="right">
											<input class="inputButton" type = "submit"	value="회원정보 수정">
											<input class="inputButton" type = "reset"	value="초기화">
											<input class="inputButton" type = "button"	class="button" value="로그인" onclick="window.location='${path}/login.do'">
										</div>
									</td>
								</tr>
							</table>
						</c:if>
						<!-- 인증에 실패하면 스크립트 뿌려줍니다 -->
						<c:if test = "${selectCnt != 1 }">
							<script type = "text/javascript">
								setTimeout(function(){
									alert("인증실패");
									window.location="${path}/modifyCustomer.do";
								},1000);
							</script>	
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</container>
	<!-- 컨텐츠 종료 -->	
	<!-- 푸터 시작 -->
	<%@ include file ="/common/footer.jsp" %>
	<!-- 푸터 끝 -->
</div>
</body>
</html>