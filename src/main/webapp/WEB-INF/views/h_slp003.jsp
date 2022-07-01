<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/h_slp003.css" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="${pageContext.request.contextPath}/resources/js/house.js" type="text/javascript"></script>
    <title>객실 이미지 등록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="cent">
    <form name="form" action="/room/h_slp003/${rm.r_no}" method="post" enctype="multipart/form-data" onsubmit="return write_images();">
        <div class="tit_s">객실 이미지 업로드</div>
        <div class="section">
            <div class="title">
                <input type="file" name="files" id="files" size="10"  accept="image/jpeg, image/png, image/jpg"  multiple >
            </div>
            <div >
               <input class="button_" type="submit" value="글 올리기">
                <button class="button_" type="button" value="뒤로가기" onclick="history.back()">뒤로가기</button>
            </div>
        </div>
    </form>
    <div class="clear"></div>
</div>
</body>
</html>
