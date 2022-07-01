<%--<script type="text/javascript" src="${pageContext.request.contextPath}"></script>--%>
<link href="${pageContext.request.contextPath}/resources/css/h_myp002.css" media="all" rel="Stylesheet" type="text/css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>하우스 수정(host용)</title>
</head>
<body>
<%@ include file="header.jsp"%>
<form method="post" action="/host/GhouseUpdate/${user.h_no}" onsubmit="return GHNO_Check()">
    <input type="hidden" value="${ghInfo.gh_no}" name="gh_no" id="gh_no">
    <input type="hidden" value="${user.h_no}" name="gh_hno">
    <div id="mainbox">
        <table>
            <h2>숙소 등록 현황</h2>
            <tr>
                <td>숙소명</td>
                <td>${ghInfo.gh_name}</td>
            </tr>
            <tr>
                <td>숙소위치</td>
                <td><input type="text" name="gh_addr1" value="${ghInfo.gh_addr1},${ghInfo.gh_addr2}" style="width: 387px;" readonly></td>
            </tr>
            <tr>
                <td style="padding-top: 10px;">등록된  객실수</td>
                <td>${roomList.size()} 개</td>
            </tr>
            <tr>
                <td style="padding-top: 10px;">객실</td>
                <td><input type="button" onclick="location.href='/room/write/${ghInfo.gh_no}'" id="roomInsertBtn" class="regi_btn" value="객실 등록하기" >&nbsp;<span id="roomInsertWaring"></span></td>
                <script>
                    if($('#gh_no').val() === ""){
                        $('#roomInsertBtn').attr('disabled', true)
                        $('#roomInsertWaring').text('게스트 하우스를 먼저 등록해주세요.').css("color", "red");
                    }

                    function GHNO_Check(){
                        if($('#gh_no').val() === ""){
                            alert("게스트 하우스를 먼저 등록해주세요.");
                            return false;
                        }
                        return true;
                    }
                </script>
            </tr>
            <tr>
                <td>한줄소개</td>
                <td><input type="text" name="gh_title" value="${ghInfo.gh_title}" style="width: 387px;"/></td>
            </tr>
            <tr>
                <td style="padding-bottom: 170px;"><label for="detail_text">상세소개</label></td>
                <td colspan="2"><textarea cols="55" rows="10" name="gh_detail" id="detail_text">${ghInfo.gh_detail}</textarea></td>
            </tr>
        </table>
        <table id = "room_fix">
            <h2>등록된 객실 정보</h2>
            <tr>
                <th>객실번호</th>
                <th>객실명</th>
                <th>기준인원</th>
                <th>상세보기</th>
            </tr>
            <c:forEach items="${roomList}" var="gr" varStatus="status">
            <tr>
                <td><input name="r_no" value="${gr.r_no}" class="room_input_s" readonly></td>
                <td><input name="r_name" value="${gr.r_name}" class="room_input" readonly></td>
                <td><input type="number" name="r_pmax" class="room_input_s" min="1" max="16" value="${gr.r_per}" readonly></td>
                <td><input type="button" onclick="location.href='/host/mypageRoomInfo/${gr.r_no}'" class="btn" value="상세보기"/></td>
            </tr>
            </c:forEach>
            <input type="hidden" name="gh_hno" value="${grList.get(0).gh_hno}">
        </table>
        <div id="btn_area">
            <button type="submit" class="conf_btn">수정완료</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button onclick="location.href='/host/mypage_host/${user.h_no}'" class="conf_btn">취소</button>
        </div>
    </div>
</form>
</body>
</html>