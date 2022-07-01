<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
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
    <title>숙소등록하기</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/house.js" charset="utf-8"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="total">
    <form name="form" action="house/insert/${user.h_no}" method="post" onsubmit="return house_write_check()" enctype="multipart/form-data">
        <h2>숙소 등록</h2>
        <div class="section">
            <div class="title">
                <label for="gh_name">숙소명</label><br>
                <input type="text" name="gh_name" id="gh_name" class="input_size2">
            </div>
            <div class="title2">
                <p>이미지 업로드&nbsp;&nbsp;&nbsp;</p>
                <input type="file" name="files" id="gh_image"  accept="image/*" style="margin-bottom: 10px;" >
            </div>
            <label for="gh_addr1">주소</label><br>
            <input type="text" class="input_size" id="gh_addr1" name="gh_addr1" placeholder="주소" readonly>&nbsp;
            <input type="button" class="btn_juso" onclick="sample6_execDaumPostcode()" value="주소검색"><br>
            <input type="text" class="input_size2" id="gh_addr2" name="gh_addr2" placeholder="상세주소" style="margin-bottom: 10px;">
        </div>
        <div class="content">
            <label for="gh_title">한줄소개</label><br>
            <input type="text" name="gh_title" id="gh_title" class="input_size2">
            <p>상세소개</p>
            <label for="gh_detail"></label>
            <textarea rows="auto" cols="80" name="gh_detail" id="gh_detail"></textarea>
        </div>
        <div class="button_">
            <input type="submit"  class="but" value="글 올리기">
            <button type="reset" class="but">다시쓰기</button>
            <button type="button" value="뒤로가기" onclick="history.back()" class="but">뒤로가기</button>
        </div>
    </form>
</div>
<div class="clear"></div>
</body>
</html>
