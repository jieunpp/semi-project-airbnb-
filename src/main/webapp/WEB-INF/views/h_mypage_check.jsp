<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<center>
    <%--<form action = "/pw_check" method="post">--%>
    <h4>현재 비밀번호를 입력해주세요</h4>
    <input type = "password" name = "pw" id = "pw"><br><br>
    <button type = "submit" onclick = "pw_check()">완료</button>
    <%--	</form>--%>
</center>
<script>
    function pw_check(){
        let pw = $("#pw").val()

        $.ajax({
            type:"POST",
            url:"/host/pw_check",
            data:{ pw:pw},
            success: function(isSuccess){
                if(isSuccess){
                    self.close();
                } else {
                    alert("현재 비밀번호를 다시 확인해주세요.");
                }

                window.opener.getReturnValue(isSuccess);
            },
            error: function (e){
                alert("수정 중 오류가 생겼습니다. 잠시 후 다시 이용해주세요.")
                console.log('실패',e);
            }
        });
    }
</script>

</body>
</html>