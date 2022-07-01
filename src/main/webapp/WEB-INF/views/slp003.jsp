<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slp003.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
        <sec:authentication property="principal.authInfo" var="user"/>
    <meta charset="UTF-8">
    <title>객실정보</title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/rev.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/datepicker.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.min.css">
    <script>
        function num() {
            $(document).on("keyup", "input[name^=b_pno]", function () {
                let val = $(this).val();

                if (val < 1 || val > ${getDetail.get(0).r_per}) {
                    <%--alert("기준인원수는 최대 ${getDetail.get(0).r_per}명입니다.");--%>
                    $(this).val('');
                }
            });
        }
    </script>
    <script>
        $(function(){
            $('.silde_gallery').bxSlider({
                auto:true,
                autoControls:true,
                stopAutoOnClick:true,
                pager:true
            })
        })
    </script>
</head>
<body>
<%@ include file="header_ver2.jsp" %>
<section>
<c:if test="${getDetail.size() != 0}">
    <div class="main">
        <div class="room_info">
            <div id="gallery_wrap">
                <ul class="silde_gallery"><img src="/resources/room_image/pexels-vecislavas-popa-1643383.jpg" alt="객실이미지" style="width: 1000px; height: 400px;">
                    <c:forEach items="${getDetail}" var="dt" varStatus="status">
                        <li><img src="${pageContext.request.contextPath}/resources/room_image/${dt.i_name}" alt="객실이미지" style="width: 1000px; height: 400px;"></li>
                    </c:forEach>
                </ul>
            </div>

            <div class="room_date">
                <form name="form" id="form_sub" action="/book/beforeBooking/${user.u_no},${getDetail.get(0).r_no}">
                    <table>
                        <tbody>
                        <tr><th class="title">${getDetail.get(0).r_name}</th></tr>
                        <tr><th style="background-color: #111;"></th></tr>
                        <tr><th>체크인　　<input type="text" id="startDate" name="b_in" placeholder="체크인날짜" autocomplete="off" class="chk_input" style="width:100%; height: 48px;"></th></tr>
                        <tr><th>체크아웃　<input type="text" id="endDate" name="b_out" placeholder="체크아웃날짜" autocomplete="off" class="chk_input"  style="width:100%; height: 48px; "></th></tr>
                        <tr><th>기준인원  <span style="font-size: 11px;">(최대인원은${getDetail.get(0).r_per}인입니다)</span>
                            <input type="number" id="per" name="b_pno" value="${getDetail.get(0).r_per}" min="1" max="${getDetail.get(0).r_per}" class="chk_input" oninput="num(this)" autocomplete="off" style="width:100%; height: 48px; "></th></tr>
                        <tr><th style="background-color: #f5f5f5;"></th></tr>
                        <tr><th>객실요금　　</th></tr>
                        <tr><td style="text-align: right; font-weight: bold; font-size:25px; ">₩ <fmt:formatNumber value="${getDetail.get(0).r_fee}" pattern="#,###" /></td></tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <div class="room">
            <p style="font-size: smaller;"><img src="${pageContext.request.contextPath}/resources/img/img-dot_3@2x.png" style="margin-right: 10px;" alt="객실">객실소개</p>
            <p>   ${getDetail.get(0).r_detail} </p>
        </div>
        <div class="room_spec">
            <div class="spec_text">
            <p>기본 정보</p>
            <ul>
                <li>공동으로 사용하는 공간인 만큼, 이용규칙을 준수해주세요</li>
                <li>기준인원 초과시, 현장에서 추가 요금이 발생할 수 있습니다.</li>
                <li>업체의 시설물의 훼손, 분실에 대한 책임은 본인에게 있습니다.</li>
                <li>객실 내 흡연은 금지입니다. 지정장소를 이용바랍니다.</li>
                <li>개인용품 보관에 관한 책임은 본인에게 있습니다.</li>
            </ul>
            <hr>
            <p>예약공지</p>
            <ul>
                <li>당일예약은 특성상 환불 및 취소가 불가합니다.</li>
                <li>체크인은 22:00까지 가능합니다. 22:00이후 입실이 불가하며,<br>
                    이 경우, 취소/환불은 불가합니다.</li>
                <li>객실요금은 기준인원에 따라 다르며, 파티룸 등 특수한 객실의 경우,<br>
                    직접 입실 인원 확인이 필요합니다.</li>
                <li>미성년자의 입실 가능여부는 제한이 될 수 있으니, 전화로 문의해주세요.</li>
                <li>미성년자 혼숙예약으로 인해 발생하는 입실 거부에 대해서는 취소/환불이 불가합니다.</li>
                <li>숙박업소의 사정에 의한 취소 발생 시 100% 환불 처리 됩니다.</li>
            </ul>
            <hr>
            <p>취소 규정</p>
            <ul>
                <li>취소 및 환불 불가</li>
            </ul>
            </div>
        </div>
        <div class="btn_f" style="margin-bottom: 20px;">
            <input type=button value="예약하기" onclick="reservation();" class="btn" ><!---document.getElementById('form_sub').submit();//  ---->
        </div>
    </div>
</c:if>
</section>
<%@include file="footer.jsp"%>
</body>
</html>