<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link href="${pageContext.request.contextPath}/resources/css/h_myp003.css" media="all" rel="Stylesheet" type="text/css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>객실 정보(host용)</title>
</head>
<body>
<%@ include file="header.jsp"%>
<form name="form" action="/host/RoomUpdate/${user.h_no}" method="post" enctype="multipart/form-data">
    <div id="mainbox">
        <table>
            <h2>객실 현황</h2>
            <input type="hidden" value="${room.get(0).r_no}" name="r_no" readonly class="info_input">
<%--            <tr>--%>
<%--                <td>객실번호</td>--%>
<%--                <td style="padding-left: 30px"><input type="" value="2" name="r_no" readonly class="info_input"></td>--%>
<%--            </tr>--%>
            <tr>
                <td>객실명</td>
                <td style="padding-left: 30px"><input type="text" value="${room.get(0).r_name}" name="r_name" class="info_input"></td>
            </tr>
            <tr>
                <td>객실요금</td>
                <td style="padding-left: 30px"><input type="text" value="${room.get(0).r_fee}" name="r_fee" class="info_input" onkeyup="$(this).val($(this).val().replace(/\D/g,''));"></td>
            </tr>
            <tr>
                <td>기준인원</td>
                <td style="padding-left: 30px"><input type="number" value="${room.get(0).r_per}" name="r_per" min="1" max="16" class="info_input" onkeyup="$(this).val($(this).val().replace(/\D/g,''));"></td>
            </tr>
            <tr>
                <td>한줄소개</td>
                <td style="padding-left: 30px"><input type="text"   name="r_title"  value="${room.get(0).r_title}" class="info_input"></td>
            </tr>
            <tr>
                <td style="padding-bottom: 170px;"><label for="detail_text">상세소개</label></td>
                <%--					<td><input type="text" value="${room.get(0).r_detail}" name="r_detail" width="300px" height="600px"></td>--%>
                <td style="padding-left: 30px"><textarea name="r_detail" cols="70" rows="10" id="detail_text">${room.get(0).r_detail}</textarea></td>
            </tr>
            <tr>
                <td colspan="3">[등록된 이미지 파일]<br><br>
              <c:forEach items="${room}" var="room" varStatus="status">
                    <img alt="객실사진" src="${pageContext.request.contextPath}/resources/room_image/${room.i_name}" style="width:290px; height: 290px">
                    <c:choose>
                        <c:when test="${status.count % 2 == 0}">
                            <br>
                        </c:when>
                    </c:choose>
                </c:forEach>
                </td>
            </tr>
        </table>
        <input type="hidden" value="" name="${room.get(0).r_ghno}" readonly>
        <div id="button">
            <button type ="submit" class="conf_btn">수정완료</button>&nbsp;&nbsp;&nbsp;
            <button type="button" onclick="location.href='/host/ImagesDelete/${room.get(0).r_no},${user.h_no}'" class="conf_btn">삭제하기</button>&nbsp;&nbsp;&nbsp;
            <button onclick="history.go(-1)" class="conf_btn">취소</button>
        </div>
    </div>
</form>
<script>
    function roomDelete(){
        let ok = confirm("등록된 방을 삭제하시겠습니까?");

        if(ok === true){
            location.href="/room/ImagesDelete/${room.get(0).r_no}";
        }
    }

</script>
</body>
</html>