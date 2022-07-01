<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.treeview.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/screen.css" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.treeview.js" type="text/javascript"></script>
    <title>treeView</title>
</head>
<script>
    $(function() {
        $("#tree").treeview({
            collapsed: true,
            animated: "medium",
            control:"#sidetreecontrol",
            persist: "location"
        });
    })
</script>
<body>
<div id="sidetree" style="font-size: 20px; ">
    <div class="treeheader"></div>
    <div id="sidetreecontrol"><a href="?#">전체닫기</a> | <a href="?#">전체열기</a></div>
    <ul id="tree">
        <li>
            <strong>세정아이앤씨</strong>
            <ul>
                <li><a href="#">대표실</a></li>
            </ul>
            <ul>
                <li><a href="#">경영지원팀</a></li>
            </ul>
            <ul>
                <li><a href="#">기술연구소</a></li>
            </ul>
            <ul>
                <li>
                    <a href="#">솔루션사업본부</a>
                    <ul>
                        <li><a href="#">사업기획부</a></li>
                        <li><a href="#">솔루션1팀</a></li>
                        <li><a href="#">솔루션2팀</a></li>
                    </ul>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="#">시스템사업본부</a>
                    <ul>
                        <li><a href="#">시스템1팀</a></li>
                    </ul>
                </li>
            </ul>
            <ul>
                <li>
                    <a href="#">중부사업부</a>
                    <ul>
                        <li><a href="#">중부사업팀</a></li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</div>
</body>
</html>