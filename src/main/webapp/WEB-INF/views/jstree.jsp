<script type="text/javascript" src="${pageContext.request.contextPath}"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
    <title>jsTree</title>
</head>
<body>
    <div id="tree"></div>
<script>
    $('#tree').jstree({
        'core' : {
            'data' : [
                { "id" : "ajson1", "parent" : "#", "text" : "경영지원팀" },
                { "id" : "ajson2", "parent" : "#", "text" : "기술연구소" },
                { "id" : "ajson3", "parent" : "#", "text" : "솔루션사업본부" },
                { "id" : "ajson4", "parent" : "#", "text" : "시스템사업본부" },
                { "id" : "ajson5", "parent" : "#", "text" : "중부사업부" },
                { "id" : "ajson6", "parent" : "ajson3", "text" : "사업기획팀" },
                { "id" : "ajson7", "parent" : "ajson3", "text" : "솔루션1팀" },
                { "id" : "ajson8", "parent" : "ajson3", "text" : "솔루션2팀" },
                { "id" : "ajson9", "parent" : "ajson4", "text" : "시스템1팀" },
            ]
        }
    });
</script>
</body>
</html>