<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/u_lgn_001.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/host_login.js" type="text/javascript"></script>
    <title>host회원가입</title>
</head>
<body>
<%@ include file="header.jsp" %>
<form name="form" action="${pageContext.request.contextPath}/register/host" method="post" onsubmit="return loginSubmit()">
    <div class="container">
        <table>
            <tr><td><label for="owner">이름</label></td></tr>
            <tr><td><input type="text" id="owner" name="h_name" placeholder="이름" class="inp" autocomplete="off"></tr>
            <tr><td><label for="brand">숙박시설명</label></td></tr>
            <tr>
                <td><input type="text" id="brand" name="h_brand" placeholder="숙박시설명" class="inp" autocomplete="off">
                    <div id="msg"></div>
            </tr>
            <tr><td><label for="emailID">이메일</label></td></tr>
            <tr>
                <td>
                    <input type="text" id="emailID" name="username" placeholder="이메일">
                    <label for="emailAddr">@</label>
                    <input type="text" id="selboxDirect" style="height: 48px; width: 200px;" name="username"/>
                    <select id="emailAddr" name="username">
                    <option>선택</option>
                    <option value="@naver.com">naver.com</option>
                    <option value="@daum.net">daum.net</option>
                    <option value="@gmail.com">gmail.com</option>
                    <option value="@nate.com">nate.com</option>
                    <option value="direct">직접입력</option>
                    </select><p id="mail_check"></p>
                </td>
            </tr>
            <tr><td>전화 번호</td></tr>
            <tr>
                <td>
                    <label for="phonee"></label>
                    <select class="u_phone" name="h_phone" id="phonee">
                        <option>선택</option>
                        <option selected>010</option>
                    </select>
                    <label for="phone1"></label>
                    - <input type="text" id="phone1" class="u_phone" name="h_phone" maxlength="4" size="5" onkeyup="$(this).val($(this).val().replace(/\D/g,''));">
                    <label for="phone2"></label>
                    - <input type="text" id="phone2" class="u_phone" name="h_phone" maxlength="4" size="5" onkeyup="$(this).val($(this).val().replace(/\D/g,''));">
                </td>
            </tr>
            <tr><td><label for="pw">비밀번호</label></td></tr>
            <tr><td><input type="password" id="pw" name="password" class="inp" ></tr>
            <tr><td><label for="pwCheck">비밀번호 확인</label></td></tr>
            <tr><td><input type="password" id="pwCheck" name="u_pwd2" class="inp"></tr>
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



