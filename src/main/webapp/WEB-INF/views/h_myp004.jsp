<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}"></script>--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/h_myp004.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bookingAccept.js" type="text/javascript"></script>
    <title>예약고객 승인/거부</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div id = "mainbox">
    <h2>고객 리스트</h2>
    <p>수락을 기다리는 고객이 있습니다.</p>
    <section>
        <table>
            <tr>
                <th>숙소명</th>
                <th>객실명</th>
                <th>고객명</th>
                <th>연락처</th>
                <th>인원</th>
                <th>체크인</th>
                <th>체크아웃</th>
                <th>결제금액</th>
                <th>예약상태</th>
                <th>승인 및 거절</th>
            </tr>
            <c:forEach var="book" items="${bookList}">
            <tr>
                <td>
                    ${book.gh_name}
                </td>
                <td>
                    ${book.r_name}
                </td>
                <td>
                    ${book.u_name}
                </td>
                <td>
                    ${book.u_phone}
                </td>
                <td>
                    ${book.b_pno}
                </td>
                <td>
                    ${fn:substring(book.b_in, 0, 10)}
                </td>
                <td>
                    ${fn:substring(book.b_out, 0, 10)}
                </td>
                <td>
                    ₩<fmt:formatNumber value="${book.b_price}" pattern="#,###" />
                </td>
                <td id="b_state_${book.b_no}">
                    <c:choose>
                        <c:when test="${book.b_state eq 0}">
                            대기중
                        </c:when>
                        <c:when test="${book.b_state eq 1}">
                            승인
                        </c:when>
                        <c:when test="${book.b_state eq 2}">
                            거부
                        </c:when>
<%--                        <c:when test="${book.b_state eq 3}">--%>
<%--                            취소--%>
<%--                        </c:when>--%>
                    </c:choose>
                </td>
                <td>
                    <button class="list_btn" onclick="booking_accept(${book.b_no});">승인</button> &nbsp;/&nbsp;
                    <button class="list_btn" onclick="booking_cancel(${book.b_no});">거절</button>
                </td>
            </tr>
            </c:forEach>
        </table>
    </section>
</div>
</body>
</html>