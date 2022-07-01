<link href="/resources/css/h_myp001.css" media="all" rel="Stylesheet" type="text/css" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 변경 (user)</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common_check.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login.js" type="text/javascript"></script>
</head>

<body>
<%@ include file="header.jsp"%>
<form action="/user/updateInfo" id="form" onsubmit="return check()" method="post">
    <div id="mainbox">
        <h2>회원 정보 변경 (user)</h2>
        <input id="isSuccess" value="false" type="hidden">
        <table>
            <tr>
                <td>이름</td>
                <td><input type="text" name="u_name" id = "name"  value="${user.u_name}" disabled></td>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="u_mail" id = "id" value="${user.u_mail}" disabled></td>
            </tr>
            <tr>
                <td>핸드폰 번호</td>
                <c:set value="${fn:substring(uinfo.u_phone, 0, 3)}" var="u_phone1" />
                <c:choose>
                    <c:when test="${fn:length(uinfo.u_phone) eq 11}">
                        <c:set value="${fn:substring(uinfo.u_phone, 3, 7)}" var="u_phone2" />
                        <c:set value="${fn:substring(uinfo.u_phone, 7,11)}" var="u_phone3" />
                    </c:when>
                    <c:when test="${fn:length(uinfo.u_phone) eq 10}">
                        <c:set value="${fn:substring(uinfo.u_phone, 3, 6)}" var="u_phone2" />
                        <c:set value="${fn:substring(uinfo.u_phone, 6,10)}" var="u_phone3" />
                    </c:when>
                </c:choose>
                <td>
                    <input type="text" name="u_phone" value="${u_phone1}" maxlength="3" style="width: 55px;">-
                    <input type="text" name="u_phone" value="${u_phone2}" maxlength="4" style="width: 55px;">-
                    <input type="text" name="u_phone" value="${u_phone3}" maxlength="4" style="width: 55px;">
                </td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="u_nick" id ="nick" value="${user.u_nick}"><div id="msg"></div></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input id = "pw" name = "pw" type="password" required disabled></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input id = "pw2" type="password" required disabled></td>
                <td><button type="button" id="pwChangBtn" onclick = "hostPw()">비밀번호 변경하기</button></td>
            </tr>
            <tr>
                <td></td>
                <td id="alert_a" style="font-size: smaller"></td>
            </tr>
        </table>
        <div id = "button" style="margin-top: 30px;">
            <button type="submit" id="submitBtn" class="but" >수정하기</button>
        </div>
    </div>
</form>
</body>
<script>
    function check(){
        let isSuccess = $('#isSuccess').val();

        if(isSuccess === 'false'){
            let opener = window.open('/user/mypage_check?no=' + ${user.u_no},'','width=400px,height=400px')
            return false;
        } else {
            return true;
        }
    }

    function getReturnValue(isSucess){
        if(isSucess){
            $('#isSuccess').val('true');
            $('#form').submit();
        }
    }
</script>
</html>