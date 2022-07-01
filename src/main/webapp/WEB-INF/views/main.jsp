<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}resources/css/main2.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}resources/js/datepicker.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}resources/js/local_data.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}resources/js/login.js" type="text/javascript"></script>
    <title>main</title>
</head>
<body>
<sec:authentication property="principal" var="session"/>
<c:if test="${session ne 'anonymousUser'}">
    <sec:authentication property="principal.authInfo" var="user"/>
    <sec:authentication property="principal.authInfo.authValue.role" var="userType"/>
</c:if>
    <div class="main_content">
        <div class="header">
            <h1><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}resources/img/gnb-logo.png" alt="로고"> </a></h1>
            <div class="nav">
                <c:if test="${empty user}">
                    <ul>
                        <li><a onclick="location.href='/login'" style="cursor: pointer;">LOGIN</a></li>
                        <li><a href="javascript:join_popup()">JOIN</a></li>
                    </ul>
                </c:if>
                <c:choose>
                    <c:when test="${userType eq 'HOST'}">
                        <ul>
                            <li><a href="/host/mypage_host/${user.h_no}">MYPAGE</a></li>
                            <li><a href="${pageContext.request.contextPath}/logout">LOGOUT</a></li>
                        </ul>
                    </c:when>
                    <c:when test="${userType eq 'USER'}">
                        <ul>
                            <li><a href="/user/mypage_user/${user.u_no}">MYPAGE</a></li>
                            <li><a href="${pageContext.request.contextPath}/logout">LOGOUT</a></li>
                        </ul>
                    </c:when>
                </c:choose>
            </div>
        </div>
        <div class="main_title">
                <form action = "/house/searchValue" method = "get" class="searchArea">
                    <label style="padding-left: 1em;" for="local" class="searchTitle">여행지</label>
                    <input type="text" name = "local" id="local" autocomplete="off" class="main_input">
                    <label for="startDate" class="searchTitle">체크인</label><input class="main_input" type="text" id="startDate" name="체크인" autocomplete="off">
                    <label for="endDate" class="searchTitle">체크아웃</label><input class="main_input" type="text" id="endDate" name="체크아웃" autocomplete="off" >
                    <button type = "submit" style="display: flex; align-items: center;"><img src="${pageContext.request.contextPath}resources/img/ico-search.png" alt="검색" ><span style="font-size: 18px; margin-left: 5px;">검색</span></button>
                </form>
        </div>
    </div>
    <div class="semi_content">
            <div class="list_content">
                <div class="list_title">
                    <h2>추천여행지</h2>
                </div>
                <ul class="product_list">
                    <li>
                        <dl>
                            <dd class="img">
                                <a href="/house/searchValue?local=부산"><img src="${pageContext.request.contextPath}/resources/img/img-visual-1.png" alt="부산" style="width:370px; height: 360px; position: absolute;">
                                    <p style="position: relative;color: white; font-size: 30px;top: 260px; left: 30px;">여름에는<br> 부산어때요?</p>
                                    <img src="${pageContext.request.contextPath}/resources/img/btn-next@3x.png" alt="화살표" style="position: relative; width: 110px; left: 230px;top: 200px;">
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dd class="img">
                                <a href="/house/searchValue?local=강릉"><img src="${pageContext.request.contextPath}resources/img/img-visual-2.png" alt="남해" style="width:370px; height: 360px;  position: absolute;">
                                    <p style="position: relative;color: white; font-size: 30px;top: 260px; left: 30px;">시원한<br>강릉어때요?</p>
                                    <img src="${pageContext.request.contextPath}/resources/img/btn-next@3x.png" alt="화살표" style="position: relative; width: 110px; left: 230px;top: 200px;">
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dd class="img">
                                <a href="/house/searchValue?local=제주"><img src="${pageContext.request.contextPath}resources/img/img-visual-3.png" alt="제주" style="width:370px; height: 360px; position: absolute;">
                                    <p style="position: relative;color: white; font-size: 30px;top: 260px; left: 30px;">푸른밤<br> 제주도어때요?</p>
                                    <img src="${pageContext.request.contextPath}/resources/img/btn-next@3x.png" alt="화살표" style="position: relative; width: 110px; left: 230px;top: 200px;">
                                </a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="main_text2">
                        <div><h1>호스트가 되어보세요</h1></div>
                        <div>숙소를 공유하여 수입을 올리고 새로운 가능성을 만나세요.</div>
                <c:if test="${empty user}">
                    <div class="more"><button onclick="no()" class="house_btn" style="cursor: pointer;">숙소등록하기</button></div>
                </c:if>
                <c:choose>
                    <c:when test = "${userType eq 'USER'}">
                     <div class="more"><button onclick="no()" class="house_btn" style="cursor: pointer;">숙소등록하기</button></div>
                    </c:when>
                    <c:when test = "${userType eq 'HOST'}">
                    <div class="more"><button class="house_btn" onclick="location.href='/h_slp001'" style="cursor: pointer;">숙소등록하기</button></div>
                    </c:when>
                </c:choose>
            </div>
    </div>
<script>
    function no(){
        alert("호스트만 사용가능한 기능입니다. \n 호스트로 로그인 해주시길 바랍니다.");
    }
</script>
<%@include file="footer.jsp"%>
</body>
</html>