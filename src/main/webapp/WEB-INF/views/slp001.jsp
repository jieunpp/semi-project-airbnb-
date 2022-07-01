<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slp001.css">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-custom.js"></script>
    <title>숙소리스트</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="total">
    <h1>숙소리스트</h1>
        <div class="main">
            <c:forEach items="${list}" var="li" varStatus="status">
                        <DIV class="div_list">
                            <ul class="product_list">
                                <li>
                                    <dl>
                                        <dt>
                                            <a href="/house/detail/${li.gh_no}">${li.gh_name}</a>
                                        </dt>
                                        <dd class="img">
                                            <a href="/house/detail/${li.gh_no}"><img src="${pageContext.request.contextPath}/resources/gh_image/${li.gh_image}" alt="숙소대표사진" width="370px" height="373px" ></a>
                                        </dd>
                                        <dd class="sub_title">${li.gh_addr1}</dd>
                                    </dl>
                                </li>
                            </ul>
                        </DIV>
            </c:forEach>
        </div>
</div>
</body>
</html>
