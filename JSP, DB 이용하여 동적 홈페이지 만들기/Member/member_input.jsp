<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
@font-face {
	font-family: 'Cafe24Shiningstar';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Shiningstar.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: Cafe24Shiningstar, serif;
}

table {
	border-collapse: collapse;
}

td {
	border: hidden;
}
</style>
<SCRIPT LANGUAGE="JavaScript">
function Check() {
	if (Member_Input.id.value.length < 1){
		alert("아이디를 입력하세요.");
		Member_Input.id.focus();
		return false;
	}
	if (Member_Input.pass.value.length < 1){
		alert("비밀번호를 입력하세요.");
		Member_Input.pass.focus();
		return false;
	}
	if (Member_Input.name.value.length < 1){
		alert("이름을 입력하세요.");
		Member_Input.name.focus();
		return false;
	}
	if (Member_Input.juminnum1.value.length < 1){    // 주민번호 첫 6자리, 빈칸 여부
		alert("주민등록번호를 입력하세요.");
		Member_Input.juminnum1.focus();
		return false;
	}
	if (Member_Input.juminnum1.value.length!= 6){ // 6자리 입력 여부
		alert("주민등록번호 앞자리는 6자리 입니다.");
		Member_Input.juminnum1.focus();
		return false;
	}
	for (var i=0;i<Member_Input.juminnum1.value.length;i++)   {   // 주민번호 0-9 숫자입력 여부
		if (Member_Input.juminnum1.value.charAt(i) < "0" || Member_Input.juminnum1.value.charAt(i) > "9") {
			alert("주민등록번호는 숫자만 가능합니다.");
			Member_Input.juminnum1.focus();
			return false;
		}
	}
	if (Member_Input.juminnum2.value.length < 1){      // 주민번호 둘째 7자리 입력 여부
		alert("주민등록번호를 입력하세요.");
		Member_Input.juminnum2.focus();
		return false;   	
	} 
	if (Member_Input.juminnum2.value.length != 7 ){   // 7자리 입력 여부
		alert("주민등록번호 뒷자리는 7자리 입니다.");
		Member_Input.juminnum2.focus();
		return false;
	}
	for (var i=0;i<Member_Input.juminnum2.value.length;i++) {
		if (Member_Input.juminnum2.value.charAt(i) < "0" || Member_Input.juminnum2.value.charAt(i) > "9") {
			alert("주민등록번호는 숫자만 가능합니다.");
			Member_Input.juminnum2.focus();
			return false;
		}
	}
	var sum,a,b,c,d,e,f,g,j,i,j,k,l,m;
	a = parseInt(Member_Input.juminnum1.value.charAt(0));
	b = parseInt(Member_Input.juminnum1.value.charAt(1)); 
	c = parseInt(Member_Input.juminnum1.value.charAt(2));
	d = parseInt(Member_Input.juminnum1.value.charAt(3));
	e = parseInt(Member_Input.juminnum1.value.charAt(4));
	f = parseInt(Member_Input.juminnum1.value.charAt(5));
	g = parseInt(Member_Input.juminnum2.value.charAt(0));
	h = parseInt(Member_Input.juminnum2.value.charAt(1));
	i = parseInt(Member_Input.juminnum2.value.charAt(2));
	j = parseInt(Member_Input.juminnum2.value.charAt(3));
	k = parseInt(Member_Input.juminnum2.value.charAt(4));
	l = parseInt(Member_Input.juminnum2.value.charAt(5));
	m = parseInt(Member_Input.juminnum2.value.charAt(6));

	sum = a*2 + b*3 + c*4 + d*5 + e*6 + f*7 + g*8 + h*9 + i*2 + j*3 + k*4 + l*5;
	var namuji = sum % 11;
	var gumsa = 11 - namuji;
	var check_no = gumsa % 10;
	
	/* 
	if (check_no != m){   // 불법 주민번호 경우 오류 경고 출력
		alert("올바른 주민등록번호가 아닙니다.");
		Member_Input.juminnum2.focus();
		return false;
	}	 
	
	*/ 
 	return true; 
}

