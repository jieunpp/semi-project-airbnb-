<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/u_lgn_001.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login.js" type="text/javascript"></script>
    <title>user회원가입</title>
</head>
<body>
<%@ include file="header.jsp" %>
    <form name="form" action="${pageContext.request.contextPath}register/user" method="post" onsubmit="return loginSubmit()"><!--action="/user"--->
            <div class="container">
            <table>
                <tr><td>이름</td></tr>
                <tr><td><input type="text" id="name" name="u_name" class="inp" autocomplete="off"></td></tr>
                <tr>
                    <td><span id="g_ma">성별</span>
                    <input type="radio" id="man" name = "u_gender" value="남" class="gender"><label for="man">남성</label>
                    <input type="radio" id="woman" name = "u_gender" value="여" class="gender"><label for="woman">여성</label>
                    </td>
                </tr>
                <tr><td>닉네임 <span style="font-size: 11px;"> (한글+숫자만 입력가능합니다.)</span></td>
                </tr>
                <tr>
                    <td><input type="text" name="u_nick" id="nick" class="inp" autocomplete="off">
                        <div id="msg"></div>
                </tr>
                <tr>
                    <td>이메일</td>
                </tr>
               <tr>
                    <td>
                        <input type="text" id="emailID" name="username" placeholder="이메일" autocomplete="off"><!--NAME="U_MAIL"--->
                        @<input type="text" id="selboxDirect" style="height: 48px; width: 200px;" name="username"/>
                        <select id="emailAddr" name="username" >
                        <option>선택</option>
                        <option value="@naver.com">naver.com</option>
                        <option value="@daum.net">daum.net</option>
                        <option value="@gmail.com">gmail.com</option>
                        <option value="@nate.com">nate.com</option>
                        <option value="direct">직접입력</option>
                    </select>
                        <div id="mail_check"></div>
                    </td>
                </tr>
                <tr><td>비밀번호</td></tr>
                <tr><td><input type="password" id="pw" name="password" class="inp" ></tr><!--NAME="U_PW"---->
                <tr><td>비밀번호 확인</td></tr>
                <tr><td><input type="password" id="pwCheck" name="u_pwd2" class="inp"></tr>
                <tr><td>전화 번호</td></tr>
                <tr>
                    <td>
                    <select class="u_phone" name="u_phone" >
                        <option>선택</option>
                        <option selected>010</option>
                    </select>
                    - <input type="text" id="phone1" class="u_phone" name="u_phone" maxlength="4" size="5" onkeyup="$(this).val($(this).val().replace(/\D/g,''));" autocomplete="off">
                    - <input type="text" id="phone2" class="u_phone" name="u_phone" maxlength="4" size="5" onkeyup="$(this).val($(this).val().replace(/\D/g,''));" autocomplete="off">
                    </td>
                </tr>
            </table>
            <input type="submit" value="가입하기" class="btn">
        </div>
    </form>
<!-- 공간 비우기용-->
<div class="space"></div>
</body>
</html>
<script>
    $(function(){
        //직접입력 인풋박스 기존에는 숨어있다가
        $("#selboxDirect").hide();
        $("#emailAddr").change(function() {
            //직접입력을 누를 때 나타남
            if($("#emailAddr").val() == "direct") {
                $("#selboxDirect").show();
            }  else {
                $("#selboxDirect").hide();
            }
        })
    });
</script>
