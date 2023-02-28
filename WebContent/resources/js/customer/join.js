/**
 * 		회원가입 validation check 
 */
//아이디 중복확인 버튼 클릭시 
// 1. 중복확인 페이지 open
function confirmId(){
	if(!document.joinform.id.value){
		alert("아이디를 입력하세요.");
		document.joinform.id.focus();
		return false;
	}
	let url = "/jsp_pj_126/idConfirmAction.do?id=" + document.joinform.id.value;
	window.open(url,"confirm","menubar=no, width = 400px, height = 300px");
	//컨트롤러로 url을 넘기므로 컨트롤러에 url을 추가해주세용
}

//회원가입 페이지 필수체크
function signInCheck(){
	//	2-1 ..중복확인 체크 <input type = "hidden" name = "hiddenId" value = "0">	==> JOINFORM 아래에 추가
	// hiddenId >> 중복확인 버튼 클릭 여부 체크 (0 = 클릭안함, 1 = 클릭~)				
	// 	2-2 .. 중복확인 버튼을 클릭하지 않은 경우 죽복확인 해주세요 메세지 띄우세용
	if(document.joinform.hiddenId.value == "0"){
		alert("중복확인 해주십쇼");
		document.joinform.dupChk.focus();
		return false;
	}
}
// --------------- 중복확인 --------------------
// 	3-1. 중복확인 페이지 - id 에 포커스
function idConfirmFocus(){
	document.confirmform.id.focus();
}
function idConfirmCheck(){
	//	3-2. 중복확인창 포커스
	if(!document.confirmform.id.value){
		alert("아이디를 입력해주십쇼");
		document.confirmform.id.focus();
		return false;
	}
}
// 	4. 자식창에서 부모창으로 id값을 전달
//self.close(); ==> 내창 닫기
// opener :window객체의  open()메서드로 열린 새창 (중복확인착)에서 부모창(회원가입폼)에 접근할 때 사용
// join.jsp ==> hiddenId : 중복확인 버튼 클릭 여부 체크 (0 클릭안함 1 클릭함)
function setId(id){
	opener.document.joinform.id.value = id;
	opener.document.joinform.hiddenId.value = "1";
	self.close();
}
//==================== 이메일 체크 =========================
function selectEmailChk(){
	if(document.joinform.email3.value =="0"){
		document.joinform.email2.value = "";
		document.joinform.email2.focus();
		return false;
	}else {
		document.joinform.email2.value = document.joinform.email3.value;
		return false;
	}

}
		