function Check_focus()  // 주민 자릿수 체크
{
	var strfocus1 = Member_Input.juminnum1.value.length;
	if(strfocus1 == 6) {  // 첫 주민입력하면, 자동 둘째자릿수로 포커스
	    Member_Input.juminnum2.focus();
	}
}	  
/* 
function ZipCode()  // 우편번호검색 선택시, 윈도우 생성후 p.21의 zipcode2.jsp 호출하여 내용물 출력
{    
	browsing_window = window.open("zipcode2.jsp", "_zipinput","height=300,width=600,      
    menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
    browsing_window.focus();
}
 */
function Check_id()   // 중복 id 체크, 별도 창 띄움
{   // P.28 호출
	browsing_window = window.open("checkid.jsp?id=" + Member_Input.id.value, "_idcheck","height=200,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
	browsing_window.focus();
}
</SCRIPT>
</head>

<body>
<center>
	<font size='6'>
		<b> 
			회원 가입 
		</b>
	</font>  
	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
		<TR>
			<TD>
				<hr size='1' noshade>
			</TD> 	
		</TR>
	</TABLE>
	<FORM Name='Member_Input' Method='post' Action='member_output.jsp' OnSubmit='return Check()'>
		<TABLE  border='2' cellSpacing=0 cellPadding=5 align=center>
			<TR>
				<TD bgcolor='white' align='center'>
					<font size='3'>아 이 디</font> 	
				</TD>
				<TD bgcolor='white'>
					<input type='text' maxLength='10' size='10' name='id'>
					<input type='button' OnClick='Check_id()' value='ID 중복검사'>
				</TD>
			</TR>
			<TR>	
				<TD bgcolor='white' align='center'>
					<font size='3'>비 밀 번 호</font>
				</TD>
				<TD bgcolor='white'>
					<input type='password' maxLength='10' size='10' name='pass'>
				</TD> 
			</TR>
			<TR>
				<TD bgcolor='white' align='center'>
					<font size='3'>이 름</font>
				</TD>
				<TD bgcolor='white'>
					<input type='text' maxLength='10' size='10' name='name'>
				</TD>
			</TR>
			<TR>	
				<TD bgcolor='white' align='center'>
					<font size='3'>주민등록번호</font>
				</TD>
				<TD bgcolor='white'>
					<input type='text' size='6' maxlength='6' name='juminnum1' OnKeyPress='Check_focus();'>- 
					<input type='text' size='7' maxlength='7' name='juminnum2'> 
				</TD>
			</TR>
			<!-- 
			<TR>
				<TD bgcolor='cccccc' align='center'>
					<font size='2'>우 편 번 호</font>
				</TD>
				<TD bgcolor='cccccc'>
					<input type='text' maxlength='7' size='7' name='zip' onFocus='Member_Input.address2.focus()'>
					<input OnClick='ZipCode()' type='button' value='우편번호검색'>
				</TD>
			</TR>
			 -->
			<TR>
				<TD bgcolor='white' align='center'>
					<font size='3'>주 소</font>
				</TD>
				<TD bgcolor='white'>
					<input type='text' maxlength='50' size='50' name='address1' onFocus='Member_Input.address2.focus()'><BR>
					<input type='text' maxlength='50' size='50' name='address2'>
				</TD>
			</TR>
			<TR>	
				<TD bgcolor='white' align='center'>
					<font size='3'>전 화 번 호</font>
				</TD>
				<TD bgcolor='white'>
					<input type='text' maxlength='20' size='20' name='phone'>
				</TD>
			</TR>
			<TR>	
				<TD bgcolor='white' align='center'>
					<font size='3'>E - M a i l</font>
				</TD>
				<TD bgcolor='white'>
					<input type='text' maxlength='50' size='50' name='email'>
				</TD>
			</TR> 
		</TABLE>
		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD>
					<hr size='1' noshade>
				</TD>
 			</TR>
		</TABLE>
		<TABLE>
			<TR>
				<TD colspan='2' align='center'>
					<input Type = 'Submit' Value = '회원가입'>
				</TD>
			</TR>
		</TABLE>
	</FORM>
</body>
</html>