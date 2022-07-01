<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rev002.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입완료</title>
</head>
<body>
<%@ include file="header_ver2.jsp"%>
<div class="main_aaa">
    <h1>회원가입이 완료되었습니다.</h1>
    <div class="btn">
        <button onclick="location.href='/'" class="rev_bt">메인으로</button>
        <button onclick="location.href='/login'" class="rev_bt">로그인하기</button>
    </div>
</div>
</body>
</html>