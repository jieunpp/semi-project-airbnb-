ㅅ<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/h_slp001.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>객실 등록</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/house.js" charset="utf-8"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="total">
    <form name="form" action="/room/room_write" method="post" onsubmit="return  write_check()">
        <input type="hidden" name="r_ghno" value="${gh_no}">
        <h2>객실 등록</h2>
        <div class="section">
            <div class="title">
                <label for="gh_name">객실명</label><br>
                <input type="text" name="r_name" id="gh_name" class="input_size2"><br>
                <label>가격<input type="number" name="r_fee" class="input_size3" step="100"></label>
            </div>
            <div class="detail">
                <p><label for="r_per">기준 인원</label><input type="number" min="1" max="16" name="r_per" id="r_per" class="input_size4"></p>
            </div>
            <div class="content">
                <label for="r_title">한줄소개</label><br>
                <input type="text" name="r_title" id="r_title" class="input_size2"><br>
                <p><label for="r_detail">상세소개</label></p>
                <textarea rows="auto" cols="80" name="r_detail" id="r_detail"></textarea>
            </div>
            <div class="button_">
                <input type="submit" class="but" value="글 올리기">
                <button type="reset" class="but">다시쓰기</button>
                <button type="button" value="뒤로가기" onclick="history.back()" class="but">뒤로가기</button>
            </div>
        </div>
    </form>
        <div class="clear"></div>
</div>
</body>
</html>