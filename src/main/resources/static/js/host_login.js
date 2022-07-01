$( function(){
    $( '#emailID').on("blur keyup", function() {
        $(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣 | ~!@\#$%<>^&*\()=+_\’]/g, '' ) );
    });
});

// $(function(){
//     $("#owner").keyup(function (event) {
//         regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
//         v = $(this).val();
//         if (regexp.test(v)) {
//             alert("한글만 입력가능 합니다.");
//             $(this).val(v.replace(regexp, ''));
//         }
//     });
// });

function loginSubmit() {
    let isFillOut = false;

    console.log('here');

    let name = $("#owner").val();
    let brand = $("#brand").val()
    let email = $("#emailID").val();
    let pw = $("#pw").val();
    let pwCheck = $("#pwCheck").val();
    let middle_phone = $("#phone1").val();
    let last_phone = $("#phone2").val();

    if (name === "") {
        alert("이름을 입력해주세요.");
        $("#owner").focus();
    }
    else if (brand === "") {
        alert("닉네임을 입력해주세요!");
        $("#brand").focus();
    } else if (email === "") {
        alert("이메일을 입력해주세요");
        $("#emailID").focus();
    } else if (pw === "") {
        alert("비밀번호를 입력해주세요!");
        $("#pw").focus();
    } else if (pwCheck === "") {
        alert("비밀번호를 다시 확인해주세요");
        $("#pwCheck").focus();
    } else if (pw !== pwCheck) {
        alert("비밀번호가 같지 않습니다.");
        $("#userPW").focus();
    } else if (middle_phone === "") {
        alert("전화번호를 입력해주세요");
        $("#phone1").focus();
    } else if (last_phone === "") {
        alert("전화번호를 입력해주세요");
        $("#phone2").focus();
    } else {
        isFillOut = true;
    }
    return isFillOut;
}

$(function(){
    $('#emailID').change(function(){
        let u_mail = document.getElementById('emailID').value + $('#emailAddr option:selected').val();
        console.log(u_mail);
        $.ajax({
            type:"POST",
            url:"/register/checkSignup",
            data:{u_mail : u_mail},
            success:function(data){	//data : checkSignup에서 넘겨준 결과값
                console.log($.trim(data));
                // alert(data.trim());
                if(data === "YES"){
                    if($('#emailAddr option:selected').val() ==='선택'){
                        $("#mail_check").text("사용 불가능한 아이디입니다.");
                        $("#mail_check").css("color", "red");
                    }else{
                        $("#mail_check").text("사용 가능한 아이디입니다.");
                        $("#mail_check").css("color", "blue");
                    }
                }else{
                    if($('#emailID').val()+$('#emailAddr option:selected').val() !==''){
                        $("#mail_check").text("사용중인 아이디입니다.");
                        $("#mail_check").css("color", "red");
                        $('#emailText').focus();
                    }
                }
            }

        });
    });
});

$(function(){
    $('#emailAddr').blur(function(){
        var u_mail = document.getElementById('emailID').value + $('#emailAddr option:selected').val();
        console.log(u_mail);
        $.ajax({
            type:"POST",
            url:"/register/checkSignup",
            data:{ u_mail : u_mail},
            success:function(data){	//data : checkSignup에서 넘겨준 결과값
                if(data === "YES"){
                    if($('#emailID').val() + $('#emailAddr option:selected').val() !==''){
                        $("#mail_check").text("사용 가능한 아이디입니다.");
                        $("#mail_check").css("color", "blue");
                    }
                }else{
                    if($('#emailID').val()+$('#emailAddr option:selected').val() !==''){
                        $("#mail_check").text("사용중인 아이디입니다.");
                        $("#mail_check").css("color", "red");
                        $('#emailText').focus();

                    }
                }
            }

        });
    });
});